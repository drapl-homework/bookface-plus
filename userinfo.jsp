<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

	<% request.setCharacterEncoding("UTF-8"); %>
	<%@include file="sqlConnection.jsp" %>
	<%
		String username=request.getParameter("username");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from account where username = ?;");
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String title = rs.getString("nickname") + "的用户信息";
		String nickname = rs.getString("nickname");
	%>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="<%=title%>"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
		<p>
		用户信息：
		昵称：<%=nickname%><br>
		性别：<%=rs.getString("sex")%><br>
		邮箱：<%=rs.getString("email")%><br>
		生日：<%=rs.getString("birthday")%><br>
		</p>
		<hr>
		<p>
		用户状态：
		<%
			stmt = conn.prepareStatement("select distinct message_id, account.username, nickname, time, content from message left join account on message.username = account.username where account.username = ? order by time desc;");

			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
			%>
						<p>
			昵称：<%=rs.getString("nickname")%><br>
			时间：<%=rs.getString("time")%><br>
			内容：<%=rs.getString("content")%><br>
			</p>
		<% } %>
		<hr>
		<p>
		<%
			String current_user = (String)session.getAttribute("username");
			stmt = conn.prepareStatement("select * from friend where username_1 = ? and username_2 = ?");
			stmt.setString(1, current_user);
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
		%>
			<p>已经将他添加为好友了！</p>
		<% } else { %>
			<form action="addFriend.jsp" method="post">
				<input type="hidden" name="username" value="<%=current_user%>">
				<input type="hidden" name="friend" value="<%=username%>">
				<input type="submit" value="加为好友">
			</form>
		<% } %>
		<hr>
		<p>
		<%
			stmt = conn.prepareStatement("select nickname as middle from friend a join friend b on a.username_2 = b.username_1 left join account on a.username_2 = account.username where a.username_1 = ? and b.username_2 = ?");
			stmt.setString(1, current_user);
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
		%>
			这个人是你好友的好友，你和他之间的具体关系路径为：你-<%=rs.getString("middle")%>-<%=nickname%>
		<% } else { %>
			这个人不是你好友的好友。
		<% } %>

			
	<jsp:include page="footer.jsp"/>
</body>
</html>


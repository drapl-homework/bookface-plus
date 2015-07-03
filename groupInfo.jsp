<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="sqlConnection.jsp" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		String group_id = request.getParameter("group_id");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from `group` where group_id = ?;");
		stmt.setString(1, group_id);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String group_name = rs.getString("group_name");
		String title = "用户组：" + group_name;
	%>

	<jsp:include page="head.jsp">
		<jsp:param name="title" value="<%=title%>"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<p>
	<%
		String username = (String)session.getAttribute("username");
		stmt = conn.prepareStatement("select * from group_member where group_id = ? and username = ?;");
		stmt.setString(1, group_id);
		stmt.setString(2, username);
		rs = stmt.executeQuery();
		if(!rs.next()) {
	%>
		我不是本组成员，<a href="<%="joinGroup.jsp?group_id=" + group_id%>">现在加入</a>。
		<% } else { %>
		我已经是本组成员，<a href="<%="joinGroup.jsp?quit=true&group_id=" + group_id%>">退出本群组</a>。
		<% } %>
	</p>
	<hr>
	<p>本组成员：</p>
	<%
		stmt = conn.prepareStatement("select * from group_member left join account on group_member.username = account.username where group_id = ?;");
		stmt.setString(1, group_id);
		rs = stmt.executeQuery();
		while (rs.next()) {
		%>
			<p>
			<a href="<%="userinfo.jsp?username=" + rs.getString("group_member.username")%>"><%=rs.getString("nickname")%></a>
			</p>
		<% } %>


	<form action="addGroup.jsp" method="post">	
		创建群组：
		<input type="textarea" name="group_name" />
		<input type="submit" value="提交" />
	</form>
	<hr>

	<jsp:include page="footer.jsp"/>
</body>
</html>


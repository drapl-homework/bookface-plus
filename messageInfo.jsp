<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

	<% request.setCharacterEncoding("UTF-8"); %>
	<%@include file="sqlConnection.jsp" %>
	<%
		String message_id = request.getParameter("message_id");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from message left join account on message.username = account.username where message_id = ?;");
		stmt.setString(1, message_id);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String title = rs.getString("nickname") + "的状态";
	%>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="<%=title%>"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
		<p>
		用户状态：
			<p>
			昵称：<%=rs.getString("nickname")%><br>
			时间：<%=rs.getString("time")%><br>
			内容：<%=rs.getString("content")%><br>
			</p>
		<hr>
		<p>
		评论：
	<%
		stmt = conn.prepareStatement(
			"select * from comment left join account on comment.username = account.username where message_id = ? order by time desc;");
		stmt.setString(1, message_id);
		rs = stmt.executeQuery();
		while (rs.next()) {
		%>
			<p>
			昵称：<%=rs.getString("nickname")%><br>
			时间：<%=rs.getString("time")%><br>
			内容：<%=rs.getString("content")%><br>
			</p>
		<% } %>

		<form action="addComment.jsp" method="post">	
		添加评论：
		<input type="textarea" name="message" />
		<input type="hidden" name="message_id" />
		<input type="submit" value="提交" />
	</form>
	<hr>
		
	<jsp:include page="footer.jsp"/>
</body>
</html>


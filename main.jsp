<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="sqlConnection.jsp" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="首页"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<p>关注的消息：</p>
	<%
		PreparedStatement stmt = conn.prepareStatement("select distinct message_id, account.username, nickname, time, content from message left join account on message.username = account.username order by time desc;");
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
		%>
			<p>
			昵称：<a href="<%="userinfo.jsp?username=" + rs.getString("account.username")%>" ><%=rs.getString("nickname")%></a><br>
			时间：<%=rs.getString("time")%><br>
			内容：<%=rs.getString("content")%><br>
			<a href="<%="messageInfo.jsp?message_id=" + rs.getString("message_id")%>">查看及回复评论</a>
			</p>
		<% } %>


	<form action="addMessage.jsp" method="post">	
		添加消息：
		<input type="textarea" name="message" />
		<input type="submit" value="提交" />
	</form>
	<hr>

	<jsp:include page="footer.jsp"/>
</body>
</html>


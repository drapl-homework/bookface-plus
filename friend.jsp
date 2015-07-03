<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%@include file="sqlConnection.jsp" %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="我的关注"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		String username = (String)session.getAttribute("username");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from friend_info where username = ?;");
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
	%>
		<p>
		昵称：<a href="<%="userinfo.jsp?username=" + rs.getString("friend")%>" ><%=rs.getString("nickname")%></a><br>
		性别：<%=rs.getString("sex")%><br>
		邮箱：<%=rs.getString("email")%><br>
		生日：<%=rs.getString("birthday")%><br>
		</p>
	<% } %>
	<jsp:include page="footer.jsp"/>
</body>
</html>


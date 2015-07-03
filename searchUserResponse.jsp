<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8");
	   response.setCharacterEncoding("UTF-8");%>
	<%@include file="sqlConnection.jsp" %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="我的关注"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<% String username_or_nickname = "%" + request.getParameter("username_or_nickname") + "%"; %>
	<p>你搜索的是：<%=request.getParameter("username_or_nickname")%></p>
	<%
		PreparedStatement stmt = conn.prepareStatement(
			"select * from account where username like ? or nickname like ?;");
		stmt.setString(1, username_or_nickname);
		stmt.setString(2, username_or_nickname);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
	%>
		<p>
		昵称：<a href="<%="userinfo.jsp?username=" + rs.getString("username")%>" ><%=rs.getString("nickname")%></a><br>
		性别：<%=rs.getString("sex")%><br>
		邮箱：<%=rs.getString("email")%><br>
		生日：<%=rs.getString("birthday")%><br>
		</p>
	<% } %>
	<jsp:include page="footer.jsp"/>
</body>
</html>


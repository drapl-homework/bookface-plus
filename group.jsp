<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="sqlConnection.jsp" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="用户组"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<p>用户组列表：</p>
	<%
		PreparedStatement stmt = conn.prepareStatement("select * from `group`;");
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
		%>
			<p>
			<a href="<%="groupInfo.jsp?group_id=" + rs.getString("group_id")%>" ><%=rs.getString("group_name")%></a><br>
			</p>
		<% } %>


	<form action="addGroup.jsp" method="post">	
		创建用户组：
		<input type="text" name="group_name" />
		<input type="submit" value="提交" />
	</form>
	<hr>

	<jsp:include page="footer.jsp"/>
</body>
</html>


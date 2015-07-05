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
	<div class="posts h_align">
		<h1 class="content-subhead">Search Result</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">搜索结果：<%=request.getParameter("username_or_nickname")%></h2>
		</header>
	</div>

	<%
		PreparedStatement stmt = conn.prepareStatement(
			"select * from account where username like ? or nickname like ?;");
		stmt.setString(1, username_or_nickname);
		stmt.setString(2, username_or_nickname);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
	%>
		<div class="posts h_align">
		<h1 class="content-subhead"></h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/user-avatar<%=rs.getString("avatar")%>.png">
		</header>
		<div class="post-description">
			<p>
		昵称：<a href="<%="userinfo.jsp?username=" + rs.getString("username")%>" ><%=rs.getString("nickname")%></a><br>
		性别：<%=rs.getString("sex")%><br>
		邮箱：<%=rs.getString("email")%><br>
		生日：<%=rs.getString("birthday")%><br>
		</p>
		</div>
	</div>

	<% } %>
	<jsp:include page="footer.jsp"/>
</body>
</html>


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

	<div class="posts h_align">
		<h1 class="content-subhead">My Friends</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">我的好友</h2>
		</header>
	</div>
	<%
		String username = (String)session.getAttribute("username");
		PreparedStatement stmt = conn.prepareStatement(
			"select username_1 as username, username_2 as friend, nickname, sex, email, birthday from friend left join account on username_2 = account.username where username_1 = ?;");
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
	%>
		<div class="posts h_align">
		<h1 class="content-subhead"></h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/test-avatar.png">
		</header>
		<div class="post-description">
			<p>
		昵称：<a href="<%="userinfo.jsp?username=" + rs.getString("friend")%>" ><%=rs.getString("nickname")%></a><br>
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


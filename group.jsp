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

	<!--用户组列表-->

	<div class="posts h_align">
		<h1 class="content-subhead">Group</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">用户组列表</h2>
		</header>
		<div class="post-description">
		<p>
		你可以加入感兴趣的用户组。
		</p>
</div>
</section>
</div>

	<%
		PreparedStatement stmt = conn.prepareStatement("select * from `group`;");
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
		%>
		<div class="posts h_align">
		<h1 class="content-subhead"></h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/test-avatar.png">

			<h2 class="post-title"><%=rs.getString("group_name")%></h2>
		</header>
		<div class="post-description">
		<p>
		小组介绍
		</p>
		<p>
			<a class="pure-button pure-button-primary" href="<%="groupInfo.jsp?group_id=" + rs.getString("group_id")%>">查看本组</a>
		</p>
		</div>
	</div>

		<% } %>


	<div class="posts h_align">
		<h1 class="content-subhead">Create Group</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">创建用户组</h2>
		</header>
		<div class="post-description">
			<p>
	<form class="pure-form pure-form-aligned" id="form_group">	
	<fieldset>
		<div class="pure-control-group">
			<label for="group_name">用户组名称</label>
			<input type="text" name="group_name" />
		</div>

		<div class="pure-control-group">
			<label for="group_intro">用户组介绍</label>
			<textarea  name="group_intro"></textarea>
		</div>
		<div class="pure-form pure-form-aligned pure-controls">
			<a class="pure-button pure-button-primary" onclick='$.post("addGroup.jsp", $("#form_group").serialize(), function (result) { alert(result); location.reload(true); }, "text").error(function() { alert("操作错误"); });'>创建</a>
		</div>
	</form>
	</p>
</div>
</section>
</div>

	<jsp:include page="footer.jsp"/>
</body>
</html>


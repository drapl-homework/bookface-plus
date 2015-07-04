<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8");
	   response.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="搜索用户"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="searchbox" class="posts">
		<h1 class="content-subhead">Search User</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">搜索用户</h2>
		</header>
		<div class="post-description">
			<p>
<form id="form_login" class="pure-form pure-form-aligned" method="post" action="searchUserResponse.jsp">
	<fieldset>
		<div class="pure-control-group">
			<label for="username_or_nickname">用户名或昵称</label>
			<input type="text" name="username_or_nickname" id="username_or_nickname">
		</div>
		<div class="pure-form pure-form-aligned pure-controls">
			<button class="pure-button pure-button-primary">搜索</button>
		</div>
	</fieldset>
	</form>
	</p>
</div>
</section>
</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>


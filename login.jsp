<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<script>
function mainLogin() {
    var data = $("#form_login").serialize();
    $.post("loginResponse.jsp", data, function (result) { alert(result); window.location.href="main.jsp"; }, "text").error(function() { alert('登录错误'); });;
}
	</script>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="登录"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="posts">
		<h1 class="content-subhead">Login</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">登录</h2>
		</header>
		<div class="post-description">
			<p>
<form id="form_login" class="pure-form pure-form-aligned">
	<fieldset>
		<div class="pure-control-group">
			<label for="username">用户名</label>
			<input type="text" name="username" id="username">
		</div>
		<div class="pure-control-group">
			<label for="password">密码</label>
			<input type="password" name="password" id="password">
		</div>
		<div class="pure-form pure-form-aligned pure-controls">
			<a class="pure-button pure-button-primary" onclick="mainLogin()">登录</a> <a href="register.jsp">注册</a>
		</div>
	</fieldset>
</form>
</div>
</div>

	<jsp:include page="footer.jsp"/>
</body>
</html>


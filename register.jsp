<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="注册"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="posts h_align">
		<h1 class="content-subhead">Register</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">注册</h2>
		</header>
		<div class="post-description">
			<p>

<form id="reg_form" class="pure-form pure-form-aligned" name="input">
	<fieldset>
		<div class="pure-control-group">
			<label for="username">用户名</label>
			<input type="text" name="username">
		</div>
		<div class="pure-control-group">
			<label for="nickname">昵称</label>
			<input type="text" name="nickname">
		</div>
		<div class="pure-control-group">
			<label for="password">密码</label>
			<input type="password" name="password">
		</div>
		<div class="pure-control-group">
			<label for="password">重复密码</label>
			<input type="password" name="password2">
		</div>
		<div class="pure-control-group">
			<label for="sex">性别</label>
			<select name="sex">
				<option value ="男">男</option>
				<option value ="女">女</option>
			</select>
		</div>
		<div class="pure-control-group">
			<label for="avatar">头像编号</label>
			<select name="avatar">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>
		</div>
		<div class="pure-control-group">
			<label for="email">邮箱</label>
			<input type="email" name="email">
		</div>
		<div class="pure-control-group">
			<label for="birthday">生日</label>
			<input type="date" name="birthday">
		</div>
		<div class="pure-controls">
			<a class="pure-button pure-button-primary" onclick='$.post("registerResponse.jsp", $("#reg_form").serialize(), function (result) { alert(result); window.location.href="login.jsp"; }, "text").error(function() { alert("注册错误"); });'>提交</a>
		</div>
	</fieldset>
	</form>
</div>
</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>


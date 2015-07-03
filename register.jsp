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
	<form action="registerResponse.jsp" method="post">
		用户名：<input type="text" name="username"></br>
		昵称：<input type="text" name="nickname"></br>
		密码：<input type="password" name="password"></br>
		重复密码：<input type="password" name="password2"></br>
		性别：
		<select name="sex">
			<option value ="男">男</option>
			<option value ="女">女</option>
		</select></br>
		邮箱：<input type="email" name="email"></br>
		生日：<input type="text" name="birthday"></br>
		<input type="submit" value="确认">
	</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>


<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="登录"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<form action="loginResponse.jsp" method="post">
		用户名：<input type="text" name="username"></br>
		密码：<input type="password" name="password"></br>
		<input type="submit" value="登录"></br>
	</form>
	<p>
	<a href="register.jsp">注册</a>
	</p>
	<jsp:include page="footer.jsp"/>
</body>
</html>


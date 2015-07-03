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
	<form action="searchUserResponse.jsp" method="post">
		用户名或昵称：<input type="text" name="username_or_nickname"></br>
		<input type="submit" value="搜索"></br>
	</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>


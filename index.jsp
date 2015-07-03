<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="首页"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	这是首页
	<jsp:include page="footer.jsp"/>
</body>
</html>


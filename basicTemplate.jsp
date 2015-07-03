<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="模板页面"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	内容
	<jsp:include page="footer.jsp"/>
</body>
</html>


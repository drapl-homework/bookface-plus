<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="关于我们"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="posts h_align">
		<h1 class="content-subhead">About</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">关于我们</h2>
		</header>
		<div class="post-description">
			<p>
			组员及分工<br>
			陈宇非（1300011775）：数据库设计和JSP<br>
			孙士涵（1200013235）：网页前端制作<br>
			沈  茜（1200015495）：撰写文档，完善数据库<br>
			张宇轩（1200015422）：查阅资料，测试系统<br>
			</p>
			</div>
		</section>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>


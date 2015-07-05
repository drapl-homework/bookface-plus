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
	<div class="posts h_align">
		<h1 class="content-subhead">Index</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">系统介绍</h2>
		</header>
		<div class="post-description">
			<p>
			本系统是社交网络系统，可以满足如下需求，且用户界面友好，使用简便：	
			</p>
			<p>
			1. 用户的注册，登录检查；<br>
			2. 允许用户查询自己的好友，允许用户 post自己的状态，查看和回复用户的状态；<br>
			3. 用户登录页面主页时，每隔30秒钟，如果用户的好友有更新的状态，自动更新最新的用户好友状态；<br>
			4. 查询用户的好友的好友的信息；输入一个用户名，如果他是你的2步以内的好友，则显示你们直接的具体关系路径；<br>
			5. 用户可以加入一些用户组。<br>
			</p>
			<p>

			</p>
			</div>
		</section>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>


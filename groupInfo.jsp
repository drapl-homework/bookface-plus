<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="sqlConnection.jsp" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		String current_user = (String)session.getAttribute("username");	
		String group_id = request.getParameter("group_id");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from `group` left join account on owner = account.username where group_id = ?;");
		stmt.setString(1, group_id);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String group_name = rs.getString("group_name");
		String group_intro = rs.getString("group_intro");
		String owner = rs.getString("owner");
		String nickname = rs.getString("nickname");
		String sex = rs.getString("sex");
		String email = rs.getString("email");
		String birthday = rs.getString("birthday");
		String avatar = rs.getString("avatar");
		String title = "用户组：" + group_name;
	%>

	<jsp:include page="head.jsp">
		<jsp:param name="title" value="<%=title%>"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
		<div class="posts h_align">
		<h1 class="content-subhead">Group Info</h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/group-avatar<%=rs.getString("group_avatar")%>.png">

			<h2 class="post-title"><%=group_name%></h2>
		</header>
		<div class="post-description">
		<p>
		<%=group_intro%>
		</p>

		<!--判断是否为本小组成员-->
	<p>
	<%
		String username = (String)session.getAttribute("username");
		stmt = conn.prepareStatement("select username from group_member where group_id = ? and username = ?;");
		stmt.setString(1, group_id);
		stmt.setString(2, username);
		rs = stmt.executeQuery();

		if(current_user.equals(owner)) { %>
		我是本组的创建者。

		<% } else if(!rs.next()) { %>
		我不是本组成员，<a class="pure-button pure-button-primary" onclick='$.get("joinGroup.jsp", { group_id: "<%=group_id%>" }, function (result) { alert(result); location.reload(true); }, "text" ).error(function() { alert("登录错误"); });'>现在加入</a>。

		<% } else { %>
		<div>
			<style scoped>
			.button-error {
				color: white;
				border-radius: 4px;
				text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
				background: rgb(202, 60, 60); /* this is a maroon */
			}
			</style>
			我已经是本组成员，<a class="button-error pure-button" onclick='$.get("joinGroup.jsp", { quit: "true", group_id: "<%=group_id%>" }, function (result) { alert(result); location.reload(true); }, "text" ).error(function() { alert("登录错误"); });'>退出本群组</a>。
		</div>
		<% } %>
	</p>

		</div>
	</div>

	<!--创建者信息-->
	<div class="posts h_align">
		<h1 class="content-subhead">Owner Info</h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/user-avatar<%=avatar%>.png">
			<h2 class="post-title">创建者信息</h2>
		</header>
		<div class="post-description">
		<p>
		昵称：<a href="<%="userinfo.jsp?username=" + owner%>" ><%=nickname%></a><br>
		性别：<%=sex%><br>
		邮箱：<%=email%><br>
		生日：<%=birthday%><br>
		</p>

		</div>
	</section>
	</div>




	<%
		stmt = conn.prepareStatement("select * from group_member left join account on group_member.username = account.username where group_id = ?;");
		stmt.setString(1, group_id);
		rs = stmt.executeQuery();
		int counter = 0;
		while (rs.next()) {
		%>
		<div class="posts h_align">
			<h1 class="content-subhead"><%if(counter++ == 0) {%>Member Info<%}%></h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/user-avatar<%=rs.getString("avatar")%>.png">
			<%if(counter == 1) {%><h2 class="post-title">成员列表</h2><%}%>
		</header>
		</header>
		<div class="post-description">
			<p>
		昵称：<a href="<%="userinfo.jsp?username=" + rs.getString("group_member.username")%>" ><%=rs.getString("nickname")%></a><br>
		性别：<%=rs.getString("sex")%><br>
		邮箱：<%=rs.getString("email")%><br>
		生日：<%=rs.getString("birthday")%><br>
		</p>
		</div>
	</div>

		<% } %>

	<jsp:include page="footer.jsp"/>
</body>
</html>


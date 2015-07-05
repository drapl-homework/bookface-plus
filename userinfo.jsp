<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

	<% request.setCharacterEncoding("UTF-8"); %>
	<%@include file="sqlConnection.jsp" %>
	<%
		String current_user = (String)session.getAttribute("username");
		String username=request.getParameter("username");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from account where username = ?;");
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String title = rs.getString("nickname") + "的用户信息";
		String nickname = rs.getString("nickname");
	%>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="<%=title%>"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="posts h_align">
		<h1 class="content-subhead">User Info</h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/user-avatar<%=rs.getString("avatar")%>.png">
			<h2 class="post-title">用户信息</h2>
		</header>
		<div class="post-description">
			<p>
		昵称：<%=nickname%><br>
		性别：<%=rs.getString("sex")%><br>
		邮箱：<%=rs.getString("email")%><br>
		生日：<%=rs.getString("birthday")%><br>
		<%
			stmt = conn.prepareStatement("select * from friend where username_1 = ? and username_2 = ?");
			stmt.setString(1, current_user);
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
		%>
		</p>

		<p>
				已经添加为好友了，<a class="pure-button pure-button-active" onclick='$.get("addFriend.jsp", { quit: "true", friend: "<%=username%>" }, function (result) { alert(result); location.reload(true); }, "text" ).error(function() { alert("操作错误"); });'>删除好友</a>
		</p>
		<% } else if(!current_user.equals(username)) { %>
		<p>
				你们还不是好友，<button class="pure-button pure-button-primary" onclick='$.get("addFriend.jsp", { friend: "<%=username%>" }, function (result) { alert(result); location.reload(true); }, "text" ).error(function() { alert("操作错误"); });'>加为好友</button>
		</p>
		<% } %>

		<p>
		<%
			stmt = conn.prepareStatement("select nickname as middle, account.username as username from friend a join friend b on a.username_2 = b.username_1 left join account on a.username_2 = account.username where a.username_1 = ? and b.username_2 = ?");
			stmt.setString(1, current_user);
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
		%>
		这个人是你好友的好友，你和他之间的具体关系路径为：你-<a href=<%="userinfo.jsp?username="+rs.getString("username")%>><%=rs.getString("middle")%></a>-<%=nickname%>
		<% } else if(!current_user.equals(username)) { %>
			这个人不是你好友的好友。
		<% } %>
		</p>

		</div>
	</section>
	</div>


		<%
			stmt = conn.prepareStatement("select distinct avatar, message_id, account.username, nickname, time, content from message left join account on message.username = account.username where account.username = ? order by time desc;");

			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
			%>
		<div class="posts h_align">
		<h1 class="content-subhead"></h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/user-avatar<%=rs.getString("avatar")%>.png">
			<p class="post-meta">
			作者：<a href="<%="userinfo.jsp?username=" + rs.getString("account.username")%>" ><%=rs.getString("nickname")%></a> &nbsp;&nbsp;&nbsp;&nbsp; 时间：<%=rs.getString("time")%><br>
			</p>
		</header>
		<div class="post-description">
			<p>
			<%=rs.getString("content")%>	
			</p>
		</div>
		</section>
		<a href="<%="messageInfo.jsp?message_id=" + rs.getString("message_id")%>"><button class="pure-button">评论区</button></a>
		</div>


		<% } %>
		
	<jsp:include page="footer.jsp"/>
</body>
</html>


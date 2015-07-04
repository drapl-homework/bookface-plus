<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
function addComment() {
    var data = $("#comment_form").serialize();
    $.post("addComment.jsp", data, function (result) { alert(result); location.reload(true); }, "text");
}
</script>

	<% request.setCharacterEncoding("UTF-8"); %>
	<%@include file="sqlConnection.jsp" %>
	<%
		String message_id = request.getParameter("message_id");
		PreparedStatement stmt = conn.prepareStatement(
			"select * from message left join account on message.username = account.username where message_id = ?;");
		stmt.setString(1, message_id);
		ResultSet rs = stmt.executeQuery();
		if (!rs.next()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		String title = rs.getString("nickname") + "的状态";
	%>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="<%=title%>"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />
		<div class="posts h_align">
		<h1 class="content-subhead">Message Info</h1>
		<section class="post">

		<header class="post-header">
			<h2 class="post-title">状态详情</h2>
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/test-avatar.png">
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
		</div>

		<p>
	<%
		stmt = conn.prepareStatement(
			"select * from comment left join account on comment.username = account.username where message_id = ? order by time;");
		stmt.setString(1, message_id);
		rs = stmt.executeQuery();
		while (rs.next()) {
		%>
		<div class="posts h_align">
		<h1 class="content-subhead">COMMENT</h1>
		<section class="post">

		<header class="post-header">
			<img class="post-avatar" alt="Tilo Mitra&#x27;s avatar" height="48" width="48" src="img/test-avatar.png">
			<p class="post-meta">
			评论作者：<a href="<%="userinfo.jsp?username=" + rs.getString("account.username")%>" ><%=rs.getString("nickname")%></a> &nbsp;&nbsp;&nbsp;&nbsp; 时间：<%=rs.getString("time")%><br>
			</p>
		</header>
		<div class="post-description">
			<p>
			<%=rs.getString("content")%>	
			</p>
		</div>
		</section>
		</div>


		<% } %>

	<div class="posts h_align" id="new_message">
		<h1 class="content-subhead">Message</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">发布评论</h2>
		</header>
		<div class="post-description">
			<p>
		<form id="comment_form" class="pure-form" method="post">
			<fieldset class="pure-group">
				<textarea class="pure-input-1" placeholder="谈谈你的看法" name="content"></textarea>
				<input type="hidden" name="message_id" value=<%=message_id%>>
			</fieldset>
		</form>
			<a class="pure-button pure-input-1 pure-button-primary" onclick="addComment()">发布</a>
		</p>
		</div>
		</section>
		</div>

<!--		<form action="addComment.jsp" method="post">	
		添加评论：
		<input type="textarea" name="message" />
		<input type="hidden" name="message_id" />
		<input type="submit" value="提交" />
	</form>
-->
		
	<jsp:include page="footer.jsp"/>
</body>
</html>


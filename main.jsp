<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
function addMessage() {
    var data = $("#message_form").serialize();
    $.post("addMessage.jsp", data, function (result) { alert(result); location.reload(true); }, "text");
}

function clickTips() {
	$("#updatedButton").remove();
}

function checkUpdate() {
	$.ajax({
			url : "checkUpdate.jsp",
			type : "get"
	}).done(function(e) {
		if(e.trim()) {
			$(e).insertAfter('#update_tips');
			clickTips();
			$("<button id=\"updatedButton\" class=\"pure-button\" onclick=\"clickTips()\">发现新消息，已经自动刷新</button>").appendTo("#update_tips");
		} else {
			clickTips();
			$("<button id=\"updatedButton\" class=\"pure-button\" onclick=\"clickTips()\">过去30秒没有发现新消息</button>").appendTo("#update_tips");
		}
	}).fail(function(){
		alert('Server Error!');
	});
}

timeId = setInterval("checkUpdate();",30000);

	</script>

	<%@include file="sqlConnection.jsp" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="head.jsp">
		<jsp:param name="title" value="首页"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="header.jsp" />

	<%
	// Check login.
	String username = (String)session.getAttribute("username");
	if(username == null) {
		response.sendError(HttpServletResponse.SC_FORBIDDEN);

		return;
	};
	%>
		
	<div class="posts h_align" id="new_message">
		<h1 class="content-subhead">Message</h1>
		<section class="post">
		<header class="post-header">
			<h2 class="post-title">发布状态</h2>
		</header>
		<div class="post-description">
			<p>
		<form id="message_form" class="pure-form" method="post">
			<fieldset class="pure-group">
				<textarea class="pure-input-1" placeholder="倾诉你的感情" id="message" name="message"></textarea>
			</fieldset>
		</form>
			<a class="pure-button pure-input-1 pure-button-primary" onclick="addMessage()">发布</a>
		</p>
		</div>
		</section>
		</div>

	<div class="h_align" id="update_tips">
	</div>	

	<%
		PreparedStatement stmt = conn.prepareStatement("select distinct message_id, account.username, nickname, time, content from message left join account on message.username = account.username where account.username in ( select username_2 from friend where username_1 = ?) or account.username = ? order by time desc;");
		stmt.setString(1, username);
		stmt.setString(2, username);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
		%>
		<div class="posts h_align">
		<h1 class="content-subhead"></h1>
		<section class="post">

		<header class="post-header">
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
		<a href="<%="messageInfo.jsp?message_id=" + rs.getString("message_id")%>"><button class="pure-button">评论区</button></a>
		</div>

		<% } %>

	<jsp:include page="footer.jsp"/>
</body>
</html>


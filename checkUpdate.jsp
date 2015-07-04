<%@page language="java" import="java.net.URLDecoder" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username=(String)session.getAttribute("username");

	if(username == null)
	{
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//Querying from database
	PreparedStatement stmt = conn.prepareStatement(
		"select * from message left join account on message.username = account.username where time >= DATE_SUB(NOW(), INTERVAL 30 SECOND) and message.username in ( select username_2 from friend where username_1 = ?) order by time desc;");
		
	stmt.setString(1, username);
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

	<% }
%>


<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="sqlConnection.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<p>
<%
	String username = (String)session.getAttribute("username");
	if(username == null) { %>
		欢迎来到Bookface+，请<a href="login.jsp">登录</a>
	<% } else {
		String nickname = null;
		PreparedStatement stmt = conn.prepareStatement(
			"select nickname from `account` where username = ?;");
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		if (rs.next())
			nickname = rs.getString(1);
		%>
		<%=nickname%>，你好！ |
		<a href="main.jsp">首页</a> | 
		<a href="friend.jsp">好友</a> | 
		<a href="group.jsp">群组</a> | 
		<a href="searchUser.jsp">搜索用户</a> |
		<a href="logout.jsp">注销</a>
	<% }
%>
		</p>
		<hr>

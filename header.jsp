<%@ page contentType="text/html;charset=utf-8"%>
<%@include file="sqlConnection.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">Bookface+</h1>
            <h2 class="brand-tagline">极为先进的社交网络系统</h2>

<%
	String username = (String)session.getAttribute("username");
	if(username == null) { %>
            <nav class="nav">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a class="pure-button" href="login.jsp">登录</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="register.jsp">注册</a>
                    </li>
                </ul>
            </nav>
	<% } else {
		String nickname = null;
		PreparedStatement stmt = conn.prepareStatement(
			"select nickname from `account` where username = ?;");
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		if (rs.next())
			nickname = rs.getString(1);
		%>
            <h3><%=nickname%>，欢迎使用！</h3>
            <nav class="nav">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a class="pure-button" href="main.jsp">首页</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="friend.jsp">好友</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="group.jsp">群组</a>
                    </li>
                    <li class="nav-item">
			<a class="pure-button" href="searchUser.jsp">搜索用户</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="logout.jsp">注销</a>
                    </li>
                </ul>
            </nav>
	<% }
%>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">

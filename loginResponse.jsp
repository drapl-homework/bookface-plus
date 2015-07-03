<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username=request.getParameter("username");
	String password=request.getParameter("password");

	if(username == null || password == null ||
		username == "" || password == "" )
	{
		conn.close();
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//Querying from database
	PreparedStatement stmt = conn.prepareStatement(
		"SELECT password from account where username = ? LIMIT 1;");
	stmt.setString(1, username);
	ResultSet rs = stmt.executeQuery();
	if (!rs.next() || ! rs.getString("password").equals(password)){
		conn.close();
		stmt.close();
		response.sendError(HttpServletResponse.SC_FORBIDDEN);
		out.println("用户名或密码错误！");
		return;
	}
	out.println("登录成功！");
	session.setAttribute("login","ok");
	session.setAttribute("username", username);
%>


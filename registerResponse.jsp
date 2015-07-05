<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username=request.getParameter("username");
	String nickname=request.getParameter("nickname");
	String password=request.getParameter("password");
	String sex=request.getParameter("sex");
	String email=request.getParameter("email");
	String avatar=request.getParameter("avatar");
	String birthday=request.getParameter("birthday");

	if(username == null || password == null ||
		username == "" || password == "" )
	{
	}

	//Querying from database
	PreparedStatement stmt = conn.prepareStatement(
		"INSERT into account values(?, ?, ?, ?, ?, ?, ?);");
	stmt.setString(1, username);
	stmt.setString(2, nickname);
	stmt.setString(3, password);
	stmt.setString(4, sex);
	stmt.setString(5, email);
	stmt.setString(6, avatar);
	stmt.setString(7, birthday);

	try {
		stmt.executeUpdate();
	} catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
		conn.close();
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	out.println("注册成功，请在登录页面登录！");
%>


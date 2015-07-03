<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username=(String)session.getAttribute("username");
	String friend=request.getParameter("friend");

	if(username == null)
	{
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//Querying from database
	PreparedStatement stmt = conn.prepareStatement(
		"INSERT INTO friend values(?, ?)");
	stmt.setString(1, username);
	stmt.setString(2, friend);

	try {
		stmt.executeUpdate();
	} catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
		conn.close();
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	out.println("添加成功！");
%>


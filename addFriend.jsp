<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username=(String)session.getAttribute("username");
	String friend=request.getParameter("friend");

	String quit = request.getParameter("quit");

	if(username == null)
	{
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	String sql = null;
	if(quit != null)
		sql = "DELETE FROM friend where username_1 = ? and username_2 = ?";
	else
		sql = "INSERT INTO friend values(?, ?)";
	//Querying from database
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, username);
	stmt.setString(2, friend);

	try {
		stmt.executeUpdate();
	} catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
		conn.close();
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	out.println("操作成功！");
%>


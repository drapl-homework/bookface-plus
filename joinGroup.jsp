<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username = (String)session.getAttribute("username");
	String group_id = request.getParameter("group_id");
	String quit = request.getParameter("quit");

	if(username == null)
	{
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//Querying from database
	String sql = null;
	if(quit != null)
		sql = "DELETE FROM `group_member` where group_id = ? and username = ?;";
	else
		sql = "INSERT INTO `group_member` values(?, ?);";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, group_id);
	stmt.setString(2, username);


	try {
		stmt.executeUpdate();
	} catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
		conn.close();
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	out.println("操作成功！");
%>


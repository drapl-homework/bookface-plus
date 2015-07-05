<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="sqlConnection.jsp" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	//Get params
	String username = (String)session.getAttribute("username");
	String group_name = request.getParameter("group_name");
	String group_avatar = request.getParameter("group_avatar");
	String group_intro = request.getParameter("group_intro");

	if(username == null)
	{
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//Querying from database
	PreparedStatement stmt = conn.prepareStatement(
		"INSERT INTO `group`(group_name, group_intro, group_avatar, owner) values(?, ?, ?, ?);");
	stmt.setString(1, group_name);
	stmt.setString(2, group_intro);
	stmt.setString(3, group_avatar);
	stmt.setString(4, username);

	try {
		stmt.executeUpdate();
	} catch(com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
		conn.close();
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	out.println("创建成功！");
%>


<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String DBUser = "bookfaceplus";
	String DBPasswd = "bookfaceplus";
	String DBName = "bookfaceplus";
	String MySQLServer = "localhost";
	String MySQLServerPort = "3306";

	String connUrl = "jdbc:mysql://"+MySQLServer+":"+MySQLServerPort+"/" + DBName + "?useUnicode=true&characterEncoding=utf-8&user="
		+ DBUser + "&password=" + DBPasswd ;

	Class.forName(driverName).newInstance();
	Connection conn = DriverManager.getConnection(connUrl);
%>

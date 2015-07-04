<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("username", null);
    session.invalidate(); 
    response.sendRedirect("index.jsp");
%>%                                                      

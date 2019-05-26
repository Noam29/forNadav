<%@ page  language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>


<%
	
	String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	Connection con = DriverManager.getConnection(url, "root", "12345678");
	Statement s = con.createStatement();
	String user = request.getParameter("value");
	
	String deleteUser="DELETE FROM users WHERE username='" + user +"'";
	String deleteTable="DROP TABLE " + user;
	
	s.executeUpdate(deleteUser);
	s.executeUpdate(deleteTable);
	
	response.sendRedirect("admin.jsp");
%>
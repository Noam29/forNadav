<%@ page  language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>

<%
	String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	Connection con = DriverManager.getConnection(url, "root", "12345678");
	Statement s = con.createStatement();
	
	String user = (String)session.getAttribute("username");
	String name = request.getParameter("nameInput1");
	String stock =request.getParameter("stockInput1");
	
	String sql_getCounter = "SELECT counter FROM users WHERE username= '" + user + "'";
	String sql_updateCounter = "UPDATE users SET counter=counter+1 WHERE username= '" + user + "'";
	
	ResultSet rs = s.executeQuery(sql_getCounter);
	rs.next();
	int counter = rs.getInt(1);

    String sql = "INSERT INTO " + user + " VALUES('"+ counter +"','"+ name +"','"+ stock +"','0')";
    s.executeUpdate(sql);
    
    s.executeUpdate(sql_updateCounter);
    
    response.sendRedirect ("app.jsp");
%>
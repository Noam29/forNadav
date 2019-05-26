<%@ page  language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>

<%

String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection con = DriverManager.getConnection(url, "root", "12345678");
Statement s = con.createStatement();

String user = (String)session.getAttribute("username");
String num = request.getParameter("rowNum");

String sql_removeRow = "DELETE FROM " + user + " WHERE num='" + num +"';";
s.executeUpdate(sql_removeRow);

response.sendRedirect ("app.jsp");

%>
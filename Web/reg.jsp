
<%@ page  language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>

<%

  String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
  Connection con = DriverManager.getConnection(url, "root", "12345678");
  Statement s = con.createStatement();

  String user=request.getParameter("username");

  String sql="SELECT * FROM users WHERE username= '" + user + "'";

  ResultSet rs = s.executeQuery(sql);
  
  boolean flag = rs.next();


  if (flag)
    response.sendRedirect ("singup.jsp");
  else {
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String pass = request.getParameter("password1");
    String mail = request.getParameter("email1");

    String sql1 = "INSERT INTO users VALUES('"+ user +"','"+ pass +"','"+ mail +"','"+ firstname +"','"+ lastname +"', '0')";
    s.executeUpdate(sql1);
    
    String createTable = "CREATE TABLE `noam`.`"+ user +"` (`num` INT NOT NULL,  `name` VARCHAR(45) NULL, `stock` INT NULL, `pending` INT NULL, PRIMARY KEY (`num`));";
    s.executeUpdate(createTable);
    
    response.sendRedirect ("login.html");
  }

%>

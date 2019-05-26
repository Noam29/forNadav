<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

<%     
	session.setAttribute("login","guest");

	String user = request.getParameter("username");
    String pass = request.getParameter("password1");

     String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	  Connection con = DriverManager.getConnection(url, "root", "12345678");
      Statement s = con.createStatement();

      String sql = "SELECT * FROM users WHERE username = '" + user + "' AND password = '" + pass + "'";
      ResultSet rs = s.executeQuery(sql);
          
		if (!rs.next())     //We didn't find this user
			response.sendRedirect("login.html");
		else {
			session.setAttribute("username",user);
			
			//checking if this user is the admin
			if (user.equals("admin")) {
				session.setAttribute("login", "admin");
				response.sendRedirect ("app/admin.jsp");
				
			} else {
				
				session.setAttribute("login", "member");
				response.sendRedirect("app/app.jsp"); 
				
			}
		}

%>
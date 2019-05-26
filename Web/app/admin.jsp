<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
	<%
		String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url, "root", "12345678");
		Statement s = con.createStatement();
		String sql=" SELECT * FROM users";
		ResultSet rs = s.executeQuery(sql);
		
		String user;
	%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<title>Admin</title>
	</head>
	<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Werehouse manegment</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link" href="app.jsp">Admin Page <span class="sr-only">(current)</span></a>
          </div>
        </div>
        <form class="form-inline my-2 my-lg-0">
	      <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Log Out</button>
	    </form>
      </nav>
	
	<br><br>
	<div class="container">
		<table class="table table-hover" id="usersList">
	    	<thead class="thead-light">
	          <tr>
	            <th scope="col">User Name</th>
	            <th scope="col">Password</th>
	            <th scope="col">Email</th>
	            <th scope="col">First Name</th>
	            <th scope="col">Last Name</th>
	            <th scope="col"></th>
	          </tr>
	        </thead>
	        <tbody>
	          <%
	          while(rs.next()){ 
		          user = rs.getString(1);
		          if(!user.equals("admin")){
		          %>
			          <tr>
			          <td><%=user%></td>
			          <td><%=rs.getString(2)%></td>
			          <td><%=rs.getString(3)%></td>
			          <td><%=rs.getString(4)%></td>
			          <td><%=rs.getString(5)%></td>
			          <td><a href="adminDelete.jsp?value=<%=user%>">Delete</a></td>
			          </tr>
	         	 <%}} %>
	        </tbody>
		</table>
	</div>
	
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>
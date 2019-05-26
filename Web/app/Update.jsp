<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
	<%
		String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url, "root", "12345678");
		Statement s = con.createStatement();
		String user = (String)session.getAttribute("username");
		String sql = "SELECT * FROM users WHERE username = '" + user + "'";
	    ResultSet rs =s.executeQuery(sql);
	    rs.next();
		
		if(request.getMethod().equals("POST")){
			System.out.println("dsdsdsds");
			String firstname = request.getParameter("firstname");
		    String lastname = request.getParameter("lastname");
		    String pass = request.getParameter("password");
		    String mail = request.getParameter("email");
			
			String sql1 ="UPDATE users SET password='" + pass + "' , email='" + mail + "' , firstName='" + firstname + "' , lastName='" + lastname + "' WHERE username='" + user + "'";
			s.executeUpdate(sql1);
			response.sendRedirect("app.jsp");
		}else{
	%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<link rel="stylesheet" 
      href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" 
      integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" 
      crossorigin="anonymous">
	<title>Update</title>
</head>
<body>
<div class="container-fluid">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Werehouse manegment</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link" href="app.jsp">Products <span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link active" href="Update.jsp">Update Profile</a>
          </div>
        </div>
        <form class="form-inline my-2 my-lg-0">
	      <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Log Out</button>
	    </form>
      </nav>
      
      <div class="container">
      <h1 class="display-4">Update Your Profile</h1>
      <form action="Update.jsp" method="post" name="update">
      <table class="table" id="products">
        <tbody>
          <tr><td>
          	<input type="text" class="form-control" value="<%=rs.getString("firstName")%>" name="firstname">
          </td></tr>
          <tr><td>
          	<input type="text" class="form-control" value="<%=rs.getString("lastName")%>" name="lastname">
          </td></tr>
          <tr><td>
          	<input type="text" class="form-control" value="<%=rs.getString("email")%>" name="email">
          </td></tr>
          <tr><td>
	          <div class="input-group mb-3">
		          <input type="text" class="form-control" value="<%=rs.getString("password")%>" name="password" id="pass">
		          <div class="input-group-append">
				    <span class="input-group-text">
				    <button type="button" class="btn light fa fa-eye" onclick="showPass()"></button>
				    </span>
				  </div>
	          </div>
          </td></tr>
          <tr><td>
          	<input type="text" class="form-control" placeholder="Confirme password">
          </td></tr>
          <tr><td>
          	<input type="submit" value="Submit" class="btn btn-outline-success mb-2">
          </td></tr>
        </tbody>
      </table>
      </form>
      
      
    </div>
    
    
    <script>
	function showPass() {
		var x = document.getElementById("pass");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
	</script>
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
<%}%>
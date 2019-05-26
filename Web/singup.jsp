<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
   <%
		String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url, "root", "12345678");
		Statement s = con.createStatement();
		String user=request.getParameter("username");
		String firstname = request.getParameter("firstname");
	    String lastname = request.getParameter("lastname");
	    String pass = request.getParameter("password1");
	    String mail = request.getParameter("email1");
	    String sql;
	    ResultSet rs;
	    boolean flag;
	%>
<!DOCTYPE html>
<html>
<head>
	<title>warehouse management</title>
	<link rel="stylesheet" href="forms.css">
	<script src="regScript.js"></script>
</head>
<body onload="valueEnter()">

 	<div class="navbar">aa</div>
 	<a href="index.html" class="home-button">

 		<div class="logo">
 		<img src="photos/logo.png">
 		<img class="img-top" src="photos/logo-hover.png">

 		</div>
 		WHMS
 	</a>
 	<a href="login.html" id="login-button">Login</a>

 	<center class="info">
 		<div class="navbar" id="info-background">a<br><br><br><br><br><br><br><br></div>
 		<div class="info-text" id="S-form">
	 	  <form action="reg.jsp" name="reg" onsubmit="return allCheck();" method="post" id="regAuto">
		    <label for="fname">First Name <b style="color: red; display: none;" id="fNameError"> Not Vaild</b></label>
		    <input type="text" id="fname" name="firstname" placeholder="Your name..">

		    <label for="lname">Last Name <b style="color: red; display: none;" id="lNameError"> Not Vaild</b></label>
		    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

		    <label for="Uname">
					Username
					<b style="color: red; display: none;" id="uNameError"> Not Vaild</b>
					<b style="color: red; display: none;" id="uNameFoundError"> User Name Already Exsist</b>
			</label>
		    <input type="text" id="Uname" name="username" onblur="userCheck()" placeholder="Your username..">

		    <label for="email">Email <b style="color: red; display: none;" id="emailError"> Not Vaild</b></label>
		    <input type="text" id="email" name="email1" placeholder="Your email address..">

		    <label for="pass">Password <b style="color: red; display: none;" id="passError"> Not Vaild(need at least 6 charecter)</b></label>
		    <input type="text" id="password" name="password1" placeholder="Your new password..">

		    <label for="passC">Password Confirm <b style="color: red; display: none;" id="confPassError"> Password Confirm Not Match</b></label>
		    <input type="text" id="password" name="passwordConf" placeholder="Type password again...">

		    <input type="submit" value="Submit" id="autoSubmit">
		  </form>
 		</div>
 	</center>
	
	<script>
	function userCheck(){
			var form = document.getElementById("regAuto");
			form.action = 'singup.jsp';
			form.submit();
		}
		function valueEnter(){
			if("<%=firstname%>" != "null")
				document.getElementById("fname").value = "<%=firstname%>";
			if("<%=lastname%>" != "null")
				document.getElementById("lname").value = "<%=lastname%>";
			if("<%=user%>" != "null")
				document.getElementById("Uname").value = "<%=user%>";
			if("<%=mail%>" != "null")
				document.getElementById("email").value = "<%=mail%>";
			if("<%=pass%>" != "null")
				document.getElementById("password").value = "<%=pass%>";
			<%
			user=request.getParameter("username");
			flag = false;
			if(user != null){
				sql="SELECT * FROM users WHERE username= '" + user + "'";
				rs = s.executeQuery(sql);
				
				flag = rs.next();
			}
			%>
			if("<%=user%>" != "null"){
				if("<%=flag%>" == "true"){
					document.getElementById("uNameFoundError").style.display = "inline";
					conf = false;
				}
			}
		}			
	</script>
</body>
</html>
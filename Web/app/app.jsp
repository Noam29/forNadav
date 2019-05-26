<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
	<%
		String url = "jdbc:mysql://localhost:3306/noam?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url, "root", "12345678");
		Statement s = con.createStatement();
		//session.setAttribute("username","noam29");
		String user = (String)session.getAttribute("username");
		String sql="SELECT * FROM "+ user;
	%>
<!DOCTYPE html>
<html>
	<head>
	<!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
		<title>Welcome</title>
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
            <a class="nav-item nav-link active" href="#">Products <span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="Update.jsp">Update Profile</a>
          </div>
        </div> 
        <form class="form-inline my-2 my-lg-0">
	      <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Log Out</button>
	    </form>
      </nav>
    </div>

    <br><br>

    <div class="container">
      <h1 class="display-4">Products List</h1>
      <br>

      <form id="productInfo"  action="addNewRow.jsp" onsubmit="return addNewRow();" method="post" name="addRow">
	    <div class="form-row align-items-center">
		    <div class="col-auto">
		      <label class="sr-only" for="inlineFormInput">Name</label>
		      <input type="text" class="form-control mb-2" id="nameInput" name="nameInput1" placeholder="Product Name">
		    </div>
		    <div class="col-auto">
		      <label class="sr-only" for="inlineFormInput">Stock</label>
		      <input type="text" class="form-control mb-2" id="stockInput" name="stockInput1" placeholder="Product Amount">
		    </div>
		    <div class="col-auto">
		        <input id ="add" type="submit" value="Submit" class="btn btn-outline-success mb-2">
		    </div>
	    </div>
	  </form>
      <br>
      <table class="table table-hover" id="products">
        <thead class="thead-light">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Stock</th>
            <th scope="col">Pending</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
          
          
          <!-- example -->
          <!--<tr id="rmv1">
            <th scope="row">1</th>
            <td>8GB x4 Ram Sticks</td>
            <td>33</td>
            <td>2</td>
            <td>
            	<button id="rmv1" type="button" class="btn btn-outline-danger">remove</button>
            	<button type="button" class="btn btn-outline-info">Info</button>
            </td>
          </tr>
          <tr id="rmv2">
            <th scope="row">2</th>
            <td>Intel i7 8700K 4.0Ghz</td>
            <td>11</td>
            <td>5</td>
            <td>
            	<button id="rmv2" type="button" class="btn btn-outline-danger">remove</button>
            	<button type="button" class="btn btn-outline-info">Info</button>
            </td>
          </tr>
          <tr id="rmv3">
            <th scope="row">3</th>
            <td>Full Tower Case ATX</td>
            <td>6</td>
            <td>1</td>
            <td>
            	<button id="rmv3" type="button" class="btn btn-outline-danger">remove</button>
            	<button type="button" class="btn btn-outline-info">Info</button>
            </td>  -->
        </tbody>
      </table>
    </div>

    <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link" href="#" tabindex="-1">Previous</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>



	<script>

    var productsTable = document.getElementById("products").getElementsByTagName('tbody')[0];
    document.getElementById("add").addEventListener("click", addRow);
    
    <%ResultSet rs = s.executeQuery(sql);%>
    
    //getting the rows from the database
    <% while(rs.next()){ %>
    	addRow_fromSql(<%=rs.getInt(1)%>, "<%=rs.getString(2)%>", <%=rs.getInt(3)%>, <%=rs.getInt(4)%>);
    <%}%>
    
    //getting the products data from the database to the table
    function addRow_fromSql(num, name, stock, pending){
    	//create the new row
    	var row = productsTable.insertRow();
	    var cell1 = row.insertCell(0); //row number cell
	    var cell2 = row.insertCell(1); // name cell
	    var cell3 = row.insertCell(2); // stock cell 
	    var cell4 = row.insertCell(3); //pending cell
	    var cell5 = row.insertCell(4); //actions cell
	    
	  	//getting the row number
        cell1.innerHTML = num;
        cell1.classList.toggle("font-weight-bold");
      	//getting input in the new table row
        cell2.innerHTML = String(name);
        //getting input in the new table row
        cell3.innerHTML = stock;
      	//putting zero in the pending column
        cell4.innerHTML = pending;
      	//creating remove and info button
        rowRemoveForm(cell5, num);
    }
    
    //create the remove button form in the table row
    function rowRemoveForm(cell, num){
    	//create the form
    	var f = document.createElement("form");
    	f.setAttribute('method',"post");
    	f.setAttribute('action',"removeRow.jsp");
    	f.setAttribute('name',"remove");
    	//creating remove button
    	var buttonR = document.createElement("button");
        buttonR.innerHTML = "Remove";
        buttonR.classList.toggle("btn");
        buttonR.className += " btn-outline-danger";
        //creating the info button
        var buttonI = document.createElement("button");
        buttonI.innerHTML = "Info";
        buttonI.classList.toggle("btn");
        buttonI.className += " btn-outline-info";
        buttonI.style.marginLeft = "5px";
        //let the the jsp get the row number
        var val = document.createElement("input"); //input element, text
        val.style.display = "none";
        val.setAttribute('type',"text");
        val.setAttribute('name',"rowNum");
        val.setAttribute('value', num);
        
        cell.appendChild(f);
        f.appendChild(buttonR);
        f.appendChild(buttonI);
        f.appendChild(val);
    }
    
    // Adding row to the table
    function addNewRow(){
        var stockInput = document.getElementById("stockInput").value;
        
        if (!isNaN(stockInput)) { //checks if the input is valid
            return true;
        }//if
        else {
            alert("Wrong Input");
            return false;
        }//else
    }//addRow

    //removing rows from the table
    function removeRow(button){
        const row = button.parentNode.parentNode;
        //gets the name of the product
        const name = row.getElementsByTagName("TD")[1].innerHTML;
        if (confirm("Do you want to delete: " + name)) {
            //Delete the Table row using it's Index.
            productsTable.deleteRow(row.rowIndex - 1);
        }//if
    }//removeRow

  </script>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>
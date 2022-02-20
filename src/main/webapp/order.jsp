<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String userid = "db_gryffindor";
String password = "system";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>    
<!-- END SERVLET FOR RETRIEVE CATEGORY -->   
     <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<title>Buyer Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<div class="frame">
<img src="" alt="" style="height:50px;">
    <center><img src="imagesM/MASMED.png" alt="" style="height:60px;"></center>
</div>
<body>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" class="active" href="homeB.jsp">Home</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn">BUYER <img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">Order History</a>
		  <a href= "loginBuyer.jsp">Logout</a>
		</div>
	 </div>
	</div><br>
	
	<h3><center>ORDER</center></h3>
	
	<div >
  		<table class="center" style="width:80%;">
  		
  		
		<center>
		<form method="post" action="orderController">
		<br>
		
			<div class="form-row">
						<div class="form-group col-md-6 col-sm-6">
							<label for="name"><b>Name</b></label> <input type="text" style="width:400px;"
								class="form-control" name="name" id="name" value="" readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="num"><b>Phone Number</b></label> <input style="width:400px;"
								type="text" class="form-control" name="num" id="num" value="" readonly>
						</div><br><br>
						
						<div class="form-group col-md-6">
							<label for="num"><b>Address</b></label> <input style="width:400px;"
								type="text" class="form-control" name="num" id="num" value="" readonly>
						</div>
			</div>
					
			<hr>
			
			<div class="form-row">
						<div class="form-group col-md-6"">
							<label for="name"><b>Payment Method:</b></label><br> Online transfer only
						</div><br>
						<div class="form-group col-md-6 col-sm-6">
							<label for="num"><b>Product Name:</b></label>
							<br>
						</div><br>
						
						<div class="form-group col-md-6 col-sm-6">
							<label for="name"><b>Quantity:</b></label><br> 
						</div>
						<div class="form-group col-md-6 col-sm-6">
							<label for="num"><b>Price: RM </b></label><br>
							<% %>
							<br>
						</div><br>
			</div>
			
			<input type="hidden" name="bID" id="bID" value=" "/>
				
			
			
			
			<input type="submit" value="confirm order">
		</form>	
		</center>
		</table>
	</div>
	
</body>
</html>
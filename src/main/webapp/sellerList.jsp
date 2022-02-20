<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- SERVLET FOR RETRIEVE BUYER -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sID = request.getParameter("sID");
String aID = request.getParameter("aID");
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
<!-- END SERVLET FOR RETRIEVE BUYER -->
<!DOCTYPE html>
<html>
<head>
	<style>	
	table {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 80%;
	  float: center;
	}
	
	td, th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	tr:nth-child(odd){background-color: white;}
	tr:nth-child(even){background-color: #f2f2f2;}
	tr:hover {background-color: #ddd;}
	
	th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  text-align: left;
	  background-color: purple;
	  color: white;
	}
	</style>
	
	<meta charset="ISO-8859-1">
	<title>Seller List</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<div class="frame" style="background-image: url('imagesM/background2.jpg');  background-size: cover;">
<br>
<h1 style="text-align: center; color:#420B89;">
ADMINISTRATOR
</h1>
</div>
<body>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" href="homeA.jsp">Home</a>
    <a id="left" href="adminList.jsp">Admin</a>
    <a id="left" class="active" href="sellerList.jsp">Seller</a>
    <a id="left" href="buyerList.jsp">User</a>
  	</div>
	<div class="dropdown">
		<button class="dropbtn"><img src="imagesM/avatar.png" alt="Avatar" class="avatar">ADMIN
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="loginAdmin.jsp">Logout</a>
		</div>
	 </div>
	</div>
	
	<div>
	<h1 align="center" style="color: #420B89">SELLER</h1>
		<table align="center">
			<tr></th>
				<th>No</th>
				<th>Name</th>
				<th>Shop Name</th>
				<th>Email</th>
				<th>Account Number</th>
				<th>Action</th>
			</tr>
			<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from seller";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		
		<tr>
			<td><center><%=resultSet.getString("sID")%></center></td>
			<td><center><%=resultSet.getString("sName")%></center></td>
			<td><center><%=resultSet.getString("shopName")%></center></td>
			<td><center><%=resultSet.getString("sEmail")%></center></td>
			<td><center><%=resultSet.getString("accNo")%></center></td>
			<td><center><a href="viewSellerList.jsp?sID=<%=resultSet.getString("sID")%>">View</a> | <a href="deleteSeller.jsp?sID=<%=resultSet.getString("sID") %>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></center></td>
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
	</div>
	<br>
	
	<script>
	function openNav() {
  	document.getElementById("mySidenav").style.width = "200px";
	}

	function closeNav() {
  	document.getElementById("mySidenav").style.width = "0";
	}
	
	//slideshow image
	var slideIndex = 0;
	showSlides();

	function showSlides() {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	  setTimeout(showSlides, 5000); // Change image every 2 seconds
	}
	
	const f = document.getElementById('form');
    const q = document.getElementById('query');
    const google = 'https://www.google.com/search?q=site%3A+';
    const site = 'pagedart.com';

    function submitted(event) {
		event.preventDefault();
		const url = google + site + '+' + q.value;
		const win = window.open(url, '_blank');
			win.focus();
    }

    f.addEventListener('submit', submitted);
	
	</script>
</body>
</html>
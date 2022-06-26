<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- SERVLET FOR RETRIEVE BUYER -->
<%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionAdmin")==null)
      response.sendRedirect("/0000 UJES SYSTEM/loginAdmin.jsp");
  %>
<% String AName = (String) session.getAttribute("currentSessionAdmin");
   int aID = (int) session.getAttribute("currentSessionAID");
%> 
<%
String bID = request.getParameter("bID");
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
	<title>BUYER LIST</title>
	<link rel="stylesheet" href="style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
    <a id="left" href="sellerList.jsp">Seller</a>
    <a id="left" class="active" href="#">User</a>
  	</div>
	<div class="dropdown">
		<button class="dropbtn" style="text-transform:uppercase"><img src="imagesM/avatar.png" alt="Avatar" class="avatar"><%=AName %>
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="loginAdmin.jsp">Logout</a>
		</div>
	 </div>
	</div>
	</div>
		<h1 align="center" style="color: #420B89">USER</h1>
	
	<div align="center">
		<table class="category">
			<tr align="center">
				<th>No</th>
				<th>Name</th>
				<th>Phone Number</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<%
		try{
		connection = ConnectionManager.getConnection();
		statement=connection.createStatement();
		String sql ="select * from buyer";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		
		<tr>
			<td><center><%=resultSet.getString("bID")%></center></td>
			<td><center><%=resultSet.getString("bName")%></center></td>
			<td><center><%=resultSet.getString("phoneNo")%></center></td>
			<td><center><%=resultSet.getString("bEmail")%></center></td>
			<td><center><a href="viewBuyerList.jsp?bID=<%=resultSet.getString("bID")%>">View</a> | <a href="deleteBuyer.jsp?bID=<%=resultSet.getString("bID") %>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></center></td>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin</title>
		<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style>
body{
	background-image: url('imagesM/background1.jpg');
	background-size: fixed;
	width: 100%;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

h1{
	text-align: center;
	text-size-adjust: bold;
	font-size: 64;
	font-family: sans-serif;
	color: #420B89;
	position: static;
	width: 318;
	height: 77;
}

#category {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

#category td, #category th {
  border: 1px solid #ddd;
  padding: 8px;
}
#category tr:nth-child(odd){background-color: white;}
#category tr:nth-child(even){background-color: #f2f2f2;}
#category tr:hover {background-color: #ddd;}

#category th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: purple;
  color: white;
}
#ujesbutton{
  background-color: purple;
  border-radius: 10px;
  float: right;
  border: none;
  color: white;
  padding: 10px 25px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
input[type=submit], input[type=reset] {
	background-color: purple;
  border-radius: 10px;
  border: none;
  color: white;
  padding: 10px 25px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

#addCtgry td{
	border: 1px;
	padding: 8px;
	float: left;
	width: 35%;
	margin-top: 6px;
	text-size-adjust: extrabold;
	font-size: 34;
	color: purple;
}
</style>
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
    <a id="left" class="active" href="adminList.jsp">Admin</a>
    <a id="left" href="sellerList.jsp">Seller</a>
    <a id="left" href="#">User</a>
  	</div>
	<div class="dropdown">
		<button class="dropbtn"><img src="imagesM/avatar.png" alt="Avatar" class="avatar">  ADMIN
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="loginAdmin.jsp">Logout</a>
		</div>
	 </div>
	</div>
	</div><br><br>
		<caption>
	<c:if test="${a != null}">
		<h1>UPDATE ADMIN</h1>
	</c:if>
	<c:if test="${a == null}">
		<h1>ADD ADMIN</h1>
	</c:if>
	</caption>
	<div align="center">
	<c:if test="${a != null}">
		<form action="UpdateAdmin" method="post">
	</c:if>
	<c:if test="${a == null}">
		<form action="AddAdmin" method="post">
	</c:if>
	
	<c:if test="${a != null}">
		<input type="hidden" name="aID" value="<c:out value='${a.aID}' />"/>
	</c:if>
	
		<table id="addCtgry">
			<tr>
				<td>Admin Name: </td>
				<td><input type="text" name="aName" id="name" value="<c:out value='${a.aName}' />"></td>
			</tr>
			<tr>
				<td>Admin Password:</td>
				<td><input type="password" name="aPassw" value="<c:out value='${a.aPassw}' />"></td>
			</tr>
		</table>

		<br><br>
		<input type="reset" value="Reset">
		<input type="submit" value="Submit">
	</form>
	</div>	

</body>
</html>
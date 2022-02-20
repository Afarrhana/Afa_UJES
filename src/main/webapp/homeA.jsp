<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Homepage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
table {
  border-radius: 1em;
  overflow: hidden;
  width: 800px;
  height: 300px;
  box-shadow: 0px 1px 20px 2px rgba(0, 0, 0, 0.25);
  background-color: #d9b8ff;
  flex-direction: row;
  
}
th, td, tr {
  padding: 1em;
  background: #ddd;
  border-bottom: 2px solid white; 
}
  .btn {
    background-color: #ede5ff;
    color: #420B89;
    padding: 16px 20px;
    border-color: #420B89;
    border-radius: 22px;
    cursor: pointer;
    width: 100%;
    margin-bottom:10px;
    opacity: 0.8;
  }
   .btn:hover {
    opacity: 1;
  }
</style>
</head>
<div class="frame" style="background-image: url('imagesM/background2.jpg');  background-size: cover;">
<br>
<h1 style="text-align: center; color:#420B89;">ADMINISTRATOR</h1>
</div>
<body>
<div class="topnav">
  	<div class="topnav-left">
    <a id="left" class="active" href="homeA.jsp">Home</a>
    <a id="left" href="adminList.jsp">Admin</a>
    <a id="left" href="sellerList.jsp">Seller</a>
    <a id="left" href="buyerList.jsp">User</a>
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

<center>
<table>
	<tr>
		<th style="background-color: #d9b8ff;" >
		<i class="fa fa-user-plus" style="font-size:500%;color:#420B89"></i><br><Br><a href="buyerList.jsp"><button class="btn">User Account</button></a></th>
		
		<th style="background-color: #d9b8ff;">
		<i class="fa fa-user" style="font-size:500%;color:#420B89"></i><br><Br><a href="sellerList.jsp"><button class="btn">Seller Account</button></a></th>
		
		<th style="background-color: #d9b8ff;">
		<i class="fa fa-clipboard" style="font-size:500%;color:#420B89"></i><br><br><a href="category.jsp"><button class="btn">Category</button></a></th>
	</tr>
</table>

</div>

</center>
</body>
</html>
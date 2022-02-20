<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Category</title>
	<link rel="stylesheet" href="style2.css">
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
		<caption>
	<c:if test="${c != null}">
		<h1>UPDATE CATEGORY</h1>
	</c:if>
	<c:if test="${c == null}">
		<h1>ADD CATEGORY</h1>
	</c:if>
	</caption>
	<div align="center">
	<c:if test="${c != null}">
		<form action="UpdateCategory" method="post" enctype="multipart/form-data">
	</c:if>
	<c:if test="${c == null}">
		<form action="AddCategory" method="post" enctype="multipart/form-data">
	</c:if>
	
	<c:if test="${c != null}">
		<input type="hidden" name="cID" value="<c:out value='${c.cID}' />"/>
	</c:if>
	
		<table id="addCtgry">
			<tr>
				<td>Category Name: </td>
				<td><input type="text" name="cName" id="name" value="<c:out value='${c.cName}' />"></td>
			</tr>
			<tr>
				<td>Category Image:</td>
				<td><input type="file" id="images" name="cPics" value="images/<c:out value='${c.cPics}' />"><c:out value='${c.cPics}' /></td>
			</tr>
		</table>

		<br><br>
		<input type="reset" value="Reset">
		<input type="submit" value="Submit">
	</form>
	</div>	

</body>
</html>
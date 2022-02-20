<%@page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
 Connection con = null;
 Statement stmt = null;
 ResultSet rs = null;
%>
<% try{
	con = ConnectionManager.getConnection();
	stmt = con.createStatement();
	String sql = "SELECT * FROM category ORDER BY cID";
	rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Product</title>
	<link rel="stylesheet" href="style2.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<div class="frame">
<img src="" alt="" style="height:50px;">
    <center><img src="imagesM/MASMED.png" alt="" style="height:60px;"></center>
</div>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" class="active" href="homeS.jsp">Home</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn">SELLER <img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="product.jsp">My Product</a>
		  <a href="#">History</a>
		  <a href="#">Sales</a>
		  <a href="loginSeller.jsp">Logout</a>
		</div>
	 </div>
	</div><br>
	<caption>
	<c:if test="${p != null}">
		<h1>UPDATE PRODUCT</h1>
	</c:if>
	<c:if test="${p == null}">
		<h1>ADD PRODUCT</h1>
	</c:if>
	</caption>
	<div align="center">
	<c:if test="${p != null}">
		<form action="UpdateProduct" method="post" enctype="multipart/form-data">
	</c:if>
	<c:if test="${p == null}">
		<form action="AddProduct" method="post" enctype="multipart/form-data">
	</c:if>
	
	<c:if test="${p != null}">
		<input type="hidden" name="pID" value="<c:out value='${p.pID}' />"/>
	</c:if>
		<table id="addCtgry">
			<tr>
				<td>Category: </td>
				<td><select name="cID" required>
				<option value="<c:out value='${p.cID}' />" selected disabled><c:out value='${p.cID}' /></option>
				
				<%
				while(rs.next()){
				    int cID = rs.getInt("cID"); 
					String category = rs.getString("cName"); 
				%> 
			            
									<option value="<%=cID %>"><%=category %></option>
						        <%
						        }con.close();
						      } catch (Exception e) { e.printStackTrace(); }%>
					    
			            </select>
			    </td>
			</tr>
			<tr>
				<td>Product Name: </td>
				<td><input type="text" name="pName" value="<c:out value='${p.pName}' />" required></td>
			</tr>
			<tr>
				<td>Product Description: </td>
				<td><textarea name="pDesc" id="" cols="21" rows="3" placeholder="Insert description"><c:out value='${p.pDesc}' /></textarea></td>
			</tr>
			<tr>
				<td>Price: RM </td>
				<td><input type="number" name="pPrice" value="<c:out value='${p.pPrice}' />" required></td>
			</tr>
			<tr>
				<td>Quantity: </td>
				<td><input type="number" name="pQty" value="<c:out value='${p.pQty}' />" required></td>
			</tr>
			
			<tr>
				<td>Product Image:</td>
				<td><input type="file" value="<c:out value='${p.pPics}' />" name="pPics"></td>
			</tr>
		</table>

		<br><br>
		
		<input type="reset" value="Reset">
		<input type="submit" value="Submit">
	</form>
	</div>
</body>
</html>
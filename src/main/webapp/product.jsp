<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Main Product</title>
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
		<h1>PRODUCT</h1>
	<div style="width: 89%">
	<form action="product-form.jsp" method="post">
	<button id="ujesbutton">Add Product</button><br><br>
	</form>
	</div>
	<br>
	
	<div align="center">
		<table id="product">
			<tr>
				<th>Product ID</th>
				<th>Category</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>View</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%
				try{
					connection = ConnectionManager.getConnection();
					statement=connection.createStatement();
					String sql ="select * from product NATURAL JOIN category";
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
				%>
					<tr>
						<td><%=resultSet.getInt("pID") %></td>
						<td><%=resultSet.getString("cName") %></td>
						<td><%=resultSet.getString("pName") %></td>
						<td><%=resultSet.getDouble("pPrice") %></td>
						<td><%=resultSet.getInt("pQty") %></td>
						<td><a href="ViewProduct?pID=<%=resultSet.getString("pID")%>">View</a></td>
						<td><a href="UpdateProduct?pID=<%=resultSet.getString("pID")%>">Edit</a></td>
						<td><a href="DeleteProduct?pID=<%=resultSet.getString("pID") %>" onclick="confirm('Are you sure you want to delete this item?');">Delete</a></td>
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
</body>
</html>
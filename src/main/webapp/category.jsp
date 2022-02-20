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
	<title>Display Category</title>
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
		<h1>CATEGORY</h1>
	<div style="width: 89%">
	<a href="category-form.jsp"><button id="ujesbutton">Add Category</button></a><br><br>
	</form>
	</div>
	<br>
	
	<div align="center">
		<table id="category">
			<tr>
				<th>Category ID</th>
				<th>Category Name</th>
				<th>Category Images</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			
			<%
				try{
					connection = ConnectionManager.getConnection();
					statement=connection.createStatement();
					String sql ="select * from category";
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
				%>
					<tr>
						<td><%=resultSet.getInt("cID") %></td>
						<td><%=resultSet.getString("cName") %></td>
						<td><img src="images/<%=resultSet.getString("cPics") %>" style="height:30%; background-size: collapsed;"></td>
						<td><a href="UpdateCategory?cID=<%=resultSet.getString("cID")%>">Edit</a></td>
						<td><a href="DeleteCategory?cID=<%=resultSet.getString("cID") %>" onclick="confirm('Are you sure you want to delete this item?');">Delete</a></td>
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
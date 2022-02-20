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
	<title>Admin List</title>
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
    <a id="left" href="buyerList.jsp">User</a>
  	</div>
	<div class="dropdown">
		<button class="dropbtn"><img src="imagesM/avatar.png" alt="Avatar" class="avatar">Admin
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="loginAdmin.jsp">Logout</a>
		</div>
	 </div>
	</div>
	<br><br>
	
	<div style="width: 89%">
	<a href="admin-form.jsp"><button id="ujesbutton">Add Admin</button></a><br><br>
	</form>
	</div>
	<br>
	
	<div align="center">
		<table id="category">
			<tr>
				<th>Admin ID</th>
				<th>Admin Name</th>
				<th>Added By</th>
				<th>Delete</th>
			</tr>
			
			<%
				try{
					connection = ConnectionManager.getConnection();
					statement=connection.createStatement();
					String sql ="select * from admin";
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
				%>
					<tr>
						<td><%=resultSet.getInt("aID") %></td>
						<td><%=resultSet.getString("aName") %></td>
						<%if(resultSet.getString("newaID")!= null){ %>
							<td><%=resultSet.getString("newaID") %></td>
		                <% }else {%> <td>Main Admin</td> <% } %>
						<td><a href="DeleteAdmin?aID=<%=resultSet.getString("aID") %>" onclick="confirm('Are you sure you want to delete this admin?');">Delete</a></td>
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
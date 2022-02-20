<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- SERVLET FOR RETRIEVE BUYER -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String bID = request.getParameter("bID");
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
<head>
<meta charset="ISO-8859-1">
	<title>BUYER LIST</title>
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

th, td {
  padding: 1em;
  background: #ddd;
  border-bottom: 2px solid white;
  
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
    <a id="left" href="adminList.jsp">Admin</a>
    <a id="left" href="sellerList.jsp">Seller</a>
    <a id="left" class="active" href="#">User</a>
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
	<div>
	
	<center>
	<form>
	<table>
	<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from buyer where bID="+bID;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr>
		<td><b>Buyer ID: </b><%=resultSet.getString("bID")%></td>
		</tr>
		<tr>
		<td><b>Name: </b><%=resultSet.getString("bName")%></td>
		</tr>
		<tr>
		<td><b>Phone Number: </b><%=resultSet.getString("phoneNo")%></td>
		</tr>
		<tr>
		<td><b>Email: </b><%=resultSet.getString("bEmail")%></td>
		</tr>
		
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table><br><br>
	</form>
	<button class="button1" onclick="history.back()">BACK</button>
	</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String cID = request.getParameter("cID");
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
<!-- END SERVLET FOR RETRIEVE CATEGORY -->   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buyer Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<div class="frame">
<img src="" alt="" style="height:50px;">
    <center><img src="imagesM/MASMED.png" alt="" style="height:60px;"></center>
</div>
<body>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" class="active" href="homeB.jsp">Home</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn">BUYER <img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">Order History</a>
		  <a href="loginBuyer.jsp">Logout</a>
		</div>
	 </div>
	</div><br>
	
	<h2><center>CATEGORIES</center></h2>
	<div >
  		<table class="center">
    	<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from category";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		<th>
			<div class="card">
			  <img src="images/<%=resultSet.getString("cPics")%>" alt="category" style="padding-top:5%;width:95px;height:95px">
			  <h1 style="padding:12px"><%=resultSet.getString("cName")%></h1>
			  <p><a href="listProductB.jsp?cID=<%=resultSet.getString("cID")%>"><button>View</button></a></p>
			</div>	
		</th>	
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
	</div>
	<h2><center>PRODUCTS</center></h2>
	
	<div >
  		<table class="center">
    	<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from product";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		
		<th>
			<div class="card">
			  <img src="images/<%=resultSet.getString("pPics")%>" alt="product" style="padding-top:5%;width:95px;height:95px">
			  <h1 style="padding:12px"><%=resultSet.getString("pName")%></h1>
			  <p><a href="product-buyer.jsp?pID=<%=resultSet.getString("pID")%>"><button>View</button></a></p>
			</div>	
		</th>	
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
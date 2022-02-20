<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ujes.model.Seller"%>
  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionSeller")==null)
      response.sendRedirect("/0000 UJES SYSTEM/loginS.jsp");
  %>
<% String sEmail = (String) session.getAttribute("currentSessionSeller");%> 

<%
//int sID = Integer.parseInt(request.getParameter("sID"));
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
	<title>Seller Homepage</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<button class="dropbtn"><%=sEmail%><img src="imagesM/avatar.png" alt="Avatar" class="avatar">
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
	<h2><center>CATEGORIES</center></h2>
	<div>
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
			  <p><a href="listProductS.jsp?cID=<%=resultSet.getString("cID")%>"><button>View</button></a></p>
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
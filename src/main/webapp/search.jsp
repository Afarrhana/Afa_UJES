<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ujes.model.Buyer"%>


  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("currentSessionBuyer")==null)
      response.sendRedirect("/0000 UJES SYSTEM/loginBuyer.jsp");
  %>

<% String bEmail = (String) session.getAttribute("currentSessionBuyer");
	int bID = (int) session.getAttribute("buyerID");%> 
<%

/* int bID = Integer.parseInt(request.getParameter("bID"));
String bName = request.getParameter("bName"); */
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
	
	<form action="search.jsp" method="get">
		<center><input type="text" class="form-control" name="search" placeholder="search product..."/>
			<input type="submit"/>
		</center>
	</form>
	
	
	<h2><center>PRODUCTS</center></h2>
	
	<div >
  		<table class="center">
    	<%
		try{
		connection = ConnectionManager.getConnection();
		statement=connection.createStatement();
		
		
		String search = request.getParameter("search");
		String sql = "select * from product where pName LIKE '%" +search+"%'";
		
		
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

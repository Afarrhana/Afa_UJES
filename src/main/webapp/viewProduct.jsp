<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- SERVLET FOR RETRIEVE PRODUCT -->
<%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("currentSessionBuyer")==null)
      response.sendRedirect("/0000 UJES SYSTEM/loginBuyer.jsp");
  %>
<% String bEmail = (String) session.getAttribute("currentSessionBuyer");%> 
<%
String pID = request.getParameter("pID");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>    
<!-- END SERVLET FOR RETRIEVE PRODUCT -->    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
    <a id="left" href="homeB.jsp">Home</a>
    <a id="left" href="#book">Category</a>
    <a id="left"  class="active" href="#product">Product</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn"><img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">My Product</a>
		  <a href="#">History</a>
		  <a href="#">Sales</a>
		  <a href="loginBuyer.jsp">Logout</a>
		</div>
	 </div>
	</div><br>
	
	<form>
	<table>
	
	<%
		try{
		connection = ConnectionManager.getConnection();
		statement=connection.createStatement();
		String sql ="select * from product where pID=" + pID;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr>
		<td colspan=2><img src="/images<%=resultSet.getString("pPics")%>"></td>
		<td><%=resultSet.getString("pName") %></td>
		</tr>
		<tr>
		<td></td>
		<td><%=resultSet.getString("pPrice") %></td>
		<td><%=resultSet.getString("pQuantity") %></td>
		</tr>
		<tr>
		<td></td>
		</tr>
		
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
	
	</form>

</body>
</html>

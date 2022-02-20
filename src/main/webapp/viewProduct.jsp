<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- SERVLET FOR RETRIEVE PRODUCT -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
String driver = "oracle.jdbc.driver.OracleDriver";
String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
String database = "db_gryffindor";
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
    <a id="left" href="#home">Home</a>
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
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
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
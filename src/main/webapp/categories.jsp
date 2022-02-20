<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String cID = request.getParameter("cID");
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
    <a id="left" class="active" href="categories.jsp">Category</a>
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
<center>
	<table style="width:80%; border: 1px solid black; border-collapse: collapse;">
	<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from category";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr>
		<td style="width:30%; height: 30px; border: 1px solid black;"><a><img src="/images<%=resultSet.getString("cPics")%>"></a></td>
		<td style="border: 1px solid black;"><a href="listProduct.jsp?cID=<%=resultSet.getString("cID")%>"><%=resultSet.getString("cName") %></a> (<%=resultSet.getInt("pqtyAvail") %>)</td>
		</tr>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</center>
</form>



</body>
</html>
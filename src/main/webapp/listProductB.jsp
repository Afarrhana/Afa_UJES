<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- SERVLET FOR RETRIEVE PRODUCT -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
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
<!-- END SERVLET FOR RETRIEVE PRODUCT -->
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

#backprod {
    background-color: whitesmoke;
    width: 60%;
    padding-top: 12px;
    padding-bottom: 12px;
    padding-left: 12px;
    padding-right: 12px;
    margin-left: auto;
    margin-right: auto;
}

#backprod2 {
    background-color: whitesmoke;
    width: 80%;
    padding-top: 12px;
    padding-bottom: 12px;
    padding-left: 12px;
    padding-right: 12px;
    margin-left: auto;
    margin-right: auto;
}
/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
    background-color: #555;
    color: white;
    padding: 16px 20px;
    border: none;
    cursor: pointer;
    opacity: 0.8;
    position: fixed;
    bottom: 23px;
    right: 28px;
    width: 280px;
  }
  
  /* The popup form - hidden by default */
  .form-popup {
    display: none;
    position: fixed;
    bottom: 0;
    right: 60%;
    border: 3px solid #f1f1f1;
    z-index: 9;
  }
  
  /* Add styles to the form container */
  .form-container {
    max-width: 300px;
    padding: 10px;
    background-color: white;
  }
  
  /* Full-width input fields */
  .form-container input[type=number] {
    width: 90%;
    padding: 15px;
    margin: 5px 0 22px 0;
    border: none;
    background: #f1f1f1;
  }
  
  /* When the inputs get focus, do something */
  .form-container input[type=number]:focus {
    background-color: #ddd;
    outline: none;
  }
  
  /* Set a style for the submit/login button */
  .form-container .btn {
    background-color: #04AA6D;
    color: white;
    padding: 16px 20px;
    border: none;
    cursor: pointer;
    width: 100%;
    margin-bottom:10px;
    opacity: 0.8;
  }
  
  /* Add a red background color to the cancel button */
  .form-container .cancel {
    background-color: red;
  }
  
  /* Add some hover effects to buttons */
  .form-container .btn:hover, .open-button:hover {
    opacity: 1;
  }
  #buybtn{
    background-color: purple;
    border-radius: 10px;
    border: none;
    color: white;
    padding: 10px 25px;
    text-decoration: none;
    cursor: pointer;
  }

  .prodfeedbek {
      background-color: #ddd;
      padding: 12px;
  }
  </style>
</head>
<div class="frame">
<img src="" alt="" style="height:50px;">
    <center><img src="imagesM/MASMED.png" alt="" style="height:60px;"></center>
</div>
<body>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" href="homeS.jsp">Home</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn">BUYER <img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">Order History</a>
		  <a href="loginSeller.jsp">Logout</a>
		</div>
	 </div>
	</div><br><br><br><br>

<form>
<center>
	<table style="width:60%; border: 1px solid black; border-collapse: collapse;">
	
	<%
		try{
		connection = DriverManager.getConnection(connectionUrl, userid, password);
		statement=connection.createStatement();
		String sql ="select * from product natural join category where cID=" + cID;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr id="backprod2">
			<td style="width:30%; height: 30px;">
				<center>
				<%=resultSet.getString("cID") %> &nbsp;&nbsp;&nbsp;&nbsp;
				<a href="product-buyer.jsp?pID=<%=resultSet.getString("pID")%>"><img src="images/<%=resultSet.getString("pPics")%>" style="width:50%;background-size: collapsed;"></a></td>
				<td><b><%=resultSet.getString("pName") %></b><br>
				Category: <%=resultSet.getString("cName") %><br>
				Description: <%=resultSet.getString("pDesc") %><br>
				Price: RM <%=resultSet.getDouble("pPrice") %>
			</td>
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
<br><br><br><br>

</body>
</html>
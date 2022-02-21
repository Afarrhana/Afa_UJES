<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement" %>
  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  if(session.getAttribute("currentSessionBuyer")==null)
      response.sendRedirect("/0000 UJES SYSTEM/loginB.jsp");
  %>
<% String bEmail = (String) session.getAttribute("currentSessionBuyer");%> 

<%
String pID = request.getParameter("pID");
String bID = request.getParameter("bID");
String odID = request.getParameter("odID");

%>    
<!-- END SERVLET FOR RETRIEVE CATEGORY -->   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<title>Buyer Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<div class="frame">
<img src="" alt="" style="height:50px;">
    <center><img src="images/MASMED.png" alt="" style="height:60px;"></center>
</div>
<body>
	<div class="topnav">
  	<div class="topnav-left">
    <a id="left" class="active" href="homeB.jsp">Home</a>
  	</div>
  	
  	<div class="dropdown">
		<button class="dropbtn"><%=bEmail%><img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">Order History</a>
		  <a href= "loginBuyer.jsp">Logout</a>
		</div>
	 </div>
	</div><br>
	
<style>
  .form-container {
    max-width: 300px;
    padding: 10px;
    background-color: white;
  }


</style>	
	
	<h3><center>PAYMENT </center></h3><br>
	<p><center>Payment has been made!</center></p>
	
	<%
	try{
		Connection con = ConnectionManager.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from Payment p join OrderProduct o on p.odID=o.odID join buyer b on o.bID=b.bID where b.bID=1" );
		while (rs.next()) {

	 
	%>
	
	<div >
  		<table class="center" style="width:80%;">		
  		
		<center>
		<form method="post" action="" >
		<br>
		
			
			<hr>
			
			<div class="form-row">
						<div class="form-group col-md-6">
							<label for="name"><b>Payment Method:</b></label><br> Online transfer only
						</div><br>
						
						<div class="form-group col-md-6 col-sm-6">
							<label for="accNo"><b>Acc No:</b></label>
							<input style="width:400px;"	type="text" class="form-control" name="accNo" id="accNo" value="<%=rs.getString("accNo")%>" readonly>
							<br>
						</div><br>
						
						<div class="form-group col-md-6 col-sm-6">
							<label for="payDate"><b>Payment Date:</b></label>
							<input style="width:400px;"	type="text" class="form-control" name="payDate"  value="<%=rs.getString("payDate")%>" readonly>
							<br>
						</div><br>
						
						<div class="form-group col-md-6 col-sm-6">
							<label for="totprice"><b>Total Price: </b></label><br>
							<input style="width:400px;"	type="text" class="form-control" name="totprice" id="totprice" value="RM <%=rs.getString("totprice")%>" readonly>
							<br>
						</div><br>
			</div>
			<input type="hidden" name="odID" id="odID" value="<%=rs.getString("odID")%>"/>
				
			
		</form>	
		<%
		}
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
		</center>
		</table>
	</div>
	
</body>
</html>

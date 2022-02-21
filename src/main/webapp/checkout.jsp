<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- SERVLET FOR RETRIEVE CATEGORY -->
<%@page import="ujes.db.ConnectionManager"%>
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

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
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
		<button class="dropbtn"><%=bEmail%><img src="images/avatar.png" alt="Avatar" class="avatar"> 
		  <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
		  <a href="#">Profile</a>
		  <a href="#">Order History</a>
		  <a href= "loginBuyer.jsp">Logout</a>
		</div>
	 </div>
	</div><br>
	
	
	
	<h3><center>ORDER</center></h3>
	
	<%
	try{
		Connection con = ConnectionDriverManager.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from OrderProduct o join product p on o.pID=p.pID join buyer b  on o.bID=b.bID where b.bID="+bID );
		while (rs.next()) {

	 
	%>
	
	
  		<table class="center" style="width:80%;">
  		
		<center>
		<form method="post" action="paymentController">
		<br>
		
			<div class="form-row">
						<div class="form-group col-md-6 col-sm-6">
							<label for="bName"><b>Name</b></label> <input type="text" style="width:400px;"
								class="form-control" name="bName" id="bName" value=<%=rs.getString("bName")%> readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="phoneNo"><b>Phone Number</b></label> 
							<input style="width:400px;"	type="text" class="form-control" name="phoneNo" id="phoneNo" value="0<%=rs.getString("phoneNo")%>" readonly>
						</div><br><br>
						
						<div class="form-group col-md-6">
							<label for="address"><b>Address</b></label> 
							<input style="width:400px;"	type="text" class="form-control" name="address" id="address" value="<%=rs.getString("address")%>" readonly>
						</div>
			</div>
					
			<hr>
			
			<div class="form-row">
						<div class="form-group col-md-6">
							<label for="name"><b>Payment Method:</b></label><br> Online transfer only
						</div><br>
						
						
						<div class="form-group col-md-6 col-sm-6">
							<label for="pName"><b>Product Name:</b></label>
							<input style="width:400px;"	type="text" class="form-control" name="pName" id="pName" value="<%=rs.getString("pName")%>" readonly>
							<br>
						</div><br>
						
						<div class="form-group col-md-6 col-sm-6">
							<label for="qty"><b>Quantity:</b></label><br> 
							<input style="width:400px;"	type="text" class="form-control" name="qty" id="qty" value="<%=rs.getString("qty")%>" readonly>
						</div>
						<div class="form-group col-md-6 col-sm-6">
							<label for="totprice"><b>Price: </b></label><br>
							<input style="width:400px;"	type="text" class="form-control" name="totprice" id="totprice" value="RM <%=rs.getString("totprice")%>" readonly>
							<br>
						</div><br>
							<input type="hidden" name="odID" value="<%=rs.getString("odID")%>"/>
						<div class="form-group col-md-6 col-sm-6">
							<button type="submit">pay now</button>
							
							<br>
							</div><br>
						
			</div>
		</form> 
		
		
		</center>
		</table>
			
	
	<%
		}
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		
</body>
</html>

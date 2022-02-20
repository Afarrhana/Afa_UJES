<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int pID = Integer.parseInt(request.getParameter("pID"));
Connection con = null;
Statement st = null;
ResultSet rs = null;
%>
<%
	try{
	con = ConnectionManager.getConnection();
	st = con.createStatement();
	String sql ="select * from product NATURAL JOIN CATEGORY where pID=" + pID;
	rs = st.executeQuery(sql);
	while(rs.next()){
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product</title>
	<link rel="stylesheet" href="style2.css">

<style>
    body{
        background-image: url('imagesM/background1.jpg');
        background-size: cover;
        color: white;
        background-repeat: no-repeat;
    	background-attachment: fixed;
    }
    .centered {
  	position: fixed;
  	top: 50%;
  	left: 50%;
  	/* bring your own prefixes */
  	transform: translate(-50%, -50%);
	}
	.sided {
  	position: fixed;
  	top: 50%;
  	left: 46%;
  	/* bring your own prefixes */
  	transform: translate(-50%, -50%);
	}
	.frame {
  	width: 710px;
  	height: 397px;
  	overflow: visible;
  	background-image: url(imagesM/background3.jpg );
  	background-size: cover;
  	background-repeat: no-repeat;
  	background-position: center;
  	border-radius: 25px;
	}

</style>
</head>
<body>
	<div class="centered"> 
		<iframe class="frame"></iframe>
	</div>
	<div class="centered">
	<table>
		<tr>
			<td>
				<img src="images/<%=rs.getString("pPics") %>" style="width:200px; background-size: collapsed;"><Br>
			</td>
			<td></td>
			<td>
				<h1><%=rs.getString("pName") %></h1>
					<p>Category: <%=rs.getString("cName") %></p>
					<p>Description:<%=rs.getString("pDesc") %></p>
					<p>Price: RM <%=rs.getDouble("pPrice") %></p>
					<p>Quantity Available: <%=rs.getInt("pQty") %></p>
					
					<%
					}
					con.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>			
			</td>
		</tr>
	</table>
	</div>	
</body>
</html>
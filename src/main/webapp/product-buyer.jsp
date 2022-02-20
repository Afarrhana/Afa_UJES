<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="ujes.db.ConnectionManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int pID = Integer.parseInt(request.getParameter("pID"));//Integer.parseInt(request.getParameter("pID"));
//int bID = Integer.parseInt(request.getParameter("bID"));
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
        <title>Select Product</title>
	<link rel="stylesheet" href="style2.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        
    </head>
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
  .checked {
  color: orange;
}
  </style>

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
		<button class="dropbtn">SELLER <img src="imagesM/avatar.png" alt="Avatar" class="avatar"> 
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
	<h1>PRODUCT</h1>
	        <div id="backprod">
            <h1><%=rs.getString("pName") %></h1>
            <hr>
            <center><img src="images/<%=rs.getString("pPics") %>" name="pPics" style="position: sticky; width: 60%;background-size: collapsed;"></center><br>
            
            <h2>Product Details</h2>
            <p>Price: RM <label for="pPrice"><%=rs.getDouble("pPrice") %></label><br></p>
            <p>Quantity Available: <label for=""><%=rs.getInt("pQty") %></label><br></p>
            <p>Category: <label for="cID"><%=rs.getString("cName") %></label><br></p>
            <p>Description: <label for="pDesc"><%=rs.getString("pDesc") %></label><br><br></p>
			
            <button onclick="openForm()" id="buybtn">Buy Now</button>
            <%
			}
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
        </div>
        
            <div class="form-popup" id="myForm">
            <form action="/action_page.php" class="form-container">
                <h2>Insert detail</h2>

                <label for="quantity"><b>Quantity</b></label>
                <input type="number" name="quantity" required>

                <button type="submit" class="btn">Buy Now</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
            </form>
            </div>

            <script>
            function openForm() {
            document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
            document.getElementById("myForm").style.display = "none";
            }
            </script>

        <br>
        <div id="backprod2">
            <h2>Product Feedback</h2>
             <div class="prodfeedbek">
                <form action="AddFeedback" method="post">
                	<h3>Add Feedback</h3>
                	Comment: <input type="text" name="pComment"><br>
	                <p>Rate (1-5): <input type="number" min="1" max="5"><br>
	                <p>Image: <input type="file" name="pImage"><br>
	                <input type="hidden" value="pID">
	                <input type="hidden" value="bID">
	                <input type="submit" value="Submit">
                </form>
            </div><br>            
            <%
				try{
				con = ConnectionManager.getConnection();
				st = con.createStatement();
				String sql ="select * from prodFeedback NATURAL JOIN product NATURAL JOIN BUYER where pID=" + pID;
				rs = st.executeQuery(sql);
				while(rs.next()){
			%>
            
            <div class="prodfeedbek">
                <p>Username: <label for=""><%=rs.getString("bName")%></label><br></p>
                <p>Feedback: <label for=""><%=rs.getString("pComment")%></label><br></p>
                <%if(rs.getString("pRate")!= null){ %>
                <p>Rate: <label for=""><%=rs.getString("pRate")%></label><br></p>
                <% }else {%> <p>No Rate</p> <% } %>
                
                <%if(rs.getString("pImage")!= null){ %>
                	<img src="images/<%=rs.getString("pImage") %>" style="width:170px;">
                <% }else {%> <p>No Image</p> <% } %>
            </div><br>
            <%
			}
			con.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
           
        </div>
    </body>
</html>
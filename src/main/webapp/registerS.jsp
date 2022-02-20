<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
    body{
        background-image: url('images/background.jpg');
        background-size: cover;
    
    }
    .centered {
  	position: fixed;
  	top: 50%;
  	left: 50%;
  	/* bring your own prefixes */
  	transform: translate(-50%, -50%);
	}
	.frame {
  	width: 710px;
  	height: 500px;
  	overflow: visible;
  	background-image: url( images/image1.jpeg );
  	background-size: cover;
  	background-repeat: no-repeat;
  	background-position: center;
  	border-radius: 25px;
	}
	.register{
  	width: auto; /* 167px */
  	height: auto; /* 43px */
  	overflow: visible;
  	white-space: pre;
  	font-family: "Inter", sans-serif;
  	color: #ffffff;
  	font-size: 36px;
  	letter-spacing: 0px;
  	line-height: 1.2;
	}
	.button {
  	background-color: #EA29FF;
  	text-align: center;
  	border: none;
 	color: white;
  	padding: 2px 32px;
 	text-decoration: none;
 	display: inline-block;
 	font-size: 16px;
 	margin: 4px 2px;
 	cursor: pointer;
 	border-radius: 8px;
	}

</style>
<body>
	<div class="centered"> 
		<iframe class="frame"></iframe>
	</div>
	<div class="centered">
	<form action="RegisterSeller" method="post" onsubmit ="return validateForm()">
	<div>
	<center><h3  class="register">REGISTRATION</h3>
	</div>
	<div>
	<i class="material-icons" style="font-size:25px">person</i>
	<input style="width: 80%; font-size:16px;" type="text" name="sName" placeholder="Username" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">house</i>
	<input style="width: 80%; font-size:16px;" type="text" name="shopName" placeholder="Shop Name" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">credit_card</i>
	<input style="width: 80%; font-size:16px;" type="text" name="accNo" placeholder="Account Number" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">email</i>
	<input style="width: 80%; font-size:16px;" type="text" name="sEmail" placeholder="Email" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">lock_outline</i>
	<input style="width: 80%; font-size:16px;" class="input100" type="password" name="spassw" id="password1" placeholder="Password" required><br>
	<span style="font-size:16px; color:red" id = "message1" > </span>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">lock_open</i>
	<input style="width: 80%; font-size:16px;" class="input100" type="password" name="Cpassword" id="password2" placeholder="Confirm Password" required><br>
	<span style="font-size:16px; color:red" id = "message2" > </span>
	</div>
	<br>
	<div>
	</center>
        <center>
            <a><button class="button">Submit</button></a>
        </center>
	</div>
	<div>
		<center><p style="font-size: 12px;">Already have an account? <a href="loginSeller.jsp">Sign in</a></p></center>
	</div>

	</form>
	</div>
</div>
 	<script>
 	function validateForm(){
 		
 		var password1 = document.getElementById("password1").value;
 		var password2 = document.getElementById("password2").value;
 		
 		//validate empty pssw & confirm pssword
 		if(password1 == "")
 		{ 
 			document.getElementById("message1").innerHTML="**Password Empty!";
 			return false;
 		}
 		if(password2 == "")
 		{ 
 			document.getElementById("message2").innerHTML="**Password Empty!";
 			return false;
 		}
 		
 		//validate password length
 		//max
 		if(password1.length > 12)
 		{ 
 			document.getElementById("message1").innerHTML="**Password length must be less than 12 characters";
 			return false;
 		}
 		//min
 		if(password1.length < 6)
 		{ 
 			document.getElementById("message1").innerHTML="**Password must be at least 6 characters long.";
 			return false;
 		}
 		
 		//pssword same or not
 	  if(password1 != password2) {  
 	      document.getElementById("message2").innerHTML = "**Confirm Password should match with the Password!";  
 	      return false;  
 	    } else {  
 	      alert ("Your password created successfully");    
 	    }  
 	 }  
    </script>
</body>
</html>

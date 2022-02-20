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
        background-image: url('imagesM/background2.jpg');
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
  	height: 397px;
  	overflow: visible;
  	background-image: url('imagesM/background3.jpg');
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
	<form action="RegisterSServlet" method="post"">
	<div>
	<h3  class="register">REGISTRATION</h3>
	</div>
	<div>
	<i class="material-icons" style="font-size:25px">person</i>
	<input style="width: 80%; font-size:16px;" type="text" name="sName" placeholder="Username" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">email</i>
	<input style="width: 80%; font-size:16px;" type="text" name="sEmail" placeholder="Email" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">lock_outline</i>
	<input style="width: 80%; font-size:16px;" class="input100" type="password" name="spassw" placeholder="Password" required>
	</div><br>
	<div>
	<i class="material-icons" style="font-size:25px">lock_open</i>
	<input style="width: 80%; font-size:16px;" class="input100" type="password" name="Cpassword" placeholder="Confirm Password" required>
	</div>
	<br>
	<div>
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
 	function validate() {
 		  const password = document.querySelector('input[name=spassw]');
 		  const confirm = document.querySelector('input[name=Cpassword]');
 		  if (confirm.value === password.value) {
 			confirm.setCustomValidity('');
 		  } else {
 			confirm.setCustomValidity('Passwords do not match');
 		  }
 		}
    </script>
</body>
</html>
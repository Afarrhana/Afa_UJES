<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
	.memberLogin{
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
  	padding: 8px 32px;
 	text-decoration: none;
 	display: inline-block;
 	font-size: 16px;
 	margin: 4px 2px;
 	cursor: pointer;
 	border-radius: 8px;
	}
	.button1 {width: 40%;}

</style>
<body>
<!--<button onclick="history.back()">Go Back</button>-->
<a href="index.jsp"><button>Go Back</button></a>
	<div class="centered"> 
		<iframe class="frame"></iframe>
	</div>
<div class="centered">
	<form action="LoginBuyer" method="post">
	<h3  class="memberLogin" align="center">BUYER LOGIN</h3>

	<div data-validate="Valid email is required: ex@abc.xyz">
	<i class="material-icons" style="font-size:25px text-align:center;">email</i>
	<input style="width: 80%; font-size:16px; align=center" type="email" name="bEmail" placeholder="Email" required>
	</div><br>
	
	<div data-validate="Password is required">
	<i class="material-icons" style="font-size:25px text-align:center;">lock</i>
	<input style="width: 80%; font-size:16px;" type="password" name="bPassw" placeholder="Password" required>
	</div><br>
	
	<div>
	<center><a><button class="button button1">Login</button></a></center>
	</div><br>
	
	<div><center>
	<a class="txt2" href="registerB.jsp">
	Sign up now
	</a></center>
	</div>
	
	</form>

</div>
</body>
</html>

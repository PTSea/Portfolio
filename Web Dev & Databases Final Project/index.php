<?php
//Check that the user is already logged in
//if user is logged in already, go to the planner
session_start();
if(isset($_SESSION['login_user'])) {
	header("Location:planner.php");
}
?>

<!DOCTYPE HTML>
<html lang="en">
	<head>
	<meta charset="UTF-8" />
	<title>Planner Login</title>
	<link rel="stylesheet" href="style.css"/>
	<script src="jquery.min.js"></script>
	<script>
		//JS/AJAX login function
		//basis for this code found here:
		//http://www.9lessons.info/2014/07/ajax-php-login-page.html
		$(document).ready(function() {
			$('#login').click(function() {
				//use entries in variables
				var name=$("#name").val();
				var password=$("#password").val();
			    var dataString = 'name='+name+'&password='+password;
			    //trim removes extra spaces except for that within the string
			    //if there was something entered then we proceed with ajax login call
				if($.trim(name).length>0 && $.trim(password).length>0) {
					$.ajax({
						//set up the login information and where the php login validation is
			            type: "POST",
			            url: "ajaxLogin.php",
			            data: dataString,
			            cache: false,
			            //this changes the button text to connecting when stuff is entered
			            beforeSend: function(){ $("#login").val('Connecting...');},
			            //upon successful validation we use the .load function to load the planner
			            //.hide and .fadein and .delay create visual effects
			            success: function(data){
				            if(data) {
				            	$("body").load("planner.php").hide().fadeIn(1500).delay(6000);
				            }
				            else {
				            	//We use this in the unsuccessful case to display and error message
								$("#login").val('Login')
								$("#error").html("<span style='color:#cc0000'>Error:</span> Invalid name and password. ");
				            }
			            }
		            });
				}
				return false;
			});
		});
		//This controls where the register button goes
    	function registerredirect() {
    		window.location.href = "register1.php";
    	}
	</script>
	</head>

	<body>
		<!--Login form field-->
		<div id="main">
			<h1>Planner Login:</h1>

			<div id="box">
				<form action="" method="post">
				<label>Name: </label> 
				<input type="text" name="name" class="input" autocomplete="off" id="name"/>
				<label>Password: </label>
				<input type="password" name="password" class="input" autocomplete="off" id="password"/><br/>
				<input type="submit" class="button button-primary" value="Login" id="login"/> 
				<input type="button" class="button button-primary" value="Register" name="register" onclick="registerredirect()"/>
				<span class='msg'></span> 

				<div id="error"></div>	
				</form>	
			</div>
		</div>
	</body>
</html>
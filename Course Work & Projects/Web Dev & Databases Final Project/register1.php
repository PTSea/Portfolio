<html>
<!--Basis for styling of this registration page found here: http://www.9lessons.info/2014/07/ajax-php-login-page.html-->
	<head>
	    <meta charset = "UTF-8" />
		<script src="jquery.min.js"></script>
		<link rel="stylesheet" href="style.css">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#register').click(function() {
					//Here we check the entries and pass them into variables
					var name=document.getElementById('name').value;
					var password=document.getElementById('password').value;
					var email=document.getElementById('email').value;
					//http://www.w3schools.com/php/php_form_url_email.asp
					//here we check that the mail is in the correct format
					var chk = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
					//This section outputs error messages tied to the html ID 'error'
					if(name=='') {
						$('#error').html('<span style="color:#cc0000">Error:</span> You must enter your name');
						return false;
					}
					if(password=='') {
						$('#error').html('<span style="color:#cc0000">Error:</span> You must enter a password');
						return false;
					}
					if(email=='') {
						$('#error').html('<span style="color:#cc0000">Error:</span> You must enter your email');
						return false;
					}
					if(!chk.test(email)) {
						$('#error').html('<span style="color:#cc0000">Error:</span> You must enter a valid email');
						return false;
					}
				});
			});

			//This function controls the redirect of the 'return to login' button
			function loginredirect() {
	    		window.location.href = "index.php";
	    	}
		</script>
	</head>
	<body>
		<?php
			include ('configuration.php');

			ini_set('display_errors', 'On');

			//Modified from lecture code demo
			//We need to first connect to the database
			$mysqli = new mysqli("oniddb.cws.oregonstate.edu", "tanp-db", $myPassword, "tanp-db");
			if ($mysqli->connect_errno) {
			  echo "Failed to connect!: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
			}
			//Check if register button has been hit
			if (isset($_POST['register'])) {
				//set some variables for the fields to the entry for use in the query
				$name=$_POST['name'];
				$password=$_POST['password'];
				$email=$_POST['email'];
				//These queries are check for whether the user already exists
				$namecheck=$mysqli->query("SELECT * FROM UserLogin WHERE name='".$name."' ");
				$nameElement=mysqli_fetch_row($namecheck);

				$emailCheck=$mysqli->query("SELECT * FROM UserLogin WHERE email='".$email."' ");
				$emailElement=mysqli_fetch_row($emailCheck);
				//check that the user exists
				if ($nameElement > 0 && $emailElement <= 0) {
					echo "<div>";
					echo "The username ".$name." has already been registered.";
					echo "</div>";
				}
				elseif ($nameElement > 0 && $emailElement > 0) {
					echo "<div>";
					echo "This user has already been registered.";
					echo "</div>";
				} 
				else {
					//If user does not already exist, then insert user information
					//Modified code from lecture demo
					//Insert data if all form fields have been filled.
					if (!$stmnt = $mysqli->prepare("INSERT INTO UserLogin (name, password, email) VALUES ('".$name."','".$password."','".$email."')")) {
						echo "Prepare failed: (" . $mysqli->errno . ")" . $mysqli->error;
					}
					if (!$stmnt->execute()) {
						echo "Execute failed: (" . $stmnt->errno . ")" . $stmnt->error;
					}
					$stmnt->close();
					//upon success output success statement show a return to login button
					if($stmnt) {
						echo "<span style='color:#cc0000'>Success:</span>Registration complete!";
						echo "<br>";
						echo "<br>";
			    		echo "<input type='button' class='button button-primary' value='Return to Login' name='login' onclick='loginredirect()'>";
					} 
				}
			}
		?>
		<!--This is the registration form-->
		<div class="contact" id="main">
			<h1>Registration Form: </h1>
			<div id="box">
				<form action="#" method="post">
					<label>Name:</label>
					<input type="text" name="name" class="input" autocomplete="off" id="name">
				
					<label>Password:</label>
					<input type="text" name="password" class="input" autocomplete="off" id="password">
				
					<label>Email:</label>
					<input type="text" name="email" class="input" autocomplete="off" id="email">
				
					<input type="submit" class="button button-primary" name="register" id="register" value="Register">
					<div id="error"></div>
					<br>
					<div id="return"></div>
				</form>
			</div>
		</div>

	</body>
</html>
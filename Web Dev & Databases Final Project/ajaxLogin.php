<?php
include ('configuration.php');
ini_set('display_errors', 'On');

session_start();

//Modified from lecture code demo
//We need to first connect to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu", "tanp-db", $myPassword, "tanp-db");
if ($mysqli->connect_errno) {
  echo "Failed to connect!: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
//basis for this login php check found here http://www.9lessons.info/2014/07/ajax-php-login-page.html
if(isset($_POST['name']) && isset($_POST['password'])) {
	//Variables for the username and password sent from the login form
	$name=$_POST['name']; 
	$password=$_POST['password']; 

	//Here we query the table UserLogin and check for the name and password
	$result=mysqli_query($mysqli,"SELECT name FROM UserLogin WHERE name='".$name."' and password='".$password."'");
	//Here we count the number of rows
	$count=mysqli_num_rows($result);

	//Here we get individual rows within the array
	$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
	// If the result matches $name and $password, table row must be 1 row, so we set the $_SESSION to the name
	if($count==1) {
		$_SESSION['login_user']=$row['name'];
		echo $row['name'];
	}
}
?>
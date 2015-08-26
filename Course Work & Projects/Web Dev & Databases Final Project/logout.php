<?php
//This checks that the session is not empty
//if user is loggin in, we clear the session and destroy it
//then we logout and go to the login page
session_start();
if(!empty($_SESSION['login_user'])) {
	$_SESSION['login_user']='';
	session_destroy();
}
header("Location:index.php");
?>

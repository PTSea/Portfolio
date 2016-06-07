<?php
include ('configuration.php');

ini_set('display_errors', 'On');
//Here call session_start() and then check if the user is logged in. If logged in, we extend the session lifetime to 24 hours.
//If not logged in, we redirect to the login page.
session_start();
if(isset($_SESSION['login_user'])) {
  ini_set('session.cookie_lifetime', 86400);
}
else {
	header("Location:index.php");
}


//Modified from lecture code demo
//We need to first connect to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu", "tanp-db", $myPassword, "tanp-db");
if ($mysqli->connect_errno) {
  echo "Failed to connect!: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}


?>

<!DOCTYPE HTML>
<html lang = "en">
    <head>
	    <title>Tanp Planner</title>
	    <meta charset = "UTF-8" />
	    <link rel="stylesheet" href="plannerStyle.css">
	    <link rel="stylesheet" href="https://web.engr.oregonstate.edu/~tanp/CS494/FinalAssignment/bootstrap.css">
	    <style type = "text/php/js"></style>
	    <script>
	    	//Javascript functions to control buttons for changing months
	    	//This function controls going to the previous month and changes the title and year at the top of the planner
	    	//basis for this calendar here: https://www.youtube.com/watch?v=xjrVf_kMFl8&index=1&list=PLE5528CC893BD650D
	    	function gotoLastMonth(month, year) {
	    		if (month == 1) {
	    			--year;
	    			month = 13;
	    		}
	    		--month
	    		var monthstring = ""+month+"";
	    		var monthlength = monthstring.length;
	    		if (monthlength <= 1) {
	    			monthstring = "0"+monthstring;
	    		}
	    		document.location.href = "<?php $_SERVER['PHP_SELF'];?>?month="+monthstring+"&year="+year;
	    	}
	    	//This function controls going to the next month and changes the title and year at the top of the planner
	    	function gotoNextMonth(month, year) {
	    		if (month == 12) {
	    			++year;
	    			month = 0;
	    		}
	    		++month
	    		var monthstring = ""+month+"";
	    		var monthlength = monthstring.length;
	    		if (monthlength <= 1) {
	    			monthstring = "0"+monthstring;
	    		}
	    		document.location.href = "<?php $_SERVER['PHP_SELF'];?>?month="+monthstring+"&year="+year;
	    	}
	    	//This function controls where the logout button redirects to
	    	function logoutredirect() {
	    		window.location.href = "logout.php";
	    	}
	    </script>
	</head>

	<body>
		<?php

			//Here we check if the day has been set
			if (isset($_GET['day'])) {
				$day = $_GET['day'];
			} else {
				$day = date("j");
			}
			//Here we check if the month has been set
			if (isset($_GET['month'])) {
				$month = $_GET['month'];
			} else {
				$month=date("n");	
			}
			//Here we check if the year has been set
			if (isset($_GET['year'])) {
				$year = $_GET['year'];
			} else {
				$year=date("Y");	
			}
			//This calendar variable gets us the current date
			$currentTimeStamp=strtotime("01-$month-$year");
			//Here we get the current month name
			$monthName=date("F", $currentTimeStamp);
			//Here we get the number of days for each month
			$numDays=date("t", $currentTimeStamp);
			//Here we get the name of the day
			$dayName=date("l", $currentTimeStamp);
			//Reset this value for previous and next code
			$currentTimeStamp = strtotime("$day-$month-$year");
			//Here we initialize the counter variable for the cell count in the loop
			$counter=0;

			//The following section displays a session active message and aligns it to one side of the page
			echo "<br>";
			echo "<div class='sessionactive'>";
				echo "<div class='container'>";
					echo "<div class='row'>";
						echo "<div class='col-md-10'>";

					        echo "<ul class='pull-left'>";
					          echo "<li>Welcome, ".$_SESSION['login_user']."</li>";
					        echo "</ul>";

					        echo "<ul class='pull-right'>";
						        if(isset($_SESSION['login_user'])) {
						          echo "<li>Session active...</li>";
						      	}
					        echo "</ul>";

						echo "</div>";
					echo "</div>";
				echo "</div>";
			echo "</div>";
		?>
		<!--The following is the planner header with a catch phrase-->
		<div class="appHeading">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<h1>PLANNER:</h1>
						<!--Pull left and pull right make it so the entries float left and right of my gridded section-->
				        <ul class='pull-left'>
				        	<li>Plan everything, never forget anything...</li>
				        </ul>
				        <ul class='pull-right'>
				        	<li><input type='button' value='Logout' name='logout' onclick="logoutredirect()"></li>
				        </ul>
					</div>
				</div>
			</div>
		</div>

		<!--The following section checks for data and inserts it into the database-->
		<div class="insertionerror">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<?php
							//Test conditions for insertion of data
							if (isset($_POST['add'])) {
								$name = $_SESSION['login_user'];
								$title = $_POST['texttitle'];
								//Real escape string makes it so the user can enter special characters
								//For us it allows the user to enter stuff with apostrophe's in the title and
								//detail sections
								$title = $mysqli->real_escape_string($title);
								$detail = $_POST['textdetail'];
								$detail = $mysqli->real_escape_string($detail);
								$hrshrs = $_POST['Hour'];
								$mnsmns = $_POST['Minutes'];
								$AmPm = $_POST['Ampm'];
								$adder = $_SESSION['login_user'];
								$eventdate = $month."/".$day."/".$year;

								//Query the ID values to make sure they match up for both tables
								$ID = $mysqli->query("SELECT ID FROM UserLogin WHERE name='".$name."' ");
								$IDval;
								while ($IDrow = $ID->fetch_assoc()) {
									$IDval = $IDrow['ID'];
								}

								//Test that fields aren't empty, only proceed if field have been filled.
								if ($_POST['texttitle'] == '' || $_POST['textdetail'] == '' || $_POST['Hour'] == '  ' || $_POST['Minutes'] == '  ') {
								  if ($_POST['texttitle'] == '') {
								    echo "<p> You must enter a title. Try again. </p>";
								  }
								  if ($_POST['textdetail'] == '') {
								    echo "<p> You must enter text into the detail field. Try again. </p>";
								  }
								  if ($_POST['Hour'] == 0) {
								    echo "<p> You must select an hour value. Try again.</p>";
								  }
								  if ($_POST['Minutes'] == 0) {
								    echo "<p> You must select a minute value. Try again.</p>";
								  }
								}
								elseif(isset($_POST['private'])) {
								  //the private check is for when users want the event to be added in for their account only
								  //Modified code from lecture demo
								  //Insert data if all form fields have been filled.
								  if (!$stmnt = $mysqli->prepare("INSERT INTO planner (ID,name,Adder,Title,Hour,Minutes,Ampm,Message,EventDate,DateAdded) VALUES ('".$IDval."','".$name."','".$adder."','".$title."','".$hrshrs."','".$mnsmns."','".$AmPm."','".$detail."','".$eventdate."',now())")) {
								    echo "Prepare failed: (" . $mysqli->errno . ")" . $mysqli->error;
								  }
								  if (!$stmnt->execute()) {
								    echo "Execute failed: (" . $stmnt->errno . ")" . $stmnt->error;
								  }
								  $stmnt->close();
								}
								else {
								  //this is public, the event can be seen by all users
								  //Modified code from lecture demo
								  //Insert data if all form fields have been filled.
								  $pubname = 'public';
								  if (!$stmnt = $mysqli->prepare("INSERT INTO planner (ID,name,Adder,Title,Hour,Minutes,Ampm,Message,EventDate,DateAdded) VALUES ('".$IDval."','".$pubname."','".$adder."','".$title."','".$hrshrs."','".$mnsmns."','".$AmPm."','".$detail."','".$eventdate."',now())")) {
								    echo "Prepare failed: (" . $mysqli->errno . ")" . $mysqli->error;
								  }
								  if (!$stmnt->execute()) {
								    echo "Execute failed: (" . $stmnt->errno . ")" . $stmnt->error;
								  }
								  $stmnt->close();
								}
							}
							//if the cancel button is hit, close the add event pop up
							elseif (isset($_POST['cancel'])) {
							}
						?>
					</div>
				</div>
			</div>
		</div>
		<!--The following section removes stuff from the database-->
		<div class="deletestuff">
			<div class="container">
				<div class="row">
					<div class="col-md-10">
						<?php
							//Remove data from a row
							//Modified from prepared statements documentation
							if (isset($_POST['deleteRow'])) {
								if (!$stmnt = $mysqli->prepare("DELETE FROM planner WHERE ID=?")) {
									echo "Prepare failed: (" . $mysqli->errno . ")" . $mysqli->error;
								}
								if (!$stmnt->bind_param("i", $_POST['rowID'])) {
									echo "Binding failed: (" . $stmnt->errno . ")" . $stmnt->error;
								}
								if (!$stmnt->execute()) {
									echo "Execute failed: (" . $stmnt->errno . ")" . $stmnt->error;
								}
								$stmnt->close();
							}
						?>
					</div>
				</div>
			</div>
		</div>

		<!--The following section generates the dates and the add event button for each day as well as the previous month and next month buttons, and the month and year at the top-->
		<div class="calplanner">
			<div class="container">
				<div class="row">

					<div class="col-md-10">
						<div class="maincalendar">
							<table border='1'>

								<div class="toptitle">
									<tr>
										<td>
											<!--This is the button to go to the previous month-->
											<input style='width:100px' type='button' value='<' name='previousbutton' onclick="gotoLastMonth(<?php echo $month.",".$year;?>);">
										</td>
										<!--Display the current month and year-->
										<td width='700px' align='center'>
											<?php echo $monthName.", ".$year; ?>
										</td>
										<td>
											<!--This is the button to go to the next month-->
											<input style='width:100px' type='button' value='>' name='nextbutton' onclick="gotoNextMonth(<?php echo $month.",".$year;?>);">
										</td>
									</tr>
								</div>

								<div>
									<?php
										echo "<tr>";
										//This for loop fills each of the cells with the dates and an add event button.
										for ($i = 1; $i < $numDays+1; $i++, $counter++) {
											//Here we grab the data from the planner
											$grabPlanner = $mysqli->query("SELECT ID, name, Adder, Title, Hour, Minutes, Ampm, Message, DateAdded, EventDate FROM planner");
											$grabLogin = $mysqli->query("SELECT ID, name, password, email FROM UserLogin");
											$timeStamp = strtotime("$year-$month-$i");
											$dayText = date("D", $timeStamp);
											$monthstring = $month;
											$monthlength = strlen($monthstring);
											$daystring = $i;
											$daylength = strlen($daystring);
											//this appends a zero to the beginning of single digit day numbers
											if ($monthlength <= 1) {
												$monthstring = "0".$monthstring;
											}
											if ($daylength <= 1) {
												$daystring = "0".$daystring;
											}
											//Solution to ordinal number suffix from this stackoverflow page:
											//http://stackoverflow.com/questions/3109978/php-display-number-with-ordinal-suffix
											$ends = array('th','st','nd','rd','th','th','th','th','th','th');
											if (($i %100) >= 11 && ($i %100) <= 13) {
												$abbreviation = $i. 'th';
											} else {
												$abbreviation = $i. $ends[$i % 10];
											}
											//Here we begin to fill in the planner table dates	
											echo "<tr>";
											echo "<td colspan='35' class='daybox'>";
												echo "<div class='day-number'>";
												echo $dayText.", ".$abbreviation;
												echo "</div>";
												echo "<br>";
												echo "<div class='currentEvents'>";
												$eventdate = $month."/".$daystring."/".$year;
												$user = $_SESSION['login_user'];
												$pubname = 'public';
												//the following queries are used to set event display conditions
												$Edate = "SELECT EventDate FROM planner WHERE EventDate='".$eventdate."'";
												$dateResult = $mysqli->query($Edate);

												$pubStuff = "SELECT name FROM planner WHERE name='".$pubname."' ";
												$pubResult = $mysqli->query($pubStuff);

												$userStuff = "SELECT name FROM planner WHERE name='".$user."'";
												$userResult = $mysqli->query($userStuff);

												//Here we check that the event date matches that of the cell, and that the event
												//is either public or only for that user
												if ($dateResult->num_rows > 0) { 
													if ($pubResult->num_rows > 0 || $userResult->num_rows > 0) {
													echo "<table>";
														echo "<div class='Headerbar' id='Headerbar'>";													
														echo "<tr>";
														echo "<td>Time</td> <td>Title</td> <td>Event</td> <td>Date Added: </td>";
														echo "</tr>";
														echo "</div>";
														//fetch_assoc(): Fetch a result row as an associative array
														//Here we use it to populate current planner events into the table corresponding to the date
														while ($invrow = $grabPlanner->fetch_assoc()) {														
															if ($invrow['EventDate'] == $eventdate) {
																$pubname = 'public';															

																if ($invrow['name'] == $_SESSION['login_user'] || $invrow['name'] == $pubname) {
																	//Here we check that the minutes section of time is a 0 (this is because of real escape string function)
																	//if it is 0, we append an extra zero																echo "<div class='Headerbar' id='Headerbar'>";
																	
																	if ($invrow['Minutes'] == 0) {
																		$dblZero = $invrow['Minutes']."0"; 
																		$time = $invrow['Hour'].":".$dblZero.$invrow['Ampm'];
																		echo "<tr>";
																		echo "<td>$time </td>";
																		echo "<td>$invrow[Title] </td>";
																		echo "<td>$invrow[Message] </td>";
																		//we don't display the date added unless the user is the person who entered the event
																		if ($invrow['Adder'] == $_SESSION['login_user']) {
																			echo "<td colspan='1'>$invrow[DateAdded] </td>";  
																		}
																		else {
																			echo "<td>Cannot be viewed.</td>";
																		}
																		echo "<td>";

																		//we don't allow a delete unless the user is the person who entered the event
																		if ($invrow['Adder'] == $_SESSION['login_user']) {
																			echo '<form method="post" action="planner.php">';
																			echo '<input type="hidden" name="rowID" value=' . $invrow['ID'] . '>';
																			echo '<input type="submit" name="deleteRow" id="delete" value="Delete">';
																			echo "</form>";
																		}
																		echo "</td>";

																		echo "</tr>";
																	}
																	//if the minutes section of time is not a zero, we proceed as normal
																	else {
																		$time = $invrow['Hour'].":".$invrow['Minutes'].$invrow['Ampm'];
																		echo "<tr>";
																		echo "<td>$time </td>";
																		echo "<td>$invrow[Title] </td>";
																		echo "<td>$invrow[Message] </td>";
																		//we don't display the date added unless the user is the person who entered the event
																		if ($invrow['Adder'] == $_SESSION['login_user']) {
																			echo "<td colspan='1'>$invrow[DateAdded] </td>";  
																		}
																		else {
																			echo "<td>Cannot be viewed.</td>";
																		}
																		echo "<td>";
																		
																		//we don't allow a delete unless the user is the person who entered the event
																		if ($invrow['Adder'] == $_SESSION['login_user']) {
																			echo '<form method="post" action="planner.php">';
																			echo '<input type="hidden" name="rowID" value=' . $invrow['ID'] . '>';
																			echo '<input type="submit" name="deleteRow" id="delete" value="Delete">';
																			echo "</form>";
																		}
																		echo "</td>";

																		echo "</tr>";
																	}
																}
															}
														}
													}
													echo "</table>";
												}
												echo "</div>";
												echo "<br>";
												//This is a button to add an event.
												echo "<div class='addbutton'>"; 
												echo "<a href='".$_SERVER['PHP_SELF']."?month=".$monthstring."&day=".$daystring."&year=".$year."&v=true&f=true'>Add Event</a>";
												echo "<br>";
												echo "</div>";
												echo "</td>";
											echo "</tr>";
										}
										echo "</tr>";
									?>
								</div>

							</table>
						</div>
					</div>

					<!--The following checks if the add event button has been hit, then displays the add event form-->
					<div>
		  				<div class="col-md-2">
							<div class="eventadder">
								<?php
									if (isset($_GET['v'])) {
										//echo "<a href='".$_SERVER['PHP_SELF']."?month=".$month."&day=".$day."&year=".$year."&v=true&f=true'>Add Event</a>";
										if (isset($_GET['f'])) {
											include ('eventForm.php');
										}
									}
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
	</body>
</html>
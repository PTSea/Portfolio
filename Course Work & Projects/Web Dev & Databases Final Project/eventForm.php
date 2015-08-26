<!--Basis for this event form here: https://www.youtube.com/watch?v=xjrVf_kMFl8&index=1&list=PLE5528CC893BD650D-->
<form name='eventform' method='POST' action="<?php $_SERVER['PHP_SELF']; ?>?month=<?php echo $month;?>&day=<?php echo $day;?>&year=<?php echo $year; ?>&v=true&add=true">
	<fieldset class="eform">
		<div>
			<table width='400px'>
			<?php
				//variables for the abreviated month and date
				$daynoz=date("j", $currentTimeStamp);
				$monthAbrev=date("M", $currentTimeStamp);

				//Solution to ordinal number suffix from this stackoverflow page:
				//http://stackoverflow.com/questions/3109978/php-display-number-with-ordinal-suffix
				$ends = array('th','st','nd','rd','th','th','th','th','th','th');
				if (($daynoz %100) >= 11 && ($daynoz%100) <= 13) {
					$abbreviation = $daynoz. 'th';
				} else {
					$abbreviation = $daynoz. $ends[$daynoz % 10];
				}	
			?>
			<!--Display a message telling user what to do with the form fields.-->
			<h4>Add an event for <?php echo $dayText.", ".$monthAbrev." ".$abbreviation.", ".$year; ?>:</h4>
			</table>
		</div>
		<div>
			<table width='400px'>
				<tr>
					<td width='150px'>TITLE:</td>
				</tr>
				<tr>
					<td width='250px'><input type='text' name='texttitle' style='width:250px'></td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<table width='400px'>
				<tr>
				<!--Time Drop Down-->
				<td>
				TIME:
	            <select id="Hour" name="Hour">
				  <option value="00">  </option>
				  <option value="12">12</option>
	              <option value="01">01</option>
	              <option value="02">02</option>
	              <option value="03">03</option>
	              <option value="04">04</option>
	              <option value="05">05</option>
	              <option value="06">06</option>
	              <option value="07">07</option>
	              <option value="08">08</option>
	              <option value="09">09</option>
	              <option value="10">10</option>
	              <option value="11">11</option>
	            </select>
	          	:
	            <select id="Minutes" name="Minutes">
	              <option value="  ">  </option>
	              <option value="00">00</option>
	              <option value="05">05</option>
	              <option value="10">10</option>
	              <option value="15">15</option>
	              <option value="20">20</option>
	              <option value="25">25</option>
	              <option value="30">30</option>
	              <option value="35">35</option>
	              <option value="40">40</option>
	              <option value="45">45</option>
	              <option value="50">50</option>
	              <option value="55">55</option>
	            </select>

	            <select id="Ampm" name="Ampm">
	              <option value="AM">AM</option>
	              <option value="PM">PM</option>
	            </select>


	          	</td>
	          	<td>
	          		<!--Checkbox to let user keep message private-->
	          		<input type="checkbox" name="private" id="private" value="private">
	              	Keep Private
	          	</td>

				</tr>
			</table>
		</div>
		<br>
		<div>
			<!--This section makes the event box and the add and cancel buttons-->
			<table width='400px'>
				<tr>
					<td width='150px'>DETAIL:</td>
				</tr>
				<tr>
					<td width='250px' ><textarea name='textdetail' rows="10" cols="50"></textarea></td>
				</tr>
				<tr>
					<td>
					<input type='submit' name='add' value='Add Event' style='width:200px'>
					<input type='submit' name='cancel' value='Cancel' style='width:200px' action="planner.php">
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
</form>
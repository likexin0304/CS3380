<!DOCTYPE html>


	<head>
        	<title>CS 3380 LAB 2 </title>
	</head>

	<body>
        	<form action="lab2.php" method="POST">
                Name:
		<br />
                	<input type="text" name="name">
		<br />

                <br />
                Major:
		<br />
		<input type="radio" name="major" value="CS">Computer Science<br>
		<input type="radio" name="major" value="Other">Other<br>
		<br />
		Year:
                <select name="year">
                        <option value="Freshman">Freshman</option>
                        <option value="Sophomore">Sophomore</option>
			<option value="Junior">Junior</option>
			<option value="Senior">Senior</option>
                        </select>
		
                <br />
		<br />
		<input type="submit" name="submit" value="Submit">
		</form>

	
<?php
        if(isset($_POST['submit'])){
        echo"<br>";
        echo"Name: ". $_POST['name']. "<br>";
        echo"Major: ". $_POST['major']. "<br>";
        echo"Year: ". $_POST['year']. "<br>";
        }




<!DOCTYPE HTML>

<html lang="en">
<head>
    <meta charset = "UTF-8">
    <title>LAB 7</title>
    
    <style>
	#wrapper{
		background-color: powderblue;
		text-align:center;
        padding: 15px;
	}
    </style>
    
    
</head>

<body>
	<form action = "" method = "POST" class = "col-md-4 col-md-offset-5" id = "wrapper">
	<select name = "dropDown">


	<?php
	for($i=1;$i<=11;$i++){
		if(isset($_POST['dropDown'])&&$_POST['dropDown']==$i){
			echo"<option selected = 'selected' value = '".$i."'>Query ".$i."</option>";
	
}
		else{
			echo"<option value = '".$i."'>Query ".$i."</option>";	
		}
	}
	?>
</select>
<br>
<br>

<input class = "btn btn-primary" type = "submit" name = "submit" value = "Execute">

</form>
</body>

<?php

	$hostname = 'localhost';
	$username = 'klft2';
	$password = 'likexin#0304';
	$database = 'klft2';
	$link = mysqli_connect($hostname,$username,$password,$database) or die("Connection Error on line 42:".mysqli_connect_error());

	function executeQuery($sql){
		global $link;
		$result = mysqli_query($link,$sql) or die ("Query Error: ".mysqli_error($link));
		echo "<table class = 'table table-hover'><thead>";
		while($fieldinfo = mysqli_fetch_field($result)){
			echo"<th>".$fieldinfo->name."</th>";
		}

		while($row = mysqli_fetch_array($result, MYSQLI_NUM)){
			echo"<tr>";
			foreach($row as $r){
				echo"<td>$r</td>";
			}
			echo"</tr>";
		}
		if($result = mysqli_query($link,$sql)){
			$rowcount = mysqli_num_rows($result);
			printf("Result has %d rows.\n",$rowcount);
		}
	}
	
	if(isset($_POST['submit'])){
		switch($_POST['dropDown']){
			case 1:
				$query = "select District,Population from City where Name = 'Springfield' ORDER BY Population DESC;";
				break;
			case 2:
				$query = "select Name,District,Population from City where CountryCode = 'BRA' ORDER BY Name ASC; ";
				break;
			case 3:
				$query = "select Name,Continent,SurfaceArea from Country ORDER BY SurfaceArea ASC LIMIT 20;";
				break;
			case 4:
				$query = "select Name, Continent,GovernmentForm,GNP from Country where GNP>=200000 ORDER BY Name;";
				break;
			case 5:
				$query = "select * from Country where LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 10 OFFSET 10;";
				break;
			case 6:
				$query = "select Name from City where Name LIKE 'B%%s' ORDER BY Population DESC;";
				break;
			case 7:
				$query = "select City.Name,Country.Name,City.Population from City JOIN Country ON City.CountryCode = Country.Code where City.Population >= 6000000 ORDER BY City.Population DESC;";
				break;
			case 8:
				$query = "select Country.Name,Country.IndepYear,Country. Region from Country LEFT JOIN CountryLanguage ON Country.Code = CountryLanguage.CountryCode WHERE CountryLanguage.Language = 'English' AND IsOfficial ='T' ORDER BY Country.Region ASC, Country.Name;";
				break;
			case 9:
				$query = "select City.Name, (City.Population/Country.Population)*100 AS 'CityPoPer' from City JOIN Country ON City.ID = Country.Capital ORDER BY CityPoPer DESC;";
				break;
			case 10:
				$query = "select CountryLanguage.Language, Country.Name, CountryLanguage.Percentage*Country.Population/100 AS 'NumberOfSpeakers' from Country JOIN CountryLanguage ON Country.Code = CountryLanguage.CountryCode where CountryLanguage.IsOfficial = 'T' ORDER BY NumberOfSpeakers DESC; ";
				break;
			case 11:
				$query = "select Name, region, GNP,GNPOld,(GNP-GNPOld)/GNPOld AS 'RealChangeInGNP' from Country where GNP IS NOT NULL AND GNPOld IS NOT NULL ORDER BY RealChangeInGNP DESC;";

		}
	
		executeQuery($query);
    }

?>
</html>

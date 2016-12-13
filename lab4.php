<!DOCTYPE HTML>
<html>
<head>
    <meta charset=UTF-8>
    <title>Lab4</title>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
    
<body>
    <div class="container"> 
	<br>
	<br>
	<div class="row">
		
		<form action="" method="POST" class="col-md-4 col-md-offset-5">
            
        <select name="dropDown">
			<option value='1'>Classes Table</option>
            <option value='2'>Start Time</option>
            <option value='3'>Department CS</option>
            <option value='4'>Classes on MWF</option>
            <option value='5'>TimeDiff</option>		
        </select>
		
		<br>
		<br>
		
		<input class="btn btn-primary" type="submit" name="submit" value="Execute">
		
		</form>
		</div>
        
        <?php
            
            $hostname = 'localhost';
            $username = 'klft2';
            $password = 'likexin#0304';
            $database = 'klft2';
            $link = mysqli_connect($hostname, $username, $password, $database) or die ("connection Error on Line 31: ".mysqli_connect_error());

                               
            function executeQuery($sql)
            {
                global $link;
                $result = mysqli_query ($link, $sql) or die ("Query Error: " .mysqli_error($link));
                echo "<table class='table table-hover'><thead>";
                while($fieldinfo = mysqli_fetch_field($result)){
                    echo "<th>".$fieldinfo->name."</th>";
                }
                while($row = mysqli_fetch_array($result, MYSQLI_NUM)){
                    echo "<tr>";
                    foreach($row as $r){
                        echo "<td>$r</td>";
                    }
                    echo "</tr>";
                }
            }
            if(isset($_POST['submit'])){
                switch($_POST['dropDown']){
                    case 1:
                        $query = "SELECT * FROM classes;";
                        break;
                    case 2:
                        $query = "select start from classes;";
                        break;
                    case 3:
                        $query = "select * from classes where department = 'CS';";
                        break;
                    case 4:
                        $query ="select name,course_id from classes where days = 'MWF';";
                        break;
                    case 5:
                        $query = "select timediff(end,start) from classes;";
                }
                executeQuery($query);
            }
                               
        ?>
    </div>
    </body>
</html>
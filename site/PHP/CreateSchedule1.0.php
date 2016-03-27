<?php 


?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
<?php
include "../functions.php";
$conn = getCon();

//$class_ID=$_POST[class_id];

$class_ID = array('COMP 249', 'SOEN 341', 'ENGR 201', 'SOEN 228', 'ENGR 213');
$IDs = [];
for ($i = 0; $i < sizeOf($class_ID); $i++){
	echo substr($class_ID[$i],0,4)." ".(int)substr($class_ID[$i],5,3);
		$sql = "select id from course_master_list where course_code = ". substr($class_ID[$i],0,4)." and number = ".substr($class_ID[$i],5,3);
		echo ($sql)."<br/>"; 
		$query = $conn->query($sql);
		echo ($query)."<br/>"; 
		$result = $query->fetch_all();
		echo($result)."<br/>"; 
		$IDs[] = array($classID[$i], $result);

<<<<<<< HEAD
		echo($IDs[$i])."<br/>";
}
$sections = [];
=======
$IDs = array();
for ($i = 0; $i < sizeOf($class_ID); $i++)
		$IDs[$i] = array($classID[$i],"select id from course_master_list where Course_code = 'substr(".$array[$i].",-4)' and number = 'substr(".$array[$i].",5)'");

$sections = array();
>>>>>>> origin/server_side
for ($i = 0; $i < sizeOf($class_ID); $i++)
{
	for ($j = 0; $j < 3; $j++)
	{
<<<<<<< HEAD
	$sql = "select Section from Sections where course_master_list_id = '.$IDs[$i][1]'";
	$result = $conn -> query($sql);
	$sections[] = array($classID[$i], $result);
	echo var_dump($sections[$i][$j])."<br/>";
	}
}
closeCon($conn);
=======
	$sections[$j] = array($classID[$i],"select Section from Sections where course_master_list_id = '".$IDs[$i][1]."'");
	echo $sections[$i][$j];
	}
}

>>>>>>> origin/server_side
?>
</body>
</html>
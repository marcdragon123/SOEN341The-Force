<?php
include "functions.php";
$con = getCon();

//$class_ID=$_POST[class_id];

$class_ID = array('COMP 249', 'SOEN 341', 'ENGR 201', 'SOEN 228', 'ENGR 213');

$IDs = array();
for ($i = 0; $i < sizeOf($class_ID); $i++)
		$IDs[$i] = array($classID[$i],"select id from course_master_list where Course_code = 'substr($array[$i],-4)' and number = 'substr($array[$i],5)'");

$sections = array();
for ($i = 0; $i < sizeOf($class_ID); $i++)
	$sections[$i] = array($classID[$i],"select Section from Sections where course_master_list_id = '$IDs[$i][1]'");


?>
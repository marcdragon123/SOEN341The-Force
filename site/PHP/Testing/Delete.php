<?php
include '../functions.php';
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$con = getCon();
$class = $GLOBALS["class"];
$SID = $GLOBALS["SID"];
$subs = substr($class_ID[$i],0,4);
$subs1 = substr($class_ID[$i],5,3);
$queryforclass = "select select id from course_Master_List where Course_code = '".$subs."' and number = ".$subs1;
$queryresult = $con->query($queryforclass);
$result = mysqli_fetch_all($queryresult);

if ($GLOBALS['Delete'] == TRUE){
    $query = "Delete * from Enrollment where Sections_course_Master_List_id =".$result." and id =".$SID." limit 1";
    $con->$query;
}
closeCon($con);
?>
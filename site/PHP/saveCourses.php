<?php
session_start();
include "functions.php";
$conn = getCon();

$userId = $_SESSION["loginID"];
$array = $_POST['courses'];

echo $userId;

foreach ($array as $color){
echo $color."<br />";

}

?>
<?php
session_start();
include "functions.php";
$conn = getCon();

$userId = $_SESSION["adminID"];

$accessQuery = "SELECT * FROM admin WHERE adminID = '$userId'";
$result = mysqli_query($conn, $accessQuery);
$row = mysqli_fetch_array($result);

$first = $row['first_name'];
$last = $row['last_name'];
$email = $row['email'];

?>
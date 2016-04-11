<?php
//include "functions.php";
session_start();
$conn = getCon();

$userId = $_SESSION["loginID"];

$accessQuery = "SELECT * FROM Student WHERE idStudent = '$userId'";
$result = mysqli_query($conn, $accessQuery);
$row = mysqli_fetch_array($result);

$first = $row['FirstName'];
$last = $row['LastName'];
$email = $row['email'];

?>
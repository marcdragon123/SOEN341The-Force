<?php
session_start();
include "functions.php";
$conn = getCon();

$adminId = $_SESSION['adminID'];
$student = $_POST["studentName"];
$arrayNames = explode(" ", $student);

$first = $arrayNames[0];
$last = $arrayNames[1];

$findQuery = " SELECT * FROM student where BINARY FirstName = '$first' AND BINARY LastName = '$last'";
$result = mysqli_query($conn, $findQuery);
$row = mysqli_fetch_array($result);

$_SESSION["loginID"] = $row['idStudent'];
header("Location: ../index.php");
?>
<?php
include "functions.php";
session_start();
$conn = getCon();

$userId = $_SESSION["loginID"];
$newPass = $_POST["ConfInputPasssword"];

$updateQuery = "UPDATE Student SET password = '$newPass' WHERE idstudent = '$userId'";
mysqli_query($conn,$updateQuery);

header("Location: ../Account.html");
?>
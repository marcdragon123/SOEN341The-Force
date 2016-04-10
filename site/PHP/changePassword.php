<?php
include "functions.php";
session_start();
$conn = getCon();

$userId = $_SESSION["loginID"];
$newPass = $_POST["InputPassword"];

$updateQuery = "UPDATE Student SET password = PASSWORD( '" . $newPass . "') WHERE idstudent = '$userId'";
mysqli_query($conn,$updateQuery);

header("Location: ../Account.html");
?>
<?php
include "functions.php";
session_start();
$conn = getCon();

$userId = $_SESSION["loginID"];

$first = $_POST['fname'];
$last = $_POST['lname'];
$email = $_POST['InputEmail'];
$newPass = $_POST["InputPassword"];

if(strlen($newPass) > 5) {
    $updateQuery = "UPDATE Student SET FirstName = '$first', LastName = '$last', email = '$email', password = PASSWORD( '" . $newPass . "') WHERE idstudent = '$userId'";
    mysqli_query($conn,$updateQuery);
}
else {
     $updateQuery = "UPDATE Student SET FirstName = '$first', LastName = '$last', email = '$email' WHERE idstudent = '$userId'";
    mysqli_query($conn,$updateQuery);
}

header("Location: ../Account.php");
?>
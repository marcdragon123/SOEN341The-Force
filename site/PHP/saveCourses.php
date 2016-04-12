<?php
session_start();
include "functions.php";
$conn = getCon();

$userId = $_SESSION["loginID"];
$array = $_POST['courses'];

foreach ($array as $value) {
    $query = "INSERT INTO transcripts (Completed, Enrollment_Student_idStudent, Enrollment_Sections_course_master_List_id) VALUES (true, '$userId','$value')";
    mysqli_query($conn, $query);
}

header("Location: ../Account.php");

?>
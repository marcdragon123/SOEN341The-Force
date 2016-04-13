<?php
session_start();
include 'functions.php';
$conn = getCon();
$semester = $_POST['semesters'];

$_SESSION['semester'] = $semester;
header('Location: ../index.php');
?>
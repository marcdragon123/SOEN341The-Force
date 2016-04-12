<?php

$conn = getCon();

$query = "SELECT * FROM student";

$result = mysqli_query($conn,$query);

$array = array();
while ($row = mysqli_fetch_array($result)) {
    $array[] = $row['FirstName']. " " . $row['LastName'];
}

echo json_encode($array);
?>
<?php

$email = $_POST["InputEmail"];

$servernamelocal = "192.168.2.36";
$servernameremote = "wolfcall.ddns.net";
$port = 3306;
$username = "SOEN341user";
$password = "G3tR3ck3dS0n";
$schema = "soen341";
	
$conn = new mysqli($servernameremote, $username, $password, $schema, $port);
	
if($conn->connect_error){
    $conn  = new mysqli($servernamelocal, $username, $password, $schema, $port);
		
    if($conn->connect_error)
        die("Connection failed: " . $conn->connect_error);
}

//Create random, 10 characters long, password
$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
$charactersLength = strlen($characters);
$password = '';
for ($i = 0; $i < 10; $i++) {
    $password .= $characters[rand(0, $charactersLength - 1)];
}

$encrypt = password($password);

$updateQuery = "UPDATE student SET password = 'password($encrypt)' WHERE email = '$email'";
mysqli_query($conn, $updateQuery);

$to = $email;
$subject = "Password reset!";
$emailText = "Your password has been reset to the following : ". $encrypt."\n
Please be sure to update your password yourself in the Accounts page, or remember this one!";
$from = "theforce341@gmail.com";

mail($to, $subject, $emailText, $from);

?>
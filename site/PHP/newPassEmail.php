<?php
require 'PHPMailer/PHPMailerAutoload.php';
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


$mail = new PHPMailer();
 
$mail->Host = "smtp.gmail.com";
$mail->Port = 465;
$mail->isSMTP();
//$mail->SMTPDebug = 1;
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
$mail->IsHTML(true);
$mail->Username = "theforce341@gmail.com";
$mail->Password = "force341";
$mail->setFrom("theforce341@gmail.com");
$mail->Subject = "So you forgot your password?";
$mail->Body = "Your password has been reset to".$password."\n be sure to change it in your \"Accounts\" page as soon as possible!";
$mail->AddAddress($email);

$mail->Send();

$updateQuery = "UPDATE student SET password = '$password' WHERE email = '$email'";
mysqli_query($conn, $updateQuery);

header("Location: ../SignIn.php");
?>

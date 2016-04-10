<?php

include 'functions.php';

$link = getCon();

$email = $_POST[inputEmail];
$pass = $_POST[inputPassword];
$result = $link->query($link, $query1 = "select email, password( ' + $pass + ') = password from student where ' + $email + ' = email; " );
$errorstr = "Sorry could not login, invalid password or username. Please resubmit with the right login.";

if($result){
	link($target = "../Account.php" , $link = "Account");
}
else{
	$_POST['error_msg'] = $errorstr;
	header('Location = ../SignIn.html');
}
	
?>	
	
	

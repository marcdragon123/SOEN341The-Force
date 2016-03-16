<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function getCon(){
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
	return $conn;
}

function closeCon($conn){
	$conn->close();
}

function excuteQuery($qry, $conn){
	$res = $conn->query($qry);
	if($res == null || $res === FALSE){
		return false;
	}
	return $res;
	
}

function signUp(){
	$conn = getCon();
	
	$qry = "INSERT INTO STUDENT (FirstName, LastName, password) VALUES (";
	$qry = "'" . $_POST['inputFirstName'] . "', ";
	$qry = "'" . $_POST['inputLastName'] . "', ";
	$qry = "password('" . $_POST['inputPassword'] . "'),";
	$qry = "'" . $_POST['inputemail'] . ");";
	$res = $conn->query($qry);
	
	closeCon($conn);
	if($res){
		header('Location = ../index.html');
	}
}

function signIn(){
	$link = getCon();

	$email = $_POST['inputEmail'];
	$pass = $_POST['inputPassword'];
	$result = $link->query($link, $query1 = "select email, password( ' + $pass + ') = password from student where ' + $email + ' = email; " );
	$errorstr = "Sorry could not login, invalid password or username. Please resubmit with the right login.";
	
	closeCon($link);
	
	if($result){
		//link($target = "../Account.html" , $link = "Account");
		header('Location = ../index.html');
	}
	else{
		$_POST['error_msg'] = $errorstr;
		header('Location = ../SignIn.html');
	}
}
?>
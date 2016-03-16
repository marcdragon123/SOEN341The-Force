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

function signUp($fname, $lname, $pass, $email, $conn){
	$qry = "INSERT INTO STUDENT (FirstName, LastName, password) VALUES (";
	$qry = "'" . $fname . "', ";
	$qry = "'" . $lname . "', ";
	$qry = "password('" . $pass . "'),";
	$qry = "'" . $email . ");";
	$res = $conn->query($qry);
	return $res;
}
?>
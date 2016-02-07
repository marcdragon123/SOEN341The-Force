<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$servernamelocal = "localhost";
$servernameremote = "wolfcall.ddns.net";
$port = 3306;
$user = "SOEN341user";
$password = "G3tR3ck3dS0n";
$schema = "soen341";

function getCon(){
	$conn = new mysqli($servernameremote.":".$port, $username, $password, $schema);
	
	if($conn->connect_error){
		//$conn  = new mysqli($servernamelocal.":".$port, $username, $password);
		
		//if($conn->connect_error)
			die("Connection failed: " . $conn->connect_error);
	}
	return $conn;
}

function closeCon($conn){
	$conn->close();
}

function excuteQuery($qry){
	$res = $conn->query($qry);
	if($res == null || $res === FALSE){
		return false;
	}
	return $res;
	
}
?>

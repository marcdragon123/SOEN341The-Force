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
	
	$qry = "INSERT INTO STUDENT (FirstName, LastName, password, email) VALUES (";
	$qry = $qry. "'" . $_POST['InputFirstName'] . "', ";
	$qry = $qry. "'" . $_POST['InputLastName'] . "', ";
	$qry = $qry. "password('" . $_POST['InputPassword'] . "'),";
	$qry = $qry. "'" . $_POST['InputEmail'] . "');";
	echo $qry;
	$res = $conn->query($qry);
	closeCon($conn);
	if($res){
		header('Location: ../index.html');
		echo("result worked <br />");
	}
	echo "didn't redirect";
}

function signIn(){
	$link = getCon();
	//var_dump($_POST);
	$email = $_POST['inputEmail'];
	$pass = $_POST['inputPassword'];
	$result = $link->query("select email, password( '" . $pass . "') = password from student where '" . $email . "' = email; " );
	$errorstr = "Sorry could not login, invalid password or username. Please resubmit with the right login.";
	
	//echo "select email, password( '" . $pass . "') = password from student where '" . $email . "' = email; " ;
	closeCon($link);
	$row = $result->fetch_row();
	/*echo $row[1]."<br />";
	echo $result->num_rows;*/
	if($row[1] == '1' && $result->num_rows == 1){
		//link($target = "../Account.html" , $link = "Account");
		
		header('Location: ../index.html');
		echo("result worked <br />");
	}
	else{
		$_POST['error_msg'] = $errorstr;
		header('Location: ../SignIn.html');
	}
	echo "didn't redirect";
}

function loadClasses(){
	$conn = getCon();
	
	$result = $conn->query("Select course_code, `number` from course_master_list order  by course_code, `number`;");
	var_dump($result->fetch_all());
	//foreach()
	
	closeCon($conn);
}
?>
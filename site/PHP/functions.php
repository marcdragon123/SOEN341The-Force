<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//header('Content-Type: application/json');


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
	echo $qry."<br />";
	$res = $conn->query($qry);
	$qry = "Select idStudent from student";
	$qry .= "where password('".$_POST['InputPassword']."') = password";
	$qry .= "and email = '".$_POST['InputEmail']."'";
	$res2 = $conn->query();
	var_dump($res2);
	closeCon($conn);
	if($res){
		//header('Location: ../index.html');
		echo("result worked <br />");
	}
	//header('Location: ../index.html');
	echo "didn't redirect";
}

function signIn(){
	$link = getCon();
	//var_dump($_POST);
	$email = $_POST['inputEmail'];
	$pass = $_POST['inputPassword'];
	$qry = "select idstudent, email, password( '" . $pass . "') = password from student where '" . $email . "' = email " ;
	$result = $link->query($qry);
	$errorstr = "Sorry could not login, invalid password or username. Please resubmit with the right login.";
	//echo $qry."<br />";
	//$res = $conn->query($qry);
	//var_dump($result);
	//echo "select email, password( '" . $pass . "') = password from student where '" . $email . "' = email; " ;
	closeCon($link);
	$row = $result->fetch_row();
	//var_dump($row);
	//echo "<br />";
	//echo $result->num_rows;*/
	if($row[2] == '1' && $result->num_rows == 1){
		//link($target = "../Account.html" , $link = "Account");
		$_SESSION['loginID'] = $row[0];
		//var_dump($_SESSION);
		//header('Location: ../index.html');
		//echo("result worked <br />");
	}
	else{
		$_POST['error_msg'] = $errorstr;
		header('Location: ../SignIn.html');
	}
	echo "didn't redirect";
}

function loadClasses($nme){
	$conn = getCon();
	
	$result = $conn->query("Select course_code, `number` from course_master_list order  by course_code, `number`;");
	echo "<code>";
	//print_r(array_values($result->fetch_all()));
	echo "</code>";
	$last = null;
	echo "<div class='panel panel-default'>";
    echo '<div class="panel-heading">Select the courses you have passed below.</div>';
    echo '<div class="panel-body">';
	foreach($result->fetch_all() as $val){
		if($last == null){
			$last = $val[0];
			echo '<h3>'.$val[0].'</h3>';
		}
		else if($last != $val[0]){
			echo "</div><h3>$val[0]</h3><div>";
			$last = $val[0];
		}
		echo "<label><input type='checkbox' name='".$nme."' value='".$val[0]." ".$val[1]."' /> ".$val[0]." ".$val[1]."</label><br/>";
	}
	echo "</div></div></div>";
	
	closeCon($conn);
}

function isLoggedIN(){
	if(isset($_SESSION['loginID'])){
		return;
	}
	else{
		header("Location: wolfcall.ddns.net:8085");
	}
}

?>
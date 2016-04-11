<?php
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//header('Content-Type: application/json');
//following block of code reads the function POST parameter and the corresponding value should point to the method to be invoked. 
if (isset ($_POST['function']) && !empty($_POST['function'])){
	$action = $_POST['function'];
	switch($action){
		case 'loadSchedule' : loadSchedule(); break;
		case 'loadClasses' : loadclasses($_POST['name']); break;
	}
}
function test_tings(){
	echo "HIIIII";
}
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
//closes a connection takes a connection object
function closeCon($conn){
	$conn->close();
}
//takes a query and a connection to run a db query
function excuteQuery($qry, $conn){
	$res = $conn->query($qry);
	if($res == null || $res === FALSE){
		return false;
	}
	return $res;
	
}
//signs up a new user uses post for data
function signUp(){
	
	$conn = getCon();
	
	$qry = "INSERT INTO STUDENT (FirstName, LastName, password, email) VALUES (";
	$qry = $qry. "'" . $_POST['InputFirstName'] . "', ";
	$qry = $qry. "'" . $_POST['InputLastName'] . "', ";
	$qry = $qry. "password('" . $_POST['InputPassword'] . "'),";
	$qry = $qry. "'" . $_POST['InputEmail'] . "');";
	//echo $qry."<br />";
	$res = $conn->query($qry);
	
	$qry = "Select idStudent from student ";
	$qry .= "where password('".$_POST['InputPassword']."') = password ";
	$qry .= "and email = '".$_POST['InputEmail']."'";
	//echo $qry;
	$res2 = $conn->query($qry);
	
	$tmp = $res2->fetch_row();
//	var_dump($res);
	$_SESSION['loginID'] = $tmp[0];
	
//	echo "<br />".$_SESSION['loginID']."<br />";
	
	foreach($_POST["finished"] as $val){
		$qry = "insert into transcripts "
		. "(Enrollment_Student_idStudent, Enrollment_Sections_course_Master_List_id, completed) "
		. "values (".$_SESSION["loginID"].", ".$val.", true)";
//		echo $qry."<br/>";
		$res3= $conn->query($qry);
//		var_dump($res3);
	}
	
	closeCon($conn);
	if($res){
		header('Location: ../index.php');
		echo("result worked <br />");
	}
    else {
        header('Location: ../SignIn.php');
        echo "didn't redirect";
    }
}
//signs the user in with POST data
function signIn(){
	$link = getCon();
	//var_dump($_POST);
	$email = $_POST['inputEmail'];
	$pass = $_POST['inputPassword'];
	$qry = "select idStudent, email, password( '" . $pass . "') = password from student where '" . $email . "' = email " ;
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
		//link($target = "../Account.php" , $link = "Account");
		$_SESSION['loginID'] = $row[0];
		//var_dump($_SESSION);

		header('Location: ../index.php');
		//echo("result worked <br />");
	}
	else{
		$_POST['error_msg'] = $errorstr;
		header('Location: ../SignIn.php');
	}
	echo "didn't redirect";
}

//loads a list of classes takes a name to fill the name attribute of the input
function loadClasses($nme,$msg){
	$conn = getCon();
	
	$result = $conn->query("Select course_code, `number`, id from course_master_list order  by course_code, `number`;");
	//echo "<code>";
	//print_r(array_values($result->fetch_all()));
	//echo "</code>";
	$last = null;
	echo "<div class='panel panel-default'>";
    echo '<div class="panel-heading"><h5> '.$msg.' </h5> </div>';
    echo '<div class="panel-body">';
	foreach($result->fetch_all() as $val){
		if($last == null){
			$last = $val[0];
			echo '<h3>'.$val[0].'</h3><div class="checkboxList">';
		}
		else if($last != $val[0]){
			echo "</div></div><div class='panel-body'><h3>$val[0]</h3><div class='checkboxList'>";
			$last = $val[0];
		}
		echo "<label><input id='cbcourse".$val[2]."' type='checkbox' name='".$nme."[]' value='".$val[2]."' /> ".$val[0]." ".$val[1]."</label><br/>";
	}
	echo "</div></div></div>";
	
	closeCon($conn);
}

//Load classes which were already completed on Account page
//Should be uneditable checkboxes
function loadCompletedClasses($nme,$msg){
	$conn = getCon();
    $id = $_SESSION["loginID"];
    
	$result = $conn->query("Select course_code, number, id from course_master_list order  by course_code, number;");
    
    $completedQuery = "SELECT Enrollment_Sections_course_Master_List_id FROM transcripts WHERE Enrollment_Student_idStudent = '$id'";
    $completed = mysqli_query($conn, $completedQuery);
    $arrayCompleted = mysqli_fetch_all($completed);
	//echo "<code>";
	//print_r(array_values($result->fetch_all()));
	//echo "</code>";
	$last = null;
	echo "<div class='panel panel-default'>";
    echo '<div class="panel-heading"><h5> '.$msg.' </h5> </div>';
    echo '<div class="panel-body">';
    
    //Create normal array containing ids of taken courses
    $array = array();
    for($i = 0; $i < count($arrayCompleted); $i++) {
        $array[] = $arrayCompleted[$i][0];
    }
    
	foreach($result->fetch_all() as $val){
		if($last == null){
			$last = $val[0];
			echo '<h3>'.$val[0].'</h3><div class="checkboxList">';
		}
		else if($last != $val[0]){
			echo "</div></div><div class='panel-body'><h3>$val[0]</h3><div class='checkboxList'>";
			$last = $val[0];
		}
        if(in_array($val[2], $array))
            echo "<label><input id='cbcourse".$val[2]."' type='checkbox' name='".$nme."[]' value='".$val[2]."' checked disabled/> ".$val[0]." ".$val[1]."</label><br/>";
        else
            echo "<label><input id='cbcourse".$val[2]."' type='checkbox' name='".$nme."[]' value='".$val[2]."' /> ".$val[0]." ".$val[1]."</label><br/>";
	}
	echo "</div></div></div>";
}

//A modified version of loadClasses() with the appropriate styling adjustments for the index.php
function loadClassesIndex($nme){
	$conn = getCon();
	
	$result = $conn->query("Select course_code, `number`, id from course_master_list order  by course_code, `number`;");
	//echo "<code>";
	//print_r(array_values($result->fetch_all()));
	//echo "</code>";
	$collapseID = 0; //an ID that will aid in creating groups for the accordion function
	$last = null;

    echo '<div class="panel-body">';
	foreach($result->fetch_all() as $val){
		if($last == null){
			$last = $val[0];
			echo '<a data-toggle="collapse" href="#'.$collapseID.'"><h5>'.$val[0].'</h5></a><div class="panel-collapse collapse checkboxList" id="'.$collapseID.'">';
			$collapseID++;
		}
		else if($last != $val[0]){
			echo "</div></div><div class='panel-body'><a data-toggle='collapse' href='#".$collapseID."'><h5>$val[0]</h5></a><div class='panel-collapse collapse checkboxList' id='".$collapseID."'>";
			$last = $val[0];
			$collapseID++;
		}
		echo "<label><input type='checkbox' name='".$nme."[]' value='".$val[2]."' /> ".$val[0]." ".$val[1]."</label><br/>";
	}
	echo "</div></div>";
	
	closeCon($conn);
}
//checks if the session is set up
function isLoggedIN(){
	if(isset($_SESSION['loginID'])){
		return;
	}
	else{
		header("Location: wolfcall.ddns.net:8085");
	}
}
//loads the schedule for the index page
function loadSchedule() {
	$id = $_SESSION['loginID'];
	$qry = "Select * from enrollment ";
	$qry .= "left join timeslot on timeslot.Sections_Section = enrollment.Sections_Section ";
	$qry .= "and enrollment.Sections_course_Master_List_id = timeslot.Sections_course_Master_List_id ";
	$qry .= "left join course_Master_List on enrollment.Sections_course_Master_List_id = course_master_list.id ";
	$qry .= "where ".$id." = enrollment.student_idstudent";
	//echo "$qry";
	$conn = getCon();
	
	$res = $conn->query($qry);
	
	echo "$(document).ready(function() {"
			."$('#schedule').fullCalendar({"
			."	header: {"
			."	left: '',"
			."	center: '',"
			."	right: ''"
			."},"
			."defaultView: 'agendaWeek',"
			."editable: false,"
			."allDaySlot: false,"
			."eventLimit: true," // allow "more" link when too many events
			."events: [";
	
	while($rows = $res->fetch_assoc()){
		
		foreach (explode(',', $rows['DOW']) as $val){
			echo '{'
				.'title:"'.$rows['Course_code'].' '.$rows['number'].' - '.$rows['Sections_Section'].'",'
				.'start:"'.$rows['start'].'",'
				.'end: "'.$rows['end'].'",'
				.'dow: ['.getDayStr($val).'] '
				.'},';
		}
    }						
	echo "]});});";
	
}
function getFullDay($str){
	$res="";
	$val=$str;

	if($val == "1"){
		$res .= " Monday";
	}elseif ($val == "2") {
		$res .= " Tuesday";
	}elseif ($val == "3"){
		$res .= " Wednesday";
	}elseif ($val == "4"){
		$res .= " Thursday";
	}elseif ($val == "5"){
		$res .= " Friday";
	}elseif ($val == "6"){
		$res .= " Saturday";
	}elseif ($val == "7"){
		$res .= " Sudnay";
	}
	return $res;
}
//converts day of week from letters to numbers
function getDayStr($str){
	//$tokens = explode(',', $str);
	$res = "";
	$val = $str;
	//foreach ($tokens as $val){
		if($val == "M"){
			$res .= " 1,";
		}elseif ($val == "Tu") {
			$res .= " 2,";
		}elseif ($val == "W"){
			$res .= " 3,";
		}elseif ($val == "Th"){
			$res .= " 4,";
		}elseif ($val == "F"){
			$res .= " 5,";
		}elseif ($val == "St"){
			$res .= " 6,";
		}elseif ($val == "Su"){
			$res .= " 7,";
		}
	//}
	//echo substr($res, 0, strlen($res)-1)."<br />";
	return substr($res, 0, strlen($res)-1);
}

//for time conflicts
function getSection($class, $index)
{

	$con = getCon();
	$sql45 = "select Section from Sections where course_Master_List_id = '".$class."'";
	$query45 = $con->query($sql45);
	$resultsec = mysqli_fetch_all($query45);
	$resultsec[$index] = $resultsec[$index][0];
	return $resultsec[$index];
	//print_r($section[$i]." ");
	//echo "<br />";
	closeCon($con);
}

//loads the table that includes student classes
function loadTable(){
	$id = $_SESSION['loginID'];
	$qry = "Select * from enrollment ";
	$qry .= "left join timeslot on timeslot.Sections_Section = enrollment.Sections_Section ";
	$qry .= "and enrollment.Sections_course_Master_List_id = timeslot.Sections_course_Master_List_id ";
	$qry .= "left join course_Master_List on enrollment.Sections_course_Master_List_id = course_master_list.id ";
	$qry .= "where ".$id." = enrollment.student_idstudent";

	$conn = getCon();
	
	$res = $conn->query($qry);
	echo '<table class="table table-bordered">';
	while($row = $res->fetch_assoc()){
		//if 2, echo course c+n, then lectures
		//if 1, echo tuts
	
		//DOW is array of days (either 2 or 1)
		$DOW = explode(',', $row['DOW']);
	
		if (count($DOW)==2){
			//course code + num and then lectures
			echo '<tr>'
			.'<form action="/PHP/Delete.php" id="Delete" method="post"><td rowspan=2>
                            <button type="submit" class="delete">
                                <span class="glyphicon glyphicon-trash"></span>
                            </button> &nbsp;'.$row['Course_code'].' '.$row['number'].'</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.'Section: '.$row['Sections_Section'].'</td>'
			. '<td>Lecture:'.getFullDay(getDayStr($DOW[0])).getFullDay(getDayStr($DOW[1])).'-'.$row['start'].'-'.$row['end'].'</td>'
			.'<input type = "hidden" value = "'.$row['Course_code'].'" name = "Course_code" /> '
			.'<input type = "hidden" value = "'.$row['number'].'" name = "number" /> </form>';
		}
		elseif (count($DOW)==1) {
			//tutorial
			echo '<tr>'
					.'<td>Tutorial:'.getFullDay(getDayStr($DOW[0])).'-'.$row['start'].'-'.$row['end'].'</td>'
					.'</tr>';
		}
	}
	while($rows = $res->fetch_assoc()){
		foreach (explode(',', $rows['DOW']) as $val){
			echo '<tr>'
			     .'<td>'.$rows['Course_code'].' '.$rows['number'].'</td>'
			     .'</tr>';
		}
    }
    echo '</table>';


}
function accessGlobal($s){
    $string = $s;
    $result = $GLOBALS[$string];
    return $result;
} 

function accessPost($s){
    $string = $s;
    $result = $_POST["'".$string."'"];
    return $result;
}

function phpAlert($msg) {
    echo '<script type="text/javascript">alert("' . $msg . '")</script>';
}
/*
function allClasses()
{
	$courses = array();
	$sqlDOW = "select Course_code, number from course_Master_list";
	$query3 = $con->query($sqlDOW);
	$result3 = mysqli_fetch_all($query3);
	$courses = $result3;
	for($i = 0; $i < count($courses; $i++)
	echo course[$i]."<br/>";
			
}
*/
?>
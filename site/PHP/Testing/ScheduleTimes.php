<?php

include "../functions.php";

$con = getCon();

$class_ID = array(0=>'COMP 249', 1=>'SOEN 341', 2=>'ENGR 201', 3=>'SOEN 228', 4=>'ENGR 213');
$section = array(0=>"HO", 1=>"KB", 2=>"TY", 3 =>"RK", 4 =>"CS");
$IDs = array();
$Times = array();
$Timesf = array();
$DOW = array();
$TEMP = array();
$NC = array();
$val = 0;
$val2 = 0;

//stores ID of classes to be retrieved later
for ($i = 0; $i < count($class_ID); $i++){
	$subs = substr($class_ID[$i],0,4);
	$subs1 = substr($class_ID[$i],5,3);
	$sql = "select id from course_Master_List where Course_code = '".$subs."' and number = ".$subs1;
	$query = $con->query($sql);
	$result = mysqli_fetch_array($query);
	$IDs[$i] = $result[0];
	var_dump($IDs[$i]." ");
	echo "<br />";
}

for ($i=0; $i < count($IDs); $i++){
	$sqlstart = "select start from Timeslot where Sections_course_Master_List_id = ".$IDs[$i]."' and Sections_Section = ".substr($section[$i],0,2);
	$query1 = $con->query($sqlstart);
	$result1 = mysqli_fetch_all($query1);
	$Times[$i]=$result1;
	var_dump($Times[$i]." ");
	echo "<br />";
}

for ($i=0; $i < count($IDs); $i++){
	$sqlend = "select end from Timeslot where Sections_course_Master_List_id = ".$IDs[$i]."' and Sections_Section = ".substr($section[$i],0,2);
	$query2 = $con->query($sqlend);
	$result2 = mysqli_fetch_all($query2);
	$Timef[$i]=$result2;
	var_dump($Timef[$i]." ");
	echo "<br />";
}

for ($i=0; $i < count($IDs); $i++){
	$sqlDOW = "select DOW from Timeslot where Sections_course_Master_List_id = ".$IDs[$i]."' and Sections_Section = ".substr($section[$i],0,2);
	$query3 = $con->query($sqlDOW);
	$result3 = mysqli_fetch_all($query3);
	$TEMP[$i] = $result3;
	var_dump($TEMP[$i]." ");
	echo "<br />";
}

for($i=0; $i<count($TEMP); $i++){
	for($j=0; $j<count($TEMP[$i]); $j++){
		if (strlen($TEMP[$i][$j][0])>1){
			$DOW[$i][0] = explode("," , $TEMP[$i][$j][0]);
		}
		else{
			$DOW[$i][$j][0] = $TEMP[$i][$j][0];
		}
	}
}

for ($i=0; $i<count($DOW); $i++){
	for ($j=0; $j<count($DOW[$i]); $j++){
		for($k=0; $k<count($DOW[$i][$j][0]); $k++){
			var_dump($DOW[$i][$j][0][$k]." ");
		}
	}
	echo "<br />";

}
//Olivier Algorithm section
$times = array(false, false, false, false, false);//for all five courses, if no conflic, put to true
for ($i = 0; $i < 5; $i++)
{
	for ($j = $i+1; $j < 5; $j++)
	{
		if ($DOW)
		{
			
		}
	}
}
//These loops will have two checkers for two different indexes in the array of DOW which will check if there is a day of the week where they are equal.

/*for ($i=0; $i<count($DOW); $i++){
	for ($j=0; $j<count($DOW);$j++){
		if ($i==$j){
			continue;
		}
		else{
			if (count($DOW[$j])<1){
				for($k=0; $k<count($DOW[$j]); $k++){
					if($DOW[$i]== $DOW[$j][$k]){
						$NC[$val]=array($i,$j);
						$val++;
					}
					else{
						continue;
					}
						
				}
			}
			else{
				if($DOW[$i]==$DOW[$j]){
					$NC[$val] = array($i,$j);
					$val++;
				}
				else{
					continue;
				}
					
			}
		}
	}	
}*/
closeCon($con);
?>
<?php

include "../functions.php";

$con = getCon();

//$class_ID = array(0=>'COMP 249', 1=>'SOEN 341', 2=>'ENGR 201', 3=>'SOEN 228', 4=>'ENGR 213');
$class_ID = $_POST['chosen'];
$section = array();
$IDs = array();
$Times = array();
$Timesf = array();
$DOW = array();
$TEMP = array();
$NC = array();
$val = 0;
$val2 = 0;
print_r($class_ID);
//stores ID of classes to be retrieved later
/*
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
*/
//pick a section
echo "<br />";
for ($i = 0; $i < count($class_ID); $i++)
{
	$sql45 = "select Section from Sections where course_Master_List_id = '".$class_ID[$i]."'";
	$query45 = $con->query($sql45);
	$resultsec = mysqli_fetch_array($query45);
	$section[$i] = $resultsec[0];
	print_r($section[$i]." ");
	echo "<br />";
}

for ($i=0; $i < count($class_ID); $i++){
	$sqlstart = "select start from Timeslot where Sections_course_Master_List_id = '".$class_ID[$i]."' and Sections_Section = '".$section[$i]."'";
	$query1 = $con->query($sqlstart);
	$result1 = mysqli_fetch_all($query1);
	$Times[$i]=$result1;
	//var_dump($Times[$i][0]." ");
	for($j = 0; $j < 2; $j++)
	{
	$Times[$i][$j] = $Times[$i][$j][0];
	$Times[$i][$j] = str_replace(":","",$Times[$i][$j]);
	}
	print_r($Times[$i]);
	echo "<br />";
}

echo "<br />";
for ($i=0; $i < count($class_ID); $i++){
	$sqlend = "select end from Timeslot where Sections_course_Master_List_id = '".$class_ID[$i]."' and Sections_Section = '".$section[$i]."'";
	$query2 = $con->query($sqlend);
	$result2 = mysqli_fetch_all($query2);
	$Timef[$i]=$result2;
	//var_dump($Timef[$i]." ");
	
	for($j = 0; $j < 2; $j++)
	{
	$Timef[$i][$j] = $Timef[$i][$j][0];
	$Timef[$i][$j] = str_replace(":","",$Timef[$i][$j]);
	}
	print_r($Timef[$i]);
	echo "<br />";
}
echo "<br />";

for ($i=0; $i < count($class_ID); $i++){
	$sqlDOW = "select DOW from Timeslot where Sections_course_Master_List_id = '".$class_ID[$i]."' and Sections_Section = '".$section[$i]."'";
	$query3 = $con->query($sqlDOW);
	$result3 = mysqli_fetch_all($query3);
	$TEMP[$i] = $result3;
	//var_dump($TEMP[$i]." ");
	for($j = 0; $j < 2; $j++)
	{
	$TEMP[$i][$j] = $TEMP[$i][$j][0];
	}
	print_r($TEMP[$i]);
	echo "<br />";
}


for($i=0; $i<count($TEMP); $i++){
	for($j=0; $j<count($TEMP[$i]); $j++){
		if (strlen($TEMP[$i][j])>1){
			$DOW[$i][$j] = explode("," , $TEMP[$i][$j]);
		}
		else{
			$DOW[$i][$j] = $TEMP[$i][$j];
		}
	}
}

for ($j=0; $j<count($DOW); $j++){
	for($k=0; $k<count($DOW[$j]); $k++){
		if (count($DOW[$j][$k])>1){
			for($i=0; $i<count($DOW[$j][$k]); $i++){
				print_r($DOW[$j][$k][$i]);
				echo "<br />";
			}
		
		}
		else{
			print_r($DOW[$j][$k]);
			echo "<br />";
		}
	}
}

$tempo = "";
for ($j=0; $j<count($class_ID); $j++)
{
	$DOW[$j][2] = $DOW[$j][1];
	
	$tempo = $DOW[$j][0];
	
	$DOW[$j][0] = substr($tempo, 0, strpos($tempo, ','));
	$DOW[$j][1] = substr($tempo, strpos($tempo, ',')+1);
	
	
	print_r($DOW[$j]);
	echo "<br />";
}

//Olivier Algorithm section
$timebool = array();//for all five courses, if no conflic, put to true
for ($i = 0; $i < count($class_ID); $i++)
{
	$timebool = false;
}

//will check for the first 4 course
for ($i = 0; $i < count($class_ID)-1; $i++)
{
	for ($j = $i+1; $j < count($class_ID); $j++)
	{
		if ($DOW[$i][0] != $DOW[$j][0] && $DOW[$i][1] != $DOW[$j][0] && $DOW[$i][0] != $DOW[$j][1] && $DOW[$i][1] != $DOW[$j][1])//no common lectures DOW
		{
			if ($DOW[$i][2] != $DOW[$j][2])//no common tutorial DOW
			{
				$timebool[$i] = true;
			}
			else
			{
				if ((int)$Times[$i][2] > (int)$Timef[$j][2])// start of one tutorial is after other, which is good
				{
					$timebool[$i] = true;
				}
				else if ((int)$Times[$i][2] < (int)$Timef[$j][2] && (int)$Times[$i][2] > (int)$Times[$j][2])//starts in middle of other
				{
					$timebool[$i] = false;
				}
				else if ((int)$Times[$j][2] > (int)$Timef[$i][2])
				{
					$timebool[$i] = true;
				}
			}
		}
		else
		{
			if ((int)$Times[$i][0] > (int)$Timef[$j][0])// start of one lecture is after other, which is good
			{
				$timebool[$i] = true;
			}
			else if ((int)$Times[$i][0] < (int)$Timef[$j][0] && (int)$Times[$i][0] > (int)$Times[$j][0])//starts in middle of other
			{
				$timebool[$i] = false;
			}
			else if ((int)$Times[$j][0] > (int)$Timef[$i][0])
			{
				$timebool[$i] = true;
			}
			//Have to check Tutorials again
			if ($DOW[$i][2] != $DOW[$j][2])//no common tutorial DOW
			{
				//don't want to overwrite any previous conflicts
			}
			else
			{
				if ((int)$Times[$i][2] > (int)$Timef[$j][2])// start of one tutorial is after other, which is good
				{
					//don't want to overwrite any previous conflicts
				}
				else if ((int)$Times[$i][2] < (int)$Timef[$j][2] && (int)$Times[$i][2] > (int)$Times[$j][2])//starts in middle of other
				{
					$timebool[$i] = false;
				}
				else if ((int)$Times[$j][2] > (int)$Timef[$i][2])
				{
					//don't want to overwrite any previous conflicts
				}
			}
		}
	}
}
//This is specifically for the fifth course
for ($j = 0; $j < count($class_ID)-1; $j++)
{
if ($DOW[4][0] != $DOW[$j][0] && $DOW[count($class_ID)][1] != $DOW[$j][0] && $DOW[count($class_ID)][0] != $DOW[$j][1] && $DOW[count($class_ID)][1] != $DOW[$j][1])//no common lectures DOW
		{
			if ($DOW[count($class_ID)][2] != $DOW[$j][2])//no common tutorial DOW
			{
				$timebool[count($class_ID)] = true;
			}
			else
			{
				if ((int)$Times[count($class_ID)][2] > (int)$Timef[$j][2])// start of one tutorial is after other, which is good
				{
					$timebool[count($class_ID)] = true;
				}
				else if ((int)$Times[count($class_ID)][2] < (int)$Timef[$j][2] && (int)$Times[count($class_ID)][2] > (int)$Times[$j][2])//starts in middle of other
				{
					$timebool[count($class_ID)] = false;
				}
				else if ((int)$Times[$j][2] > (int)$Timef[count($class_ID)][2])
				{
					$timebool[count($class_ID)] = true;
				}
			}
		}
		else
		{
			if ((int)$Times[count($class_ID)][0] > (int)$Timef[$j][0])// start of one lecture is after other, which is good
			{
				$timebool[count($class_ID)] = true;
			}
			else if ((int)$Times[count($class_ID)][0] < (int)$Timef[$j][0] && (int)$Times[count($class_ID)][0] > (int)$Times[$j][0])//starts in middle of other
			{
				$timebool[count($class_ID)] = false;
			}
			else if ((int)$Times[$j][0] > (int)$Timef[count($class_ID)][0])
			{
				$timebool[count($class_ID)] = true;
			}
			//Have to check Tutorials again
			if ($DOW[count($class_ID)][2] != $DOW[$j][2])//no common tutorial DOW
			{
				//don't want to overwrite any previous conflicts
			}
			else
			{
				if ((int)$Times[count($class_ID)][2] > (int)$Timef[$j][2])// start of one tutorial is after other, which is good
				{
					//don't want to overwrite any previous conflicts
				}
				else if ((int)$Times[count($class_ID)][2] < (int)$Timef[$j][2] && (int)$Times[count($class_ID)][2] > (int)$Times[$j][2])//starts in middle of other
				{
					$timebool[count($class_ID)] = false;
				}
				else if ((int)$Times[$j][2] > (int)$Timef[count($class_ID)][2])
				{
					//don't want to overwrite any previous conflicts
				}
			}
		}
}
for ($i = 0; $i < count($class_ID); $i++)
{
	if ($timebool[$i] == false)
	{
		
		$temp = array();
		$sql = "select Course_code, number from course_Master_List where id = '".$class_ID[$i]."'";
		$query = $con->query($sql);
		$temp = (mysqli_fetch_row($query));
	print_r("Course ".$temp[0]." ".$temp[1]." conflicts with other courses");
	echo "<br />";
	}
	
}

$GLOBALS['Times']=$Times;
$GLOBALS['Timef']=$Timef;
$GLOBALS['DOW']=$DOW;
$GLOBALS['timebool'] = $timebool;

closeCon($con);
//insert redirect header
?>
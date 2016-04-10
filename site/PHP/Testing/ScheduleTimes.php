<?php
include "../functions.php";
session_start();
$con = getCon();
$userId = $_SESSION['loginID'];
//$class_ID = array(0=>'COMP 249', 1=>'SOEN 341', 2=>'ENGR 201', 3=>'SOEN 228', 4=>'ENGR 213');
$class_ID_clone = $_REQUEST['chosen'];
$class_ID = array();
$section = array();
$IDs = array();
$Times = array();
$Timesf = array();
$DOW = array();
$TEMP = array();
$NC = array();
$val = 0;
$val2 = 0;
print_r("User ".$userId." </br>");

//for if he enrolled in classes before
$sqlEnr = "select Sections_course_Master_List_id from enrollment where Student_idStudent = '".$userId."'";
$queryEnr = $con->query($sqlEnr);
$resultEnr = mysqli_fetch_all($queryEnr);
$condition = false;
if (!empty($resultEnr))
{
for ($i = 0; $i < count($resultEnr); $i++)
{
	//print_r($resultEnr[$i][0]." </br>");
	$class_ID[] = $resultEnr[$i][0]; 
	//print_r($enrolled[count($class_ID)+$i]);
}
}
$sqlDel = "delete from enrollment where Student_idStudent = '".$userId."'";
if ($con->query($sqlDel)) {
$queryDel =	$con->query($sqlDel);

}
$resultComp = array();
$sqlComp = "select Completed, Enrollment_Sections_course_Master_List_id from transcripts where Enrollment_Student_idStudent = '".$userId."'";
$queryComp = $con->query($sqlComp);
$resultComp = mysqli_fetch_all($queryComp);

for ($i = 0; $i < count($resultComp); $i++)
{
	for ($j = 0; $j < count($resultComp); $j++)
	{
		$resultComp[$i][$j] = $resultComp[$i][$j][0];
	}
	
}
$done = array();
for ($i = 0; $i < count($resultComp); $i++)
{
	if ($resultComp[$i][0] == true)
	{
		$done[] = $resultComp[$i][1];
	}
}

$errorSSS = array();
$timebool = array();//for all courses, if no conflic, put to true
$index = array();
for ($k = 0; $k < count($class_ID_clone); $k++)
{
	$sqlPre = "select PrereqCourseID from prereq where MainCourseID = '".$class_ID_clone[$k]."'";
	$queryPre = $con->query($sqlPre);
	$resultPre = mysqli_fetch_all($queryPre);
	for ($i = 0; $i < count($resultPre); $i++)
	{
		$resultPre[$i] = $resultPre[$i][0];
	}
	if (!empty($resultPre))
	{
		for ($i = 0; $i < count($resultComp); $i++)
		{
			for ($j = 0; $j < count($resultPre); $j++)
			{
				if ($resultComp[$i][1] == $resultPre[$j])
				{
					if ($resultComp[$i][0] == true)
					{
						if (!in_array($class_ID_clone[$k],$done))//not already done
						{
							if (!in_array($class_ID_clone[$k],$class_ID))//in case picks twice
							$class_ID[] = $class_ID_clone[$k];
						}
					}

				}
			}
		}
	}
	else
	{
		if (!in_array($class_ID_clone[$k],$done))
		{
			if (!in_array($class_ID_clone[$k],$class_ID))//in case picks twice
							$class_ID[] = $class_ID_clone[$k];
		}
	}
}
for ($i = 0; $i < count($class_ID); $i++)
{
	$index[] = 0;
}
for ($i = 0; $i < count($class_ID); $i++)
{
	
	$section[$i] = getSection($class_ID[$i],$index[$i]);
	print_r("section :".$section[$i]." </br>");
	
}

do
{
	if (count($class_ID) > 1)
	{
	for ($i = 0; $i < count($class_ID); $i++)
	{
	if ($timebool[$i] == false)
	{
		if ($i != 0)
		{
			//print_r("NIGGGA </br>");
			$index[$i] += 1;
			print_r("Index :".$index[$i]." </br>");
			if (($timebool[$i] == false) && ($index[$i] == 3))
			{
				$tempy = count($class_ID);
				$errorSSS[] = $class_ID[$i];
	
				array_splice($timebool,$i,1);
				array_splice($index,$i,1);
				array_splice($class_ID,$i,1);
				array_splice($section,$i,1);
	
			}
			else {
				$section[$i] = getSection($class_ID[$i],$index[$i]);
			}
		}
		else
		{
			$index[$i] += 1;
			if (($timebool[$i] == false) && ($index[$i] == 3))
			{
	
				$errorSSS[] = $class_ID[$i];
	
				unset($timebool[0]);
				$timebool2 = array_values($timebool);
				$timebool = array_values($timebool2);
				unset($index[0]);
				$index2 = array_values($index);
				$index = array_values($index2);
				unset($class_ID[0]);
				$class_ID2 = array_values($class_ID);
				$class_ID = array_values($class_ID2);
				unset($section[0]);
				$section2 = array_values($section);
				$section = array_values($section2);
	
	
			}
			else {
				$section[$i] = getSection($class_ID[$i],$index[$i]);
			}
		}
	}
	}
	}
	
	for ($i = 0; $i < count($class_ID); $i++)
	{
		$timebool[$i] = true;
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

	print_r("Times for ".$class_ID[$i]." is: ".$Times[$i][$j]." </br>");
	}
	//print_r($Times[$i]);
	//echo "<br />";
}

//echo "<br />";
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
	print_r("Timef for ".$class_ID[$i]." is: ".$Timef[$i][$j]." </br>");
	}
	//print_r($Timef[$i]);
	//echo "<br />";
}
//echo "<br />";

for ($i=0; $i < count($class_ID); $i++){
	$sqlDOW = "select DOW from Timeslot where Sections_course_Master_List_id = '".$class_ID[$i]."' and Sections_Section = '".$section[$i]."'";
	$query3 = $con->query($sqlDOW);
	$result3 = mysqli_fetch_all($query3);
	$TEMP[$i] = $result3;
	//var_dump($TEMP[$i]." ");
	for($j = 0; $j < 2; $j++)
	{
	$TEMP[$i][$j] = $TEMP[$i][$j][0];
	print_r("DOW for ".$class_ID[$i]." is: ".$TEMP[$i][$j]." </br>");
	}
	//print_r($TEMP[$i]);
	//echo "<br />";
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



$tempo = "";
for ($j=0; $j<count($class_ID); $j++)
{
	$DOW[$j][2] = $DOW[$j][1];
	
	$tempo = $DOW[$j][0];
	
	$DOW[$j][0] = substr($tempo, 0, strpos($tempo, ','));
	$DOW[$j][1] = substr($tempo, strpos($tempo, ',')+1);
	
	
	//print_r($DOW[$j]);
	//echo "<br />";
}

//Olivier Algorithm section


if (count($class_ID) > 1)
{

for ($i = 0; $i < count($class_ID); $i++)
{
	//print_r($Times[$i]." </br>");
	for ($j = 0; $j < count($class_ID); $j++)
	{
		if ($i != $j)
		{
		
			if ($DOW[$i][0] == $DOW[$j][0])
			{
				if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}
			}
			if ($DOW[$i][1] == $DOW[$j][0])
			{
				if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}
			}
			if ($DOW[$i][0] == $DOW[$j][1])
			{
				if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}
			}
			if ($DOW[$i][1] == $DOW[$j][1])
			{
				if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}	
			}
			if ($DOW[$i][2] == $DOW[$j][2])
			{
				if ((int)$Times[$j][1] < (int)$Timef[$i][1] && (int)$Times[$j][1] >= (int)$Times[$i][1])
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}
			}
			if ($DOW[$i][0] == $DOW[$j][2]) // ($DOW[$i][1] == $DOW[$j][2] && $DOW[$j][0] != $DOW[$i][2] && $DOW[$j][1] != $DOW[$i][2])
			{
				if ((int)$Times[$j][1] < (int)$Timef[$i][0] && (int)$Times[$j][1] >= (int)$Times[$i][0])//starts in middle of other
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}
			}
			if ($DOW[$i][1] == $DOW[$j][2])
			{
				if ((int)$Times[$j][1] < (int)$Timef[$i][0] && (int)$Times[$j][1] >= (int)$Times[$i][0])//starts in middle of other
				{
					if ($timebool[$i] == true)
					$timebool[$i] = false;
				}
			}
			if ($DOW[$j][0] == $DOW[$i][2])
				{
					if ((int)$Times[$j][0] < (int)$Timef[$i][1] && (int)$Times[$j][0] >= (int)$Times[$i][1])//starts in middle of other
					{
						if ($timebool[$i] == true)
					$timebool[$i] = false;
					}
				}
			if ($DOW[$j][1] == $DOW[$i][2])
				{
					if ((int)$Times[$j][0] < (int)$Timef[$i][1] && (int)$Times[$j][0] >= (int)$Times[$i][1])//starts in middle of other
					{
						if ($timebool[$i] == true)
					$timebool[$i] = false;
					}
				}
		}
	}
	/*
if ($timebool[$i] == false)
			{
				if ($i != 0)
				{
				//print_r("NIGGGA </br>");
				$index[$i] += 1;
				print_r("Index :".$index[$i]." </br>");
				if (($timebool[$i] == false) && ($index[$i] == 3))
				{
					$tempy = count($class_ID);
					$errorSSS[] = $class_ID[$i];
				
					array_splice($timebool,$i,1);
					array_splice($index,$i,1);
					array_splice($class_ID,$i,1);
					array_splice($section,$i,1);
				
				}
				else {
					$section[$i] = getSection($class_ID[$i],$index[$i]);
				}
				}
				else 
				{
					$index[$i] += 1;
					if (($timebool[$i] == false) && ($index[$i] == 3))
					{
						
						$errorSSS[] = $class_ID[$i];
						
						unset($timebool[0]);
						$timebool2 = array_values($timebool);
						$timebool = array_values($timebool2);
						unset($index[0]);
						$index2 = array_values($index);
						$index = array_values($index2);
						unset($class_ID[0]);
						$class_ID2 = array_values($class_ID);
						$class_ID = array_values($class_ID2);
						unset($section[0]);
						$section2 = array_values($section);
						$section = array_values($section2);
						
						
					}
					else {
						$section[$i] = getSection($class_ID[$i],$index[$i]);
					}
				}
			}
			*/
}

}
if (!in_array(false,$timebool))
		{
			$condition = true;
		}
		
	
}
while ($condition == false);
more:

$Message = "";
//print_r($timebool[0]." Boo");
for ($i = 0; $i < count($errorSSS); $i++)
{
	
	
		$qry = "select Course_code, number from course_Master_List where id = '".$errorSSS[$i]."'";
		
		$query = $con->query($qry);
		$temp = (mysqli_fetch_row($query));
		$Message .= ("Course ".$temp[0]." ".$temp[1]." conflicts with other courses <br />");
		
}		
for ($i = 0; $i < count($class_ID); $i++)
{
	
	{
		$sql = "INSERT INTO enrollment (Student_idStudent, Sections_Section, Sections_course_Master_List_id) Values ('".$userId."', '".$section[$i]."', '".$class_ID[$i]."')";
		//"select Course_code, number from course_Master_List where id = '".$class_ID[$i]."'";
		$query222 = $con->query($sql);
		//echo $_REQUEST['chosen'];
		//$temp = (mysqli_fetch_row($query));
	//print_r("Course ".$temp[0]." ".$temp[1]." conflicts with other courses");
	//echo "<br />";
	}
}
for ($i = 0; $i < count($errorSSS); $i++)
{
print_r($errorSSS[$i]."</br>");
}
//print_r($Message);
$GLOBALS['Times']=$Times;
$GLOBALS['Timef']=$Timef;
$GLOBALS['DOW']=$DOW;
$GLOBALS['timebool'] = $timebool;
$_SESSION['Message'] = $Message;
//print_r($Message);
print_r($_SESSION['Message']);
//echo $Message;
//echo "<script>setTimeout(\"location.href = ' /index.php';\",1500);</script>";
header("Location: /index.php");
//print '<script type="text/javascript">'; 
//print 'alert('.$Message.')'; 
//print '</script>'; 
closeCon($con);

//insert redirect header
?>
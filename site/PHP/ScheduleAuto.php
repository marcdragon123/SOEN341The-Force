<?php
include "functions.php";
session_start();
$con = getCon();
$userId = $_SESSION['loginID'];
$semester = $_SESSION['semester'];
$class_ID = array();
$section = array();
$IDs = array();
$Times = array();
$Timesf = array();
$DOW = array();
$TEMP = array();
$NC = array();
$una = array();
$val = 0;
$val2 = 0;
print_r("User ".$userId." </br>");
$condition = false;

foreach($_POST as $val)
{
 	$una[] = $val;
}
var_dump($_POST);
echo "</br>";
//for if he enrolled in classes before
$sqlEnr = "select Sections_course_Master_List_id from enrollment where Student_idStudent = '".$userId."'";
$queryEnr = $con->query($sqlEnr);
$resultEnr = mysqli_fetch_all($queryEnr);

if (!empty($resultEnr))
{
	for ($i = 0; $i < count($resultEnr); $i++)
	{
		if (count($class_ID) < 5 )
		{
		$class_ID[] = $resultEnr[$i][0];
		}
	}
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
	print_r($resultComp[$i][1]." </br>");
	
	if ($resultComp[$i][0] == false)
	{
		if (count($class_ID) < 5 )
		{
		$class_ID[] = $resultComp[$i][1];
		}
	}
}

$k = 1;
$done = array();
for ($i = 0; $i < count($resultComp); $i++)
{
	if ($resultComp[$i][0] == true)
	{
		$done[] = $resultComp[$i][1];
	}
}

$sqlDel = "delete from enrollment where Student_idStudent = '".$userId."'";
if ($con->query($sqlDel)) {
	$queryDel =	$con->query($sqlDel);
	//$queryDel = $con->query($sqlDel);
	//print_r("DELETED </br>");
}

$errorSSS = array();
$timebool = array();//for all courses, if no conflic, put to true
$index = array();


do
{
	if (count($class_ID) < 5 )
	{
	while (count($class_ID) < 5)
	{
		if (!in_array($k,$class_ID))
		{
		$sqlPre = "select PrereqCourseID from prereq where MainCourseID = '".$k."'";
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
					if (!in_array($k,$done))
					{	
						$class_ID[] = $k;
					}
					}
					
				}
			}
		}
		$k++;
		}
		else 
		{
			if (!in_array($k,$done))
			{
				$class_ID[] = $k;
			}
			$k++;
		}
		}
		else 
			$k++;
	}
	}
	print_r("length is: ".count($class_ID)." </br>");
	while (count($index) < count($class_ID))
	{
		$index[] = 0;
	}
	for ($i=(count($section)); $i < count($class_ID); $i++)
	{
		$section[$i] = getSection($class_ID[$i],$index[$i]);
		print_r("section :".$section[$i]." </br>");
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


	
		//will check for the first 4 course
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
							$timebool[$i] = false;
						}
					}
					if ($DOW[$i][1] == $DOW[$j][0])
					{
						if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$i][0] == $DOW[$j][1])
					{
						if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$i][1] == $DOW[$j][1])
					{
						if ((int)$Times[$j][0] < (int)$Timef[$i][0] && (int)$Times[$j][0] >= (int)$Times[$i][0])
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$i][2] == $DOW[$j][2])
					{
						if ((int)$Times[$j][1] < (int)$Timef[$i][1] && (int)$Times[$j][1] >= (int)$Times[$i][1])
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$i][0] == $DOW[$j][2]) // ($DOW[$i][1] == $DOW[$j][2] && $DOW[$j][0] != $DOW[$i][2] && $DOW[$j][1] != $DOW[$i][2])
					{
						if ((int)$Times[$j][1] < (int)$Timef[$i][0] && (int)$Times[$j][1] >= (int)$Times[$i][0])//starts in middle of other
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$i][1] == $DOW[$j][2])
					{
						if ((int)$Times[$j][1] < (int)$Timef[$i][0] && (int)$Times[$j][1] >= (int)$Times[$i][0])//starts in middle of other
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$j][0] == $DOW[$i][2])
					{
						if ((int)$Times[$j][0] < (int)$Timef[$i][1] && (int)$Times[$j][0] >= (int)$Times[$i][1])//starts in middle of other
						{
							$timebool[$i] = false;
						}
					}
					if ($DOW[$j][1] == $DOW[$i][2])
					{
						if ((int)$Times[$j][0] < (int)$Timef[$i][1] && (int)$Times[$j][0] >= (int)$Times[$i][1])//starts in middle of other
						{
							$timebool[$i] = false;
						}
					}
				}
			}
		}
			for ($i = 0; $i < count($class_ID); $i++)
			{
			if ($timebool[$i] == false)
			{
				if ($i != 0)
				{
				//print_r("NIGGGA </br>");
				$index[$i] += 1;
				//print_r("Index :".$index[$i]." </br>");
				if (($timebool[$i] == false) && ($index[$i] == 3))
				{
					$tempy = count($class_ID);
					$errorSSS[] = $class_ID[$i];
					/*print_r("Here be class_ID: ".$class_ID[$i]."</br>");
					print_r("Here be index: ".$index[$i]."</br>");
					print_r("Here be section: ".$section[$i]."</br>");
					print_r("Here be count: ".$tempy."</br>");*/
					array_splice($timebool,$i,1);
					array_splice($index,$i,1);
					array_splice($class_ID,$i,1);
					array_splice($section,$i,1);
					/*print_r("Here be class_ID: ".$class_ID[$i]." AFTER </br>");
					print_r("Here be index: ".$index[$i]." AFTER </br>");
					print_r("Here be section: ".$section[$i]." AFTER </br>");
					$tempy = count($class_ID);
					print_r("Here be count: ".$tempy." AFTER </br>");*/
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
		if (!in_array(false,$timebool) && count($class_ID) == 5)
		{
			$condition = true;
		}
		
	
}
while ($condition == false || $k > 31);
more:

$Message = "";
print_r($timebool[0]." Boo");
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
		$sql = "INSERT INTO enrollment (Student_idStudent, Sections_Section, Sections_course_Master_List_id, semester) Values ('".$userId."', '".$section[$i]."', '".$class_ID[$i]."', '".$semester."')";

		$query222 = $con->query($sql);
		
	}
}
//for ($i = 0; $i < count($errorSSS); $i++)
{
	//print_r($errorSSS[$i]."</br>");
}
$GLOBALS['Times']=$Times;
$GLOBALS['Timef']=$Timef;
$GLOBALS['DOW']=$DOW;
$GLOBALS['timebool'] = $timebool;
$_SESSION['Message'] = $Message;
header("Location: /index.php");

closeCon($con);

?>

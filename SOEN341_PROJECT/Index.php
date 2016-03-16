<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
	include "functions.php";
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
		<?php
		// put your code here
		echo "test php<br />";
		$con = getCon();
		
		$res = $con->query("Select * from course_master_list;");
		printf("Returned %d rows", $res->num_rows);
		
		closeCon($con);
		?>
    </body>
</html>

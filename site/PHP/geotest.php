<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
include "functions.php"
?>
<html>
    <head>
        <meta charset="UTF-8">
		<style>
			div{
				border: 1px  solid  black;
			}
		</style>
        <title></title>
    </head>
    <body>
		<?php
		$_SESSION['loginID'] = 1;
		// put your code here
		loadSchedule();
		?>
    </body>
</html>

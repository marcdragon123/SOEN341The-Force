<?php
session_start();
?>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <!-- Files for Bootstrap -->
    <!--meta name="viewport" content="width=device-width, initial-scale=1"-->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css" />

    <!-- Files for FullCalendar -->
    <link href='css/fullcalendar.css' rel='stylesheet' />
    <link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='js/lib/moment.min.js'></script>
    <script src='js/lib/jquery.min.js'></script>
    <!--script src='js/fullcalendar.min.js'></script-->
    <script src='js/fullcalendar.js'></script>

    <!-- script for for displaying sections -->
    <script src='js/displaySections.js'> </script>
   

    <!-- Jquery UI -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
      <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
      <script>
      <?php
        include "PHP/functions.php";
      ?>
    </script>
        <title></title>

    </head>
    <body>
      
        <div>
          <?php sectionRadios(3); ?>
        </div>  

</body>
</html>

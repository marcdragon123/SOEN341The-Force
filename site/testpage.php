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
    <!-- Script for producing the table -->
    <script src='js/ClassTable.js'></script>

    <!-- Jquery UI -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
      <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <title></title>
    </head>
    <body>
  
      <ul id="myList">
      </ul>


      
          <div class="checkbox">
                            
                  <label class="checkbox-inline"> 
                    <input type="checkbox" name="dow" id="dow" value="M" name="M"> M
                  </label>

                  <label class="checkbox-inline">
                    <input type="checkbox"  name="dow"id="dow" value="T" name="T"> T
                  </label>

                  <label class="checkbox-inline">
                    <input type="checkbox" name="dow" id="dow" value="W" name="W"> W
                  </label>
                              
                  <label class="checkbox-inline">
                    <input type="checkbox" name="dow" id="dow" value="T" name="R"> T
                  </label>

                  <label class="checkbox-inline">
                    <input type="checkbox" name="dow" id="dow" value="F" name="F"> F
                  </label>
                            
          </div>

          <input type="time" id="startTime" value="00:00:00">
          to
          <input type="time" id="endTime" value="00:00:00">
          <button onclick="myFunction(dow)">Try it</button>
      

      <script>
      function myFunction(checkboxName) {
        /**
          var arr = [];
          for (var i in frm.dow) {
              if (frm.dow[i].checked) {
                  arr.push(frm.dow[i].value);
              }
          }
          var result = arr.toString();
          result = result.concat(" from ");
          */
          var checkboxes = document.getElementsByName(checkboxName);
          var dow = [];
          for (var i=0; i<checkboxes.length; i++) {
            if (checkboxes[i].checked) {
              dow.push(checkboxes[i].value);
            }
          }

          var result = dow.to();
          alert(result);
          
          /*
          var startTime = document.getElementById("startTime").value;
          var endTime = document.getElementById("endTime").value;
          result =  result.concat(startTime, " to ", endTime)
          var node = document.createElement("LI");
          var textnode = document.createTextNode(result);
          node.appendChild(textnode);
          document.getElementById("myList").appendChild(node);
          */
          
      }
      </script>

</body>
</html>

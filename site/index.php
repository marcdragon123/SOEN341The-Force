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
		<link rel="stylesheet" type="text/css" href="css/footer.css">

		<!-- Files for FullCalendar -->
		<link href='css/fullcalendar.css' rel='stylesheet' />
		<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
		<script src='js/lib/moment.min.js'></script>
		<script src='js/lib/jquery.min.js'></script>
		<!--script src='js/fullcalendar.min.js'></script-->
		<script src='js/fullcalendar.js'></script>


		<!-- Jquery UI -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		


		<!-- Script for producing the schedule -->
		<!--<script src='js/schedule.js'></script> -->
				
		<script>
			<?php
				include "PHP/functions.php";
			// put your code here
			loadSchedule();
			?>
		</script>
        <title></title>
    </head>
    <body>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			  </button>
			  <a class="navbar-brand" href="index.php">THE FORCE</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			  <ul class="nav navbar-nav navbar-right">
				<li><a href="Account.html">ACCOUNT</a></li>
				<li><a href="SignIn.php">SIGN OUT</a></li>
				
			  </ul>
			</div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

	<div class="container main-body"> 

		<div class="row semester-row">
			<div class="dropdown">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			    Select Semester
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    <li><a href="#">Winter</a></li>
			    <li><a href="#">Fall</a></li>
			  </ul>
			</div>
		</div>

		<div class="jumbotron">
			<div class="panel-group">
			  <div class="panel panel-default">
			    <div class="panel-heading">
			      <h4 class="panel-title">
			        <a data-toggle="collapse" href="#collapse1"><center>Modify Schedule</center></a>
			   
			      </h4>
			    </div>

			    <form action="/PHP/Testing/ScheduleTimes.php" method="post">

			    <form id="target" action="ScheduleTimes.php" method="post">

			    <div id="collapse1" class="panel-collapse collapse">
			      <div class="panel-body modify-panel">
			      	<div class="col-md-6 checkboxDiv">
			      		<h4> Add Classes</h4>
			      		<!--  <input id="tags" type="text" class="form-control seach-text" placeholder="Ex: COMP 250" name="q">-->
			      		<?php loadClassesIndex("chosen");?>
			      		<!-- JQUery for autocomplete class list -->
			      		<!--  <script>
						  $(function() {
							  var availableTags = 
						    $( "#tags" ).autocomplete({
						      source: availableTags
						    });
						  });
						  </script>-->
			      	</div>

			      	<div class="col-md-4">
			      		<h4> Add Unavailabilities </h4>
				            <div class="checkbox">
				                              
				                    <label class="checkbox-inline"> 
				                      <input type="checkbox" name="dow[]" id="dow" value=" Mon " name="M"> M
				                    </label>

				                    <label class="checkbox-inline">
				                      <input type="checkbox"  name="dow[]"id="dow" value=" Tues " name="T"> T
				                    </label>

				                    <label class="checkbox-inline">
				                      <input type="checkbox" name="dow[]" id="dow" value=" Wed " name="W"> W
				                    </label>
				                                
				                    <label class="checkbox-inline">
				                      <input type="checkbox" name="dow[]" id="dow" value=" Thur " name="R"> T
				                    </label>

				                    <label class="checkbox-inline">
				                      <input type="checkbox" name="dow[]" id="dow" value=" Fri " name="F"> F
				                    </label>
				                              
				            </div>

				            <input type="time" id="startTime" value="00:00:00">
				            to
				            <input type="time" id="endTime" value="00:00:00">
				            <a onclick="addUnv()">Add</a>
				            <ul id="myList"> </ul>
				            
				        <script>
				        //function adds an unavailability to the html list.
				        
				        function addUnv() {
				            var dow = new Array();
				            var lastid = 0;
				            
				            //Use JQuery to retrieve values of checked checkboxes and store them in an array.
				            $.each($("input[name='dow[]']:checked"), function() {
				              dow.push($(this).val());
				            });

				            var result = dow.toString();
				            result = result.concat(" from ");
				            var startTime = document.getElementById("startTime").value;
				            var endTime = document.getElementById("endTime").value;
				            result =  result.concat(startTime, " to ", endTime)

				            var node = document.createElement("LI");
				            var textnode = document.createTextNode(result);
				            node.appendChild(textnode);
				            node.setAttribute('id','item'+lastid);
				            var removeButton = document.createElement('a');

				            removeButton.appendChild(document.createTextNode("X"));
				            removeButton.setAttribute('onClick','removeUnv("'+'item'+lastid+'")');
				            removeButton.setAttribute('class', 'btn btn-link');
				            node.appendChild(removeButton);
				            lastid+=1;
				            document.getElementById("myList").appendChild(node);
				            
				        }
				        //function removes an unavailability from the html list when the remove button is pressed.
				        function removeUnv(itemid){
				          var item = document.getElementById(itemid);
				          document.getElementById("myList").removeChild(item);
				        }
				        </script>
					</div>
						<input type="submit" id="new_worktime" class="btn btn-submit btn-danger recomputeBtn" value = "Recompute"/> 						
						<?php /*
						$Error = $_SESSION['Message'];
						if (!empty($Error))
						{
							print '<script type="text/javascript">';
							print 'alert('.$Error.')';
							print '</script>';
						}*/
						?>
					</form>
                      
                      
                      <form id="target" action="/PHP/ScheduleAuto.php" method="post">
                            <input type="submit" id="new_worktime" class="btn btn-submit btn-danger recomputeBtn" value = "Auto Generate"/>
                    </form>
                      
                      
                      
			      </div>
			    </div>
			  </div>
			</div>
		</div>

		<div class="row" class="schedule-content"> 
			<div class="col-md-6 class-table"> 
                                <?php  loadTable()?>
				<table class="table table-bordered class-list" id="class-table">

				</table>
			</div>
			<div class="col-md-6 schedule-container">
				<div id='schedule'> </div>
			</div>
		</div>
	</div>
    
            <!--div class="site-footer">

        
        <div class="col-xs-6 col-sm-3">
        <center><h3>FRONT END</h3></center><br>
            <center>Julian Ippolito</center>
            <center>Hasan Ahmed</center>
            <center>Jordan Stern</center>
        </div>
        <div class="col-xs-6 col-sm-3">
        <center><h3>BACK END</h3></center><br>
            <center>Georges Mathieu</center>
            <center>Olivier Cameron-Chevrier</center>
            <center>Marc-Andre Dragon</center>
        </div>
        <div class="col-xs-6 col-sm-3">
        <center><h3>DOCUMENTATION</h3></center><br>
            <center>Stefano Pace</center>
            <center>Adam Arcaro</center>
            <center>Joey Tedeschi</center>
        </div>
        <div class="col-xs-6 col-sm-3">
        <center><h3>TESTING</h3></center><br>
            <center>George Theophanous</center>

        </div>

            
        </div-->
</body>
</html>

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
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="Home/index.html">The Force</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="Account.html">Account</a></li>
            <li class="active"><a href="./">Sign out <span class="sr-only">(current)</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
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
			    <form action="javascript:void(0);" method="post">
			    <div id="collapse1" class="panel-collapse collapse">
			      <div class="panel-body modify-panel">
			      	<div class="col-md-6 checkboxDiv">
			      		<h4> Add Classes</h1>
			      		<!--  <input id="tags" type="text" class="form-control seach-text" placeholder="Ex: COMP 250" name="q">-->
			      		<?php loadClassesIndex("chosen");?>
			      		<!-- JQUery for autocomplete class list -->
			      		<!--  <script>
						  $(function() {
							  var availableTags = <?php //echo allClasses() ?>
						    $( "#tags" ).autocomplete({
						      source: availableTags
						    });
						  });
						  </script>-->
			      	</div>
			      	
			      	
			      	<div class="col-md-3">
			      		<h4> Add Unavailabilities </h4>
			      		<div class="days">
			      			
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
						</div>

					
						
						<div class="form-group" class="b1">
							<input type="time" id="startTime" value="00:00:00">
							to
							<input type="time" id="endTime" value="00:00:00">
							<div>
                            	<input  onClick="displayUnavailability(this.form)"> Add </input>
							</div>
							<div id="fail_work_time_add" class="failUnavailabilityBlock" style="color:red;">
								<ul id="unList">

								</ul>
							</div>
						</div>
						<script type="text/javascript">
							function displayUnavailability(form){
								var days =[];
								var result = "";
								for (var i in frm.dow) {
							        if (frm.dow[i].checked) {
							            days.push(frm.dow[i].value);
							        }
							    }
								var startTime = document.getElementById("startTime").value;
								var endTime = document.getElementById("endTime").value;

								for (var i in days){
									result = result.concat(var[i], " ");
									
									}
								}
								result.concat("from", startTime, " to ", endTime);
								var node = document.createElement("LI");
							    var textnode = document.createTextNode(result);
							    node.appendChild(textnode);
							    document.getElementById("unList").appendChild(node);
							}
						</script>
					</div>
					<div class="col-md-3">
						<input type="submit" id="new_worktime" class="btn btn-submit btn-danger recomputeBtn" value = "Recompute Schedule" />
					</div>
					</form>

					<!-- calls php page without refresh -->
					<script type="text/javascript">
					    $("form").submit(function(){
					        var str = $(this).serialize();
					        $.ajax('/PHP/Testing/ScheduleTimes.php', str, function(result){
					            alert(result); 
					        }
					        return(false);
					    });
					</script>
			      	

			      </div>
			    </div>
			  </div>
			</div>
		</div>

		<div class="row" class="schedule-content"> 
			<div class="col-md-6 class-table"> 
				<table class="table table-bordered class-list" id="class-table">

				</table>
			</div>
			<div class="col-md-6 schedule-container">
				<div id='schedule'> </div>
			</div>
		</div>
	</div>
	<form action = "/PHP/geotest.php">
	<input type="submit" />
	<input type = 'text' id = "test" />
	</form>
	<form action="test.php">
		<input type="submit" />
	</form>
</body>
</html>

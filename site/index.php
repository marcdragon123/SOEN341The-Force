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
			    <div id="collapse1" class="panel-collapse collapse">
			      <div class="panel-body modify-panel">
			      	<div class="col-md-6">
			      		<h4> Add Classes</h1>
			      		<input id="tags" type="text" class="form-control seach-text" placeholder="Ex: COMP 250" name="q">
			      		<!-- JQUery for autocomplete class list -->
			      		<script>
						  $(function() {
						    var availableTags = [
						      "ActionScript",
						      "AppleScript",
						      "Asp",
						      "BASIC",
						      "C",
						      "C++",
						      "Clojure",
						      "COBOL",
						      "ColdFusion",
						      "Erlang",
						      "Fortran",
						      "Groovy",
						      "Haskell",
						      "Java",
						      "JavaScript",
						      "Lisp",
						      "Perl",
						      "PHP",
						      "Python",
						      "Ruby",
						      "Scala",
						      "Scheme"
						    ];
						    $( "#tags" ).autocomplete({
						      source: availableTags
						    });
						  });
						  </script>
			      	</div>
			      	<div class="col-md-6">
			      		<h4> Add Unavailabilities </h4>
			      		<div class="days">
							<div class="checkbox">
													
								<label class="checkbox-inline">	
									<input type="checkbox" id="work_monday" value="M" name="M"> M
								</label>

								<label class="checkbox-inline">
									<input type="checkbox" id="work_tuesday" value="T" name="T"> T
								</label>

								<label class="checkbox-inline">
									<input type="checkbox" id="work_wednesday" value="W" name="W"> W
								</label>
														
								<label class="checkbox-inline">
									<input type="checkbox" id="work_thursday" value="T" name="R"> T
								</label>

								<label class="checkbox-inline">
									<input type="checkbox" id="work_friday" value="F" name="F"> F
								</label>
													
							</div>
						</div>

						<div class="form-group" class="b1">
							<input id="time_data" class="time-input" type="text" placeholder="Ex: 14:00-16:00">
							<button type="button" id="new_worktime" class="btn btn-submit">Add</button>
							<div id="fail_work_time_add" style="color:red;"></div>
						</div>
			      	</div>

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

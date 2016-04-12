<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/CSS.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <link rel="stylesheet" type="text/css" href="css/admin.css">
           
        <!--Form validation-->
        <script type="text/javascript" src="js/validator.js"></script>
        <!-- Pass checker -->
        <script type="text/javascript" src="js/AccountJS.js"></script>
        <script>
            <?php
            include 'PHP/accessAccountInfo.php';
            //include 'PHP/functions.php';  
            echo "var tmp;";
            ?>
        </script>
        <script type = "text/javascript">
            var auto = {};
            $("#studentName").on('keydown', function() {
                var autoStudent = <?php include('PHP/autoCompleteStudent.php'); ?>;
                auto = {
                    source: function( request, resp ) {
                        var reg = $.ui.autocomplete.escapeRegex( request.term );
                        var matcher = new RegExp(reg, "i");

                        //Call function on each term in echoed array, if matched then return
                        resp($.grep(autoStudent, function(item, index){
                            return matcher.test(item);
                        }) );
                    }
                };
                $("#studentName").autocomplete(auto);
            });
        </script>

       
        <title>My Account</title>
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
                        <li><a href="SignIn.php">SIGN OUT</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <form id = "accountForm" name = "accountForm" role="form" data-toggle="validator" method="post" action = "PHP/changePassword.php"> 
            <h2>My Account</h2>
            <div class="rowTabs">
                <div class="col-md-4">
                    <div class="contain">
                        <div class="form-group">
                            <label for="name">First Name</label>
                            <input type="text" class="form-control" id="fname" placeholder="First name" value = "<?php echo $first; ?>">
                        </div>
                        <div class="form-group">
                            <label for="name">Last Name</label>
                            <input type="text" class="form-control" id="lname" placeholder="Last name" value = "<?php echo $last; ?>">
                        </div>
                        <div class="form-group">
                            <label for="name">Email</label>
                            <input type="text" id="email" class="form-control" name="InputEmail" placeholder="Email*" data-error="That email address is invalid." value = "<?php echo $email; ?>" required>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label for="name">New Password</label>
                            <input type="password" data-minlength="6" class="form-control" id = "pwd" name="InputPassword" placeholder="Password*" required>
                            <span class="help-block">Minimum of 6 characters</span>
                        </div>
                        <div class="form-group">
                            <label for="name">Confirm New Password</label>
                            <input type="password" data-minlength="6" class="form-control" id = "confpwd" name="ConfInputPassword" onkeyup="checkPass(); return false;" placeholder="Password*" required>
                        </div>
                        <span id="confirmMessage" class="confirmMessage"></span>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="contain">
                   <div class="panel panel-default">
                        <div class="panel-heading">View Student Page as Administrator</div>
                        <div class="panel-body">
                            <div class="col-md-6">
			      		    <h4> Search for a student</h1>
			      		    <input type="text" class="form-control seach-text" placeholder="Ex: John Doe" id = "studentName" name="studentName">
			      	</div>
                        </div>
                    </div>
                </div>
            </div> 
            <div class="form-group">
                <button type="submit" onclick="popUpPass();checkPass()" class="btnModal btn-primary" id = "accountSubmit">Submit Changes</button>
            </div>
        </form>

        <div class="site-footer">
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
        </div>
    </body>
</html>
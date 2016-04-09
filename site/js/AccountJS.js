function validateEmail()  
{  
	var email = document.getElementById("email").value;
	var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if(!mailFormat.test(email))
	{
        alert("Wrong email format! Please enter a valid email.");
        return false;
    }

}  

//Javascript popup
function popUpPass()
{
//Validate password for the account tab
var password = document.getElementById("pwd").value;
var confirmPassword = document.getElementById("confpwd").value;
var bool = true;
if (password != confirmPassword) {
	alert("The passwords do not match");
	document.getElementById("pwd").style.borderColor = "#E34234";
	document.getElementById("confpwd").style.borderColor = "#E34234";
	bool = false;
	}
	return bool;
}


//Checking as user is typing 
function checkPass()
{
	//Store the password field objects into variables ...
	var pass1 = document.getElementById('pwd');
	var pass2 = document.getElementById('confpwd');
	//Store the Confimation Message Object ...
	var message = document.getElementById('confirmMessage');
	//Set the colors we will be using ...
	var goodColor = "#66cc66";
	var badColor = "#ff6666";
	//Compare the values in the password field 
	//and the confirmation field
	if(pass1.value == pass2.value){
		//The passwords match, good colour appears. 
		pass2.style.backgroundColor = goodColor;
		message.style.color = goodColor;
		message.innerHTML = "Passwords Match!"
	}
	else{
		//The passwords do not match, bad colour appears.
		pass2.style.backgroundColor = badColor;
		message.style.color = badColor;
		message.innerHTML = "Passwords Do Not Match!"
	}
}  
function passLength()
{
    var pass1 = document.getElementById('pwd');
    var passInt = parseInt(pass1.length);
    if(passInt.length < 6){
        alert("Password needs to be minimum 6 characters");
        return false;
	}
}
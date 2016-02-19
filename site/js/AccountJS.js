//Javascript popup
function popUpPass()
{	
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
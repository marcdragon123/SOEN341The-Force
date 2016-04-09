//Validate email
function validateEmail()  
{  
	var email = document.getElementById('email');
	var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if (!mailFormat.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;

}  
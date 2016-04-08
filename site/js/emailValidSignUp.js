//Valid email
email = document.getElementById("email");
function validateEmail()  
{  
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(email.value.match(mailformat))
        {
            return true;
        }
    else 
    {
        alert("Invalid email format!");
        return false;
    }
	
}  

/**
* name: name of the class for which the sections are being displayed
* sectionsArray: array of sections
*/
function displaySections(cb){
	var id = "#".concat(cb.value,"Section");
	if (cb.checked == true){
		$(id).show();
	}
	if (cb.checked == false){
		$(id).hide();
	}
	
	/*
	for (var i = 0; i < sectionArray.value; i++){
		var x = document.createElement("INPUT");
   		x.setAttribute("type", "radio");
   		x.setAttribute("name", name);
   		x.setValue("value", sectionArray[i]);
    	document.getElementByID(name).appendChild(x);
	}
	*/
}
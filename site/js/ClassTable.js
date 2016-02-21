$(document).ready(function() {
	var classes = '{"classes":[' +
		'{"class":"SOEN 341","lecture":"Lecture: Mon & Wed 2:45 - 5:30", "tutorial":"Tutorial: Mon & Wed 2:45 - 5:30"  },' +
		'{"class":"ENGR 202","lecture":"Lecture: Mon & Wed 2:45 - 5:30", "tutorial":"Tutorial: Mon & Wed 2:45 - 5:30" },' +
		'{"class":"ENGR 371","lecture":"Lecture: Mon & Wed 2:45 - 5:30", "tutorial":"Tutorial: Mon & Wed 2:45 - 5:30" }]}';

	var classList = JSON.parse(classes);

	var table  = document.getElementById("class-table");
	
	var len;
	for(var i=0, len = classList.classes.length; i < len; i++){
		var tr = table.insertRow(table.rows.length);

		var td = tr.insertCell(0);
		td.setAttribute("rowspan",2);
		td.innerHTML = classList.classes[i].class;
		var td = tr.insertCell(1);
		td.innerHTML = classList.classes[i].lecture;

		var tr = table.insertRow(table.rows.length);
		var td = tr.insertCell(0);
		td.innerHTML = classList.classes[i].tutorial;
	}

});
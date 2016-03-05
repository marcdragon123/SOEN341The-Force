$(document).ready(function() {
		
		$('#schedule').fullCalendar({
			header: {
				left: '',
				center: '',
				right: ''
			},

			defaultView: 'agendaWeek',
			
			editable: false,
			allDaySlot: false,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title:"SOEN 341",
    				start: '8:45',
    				end: '10:15', 
    				dow: [ 3, 5], 
    			},
    			{
					title:"ENGR 371",
    				start: '14:45',
    				end: '17:15', 
    				dow: [ 2, 4] 
    			},
    			{
					title:"ENGR 202",
    				start: '13:15',
    				end: '14:30', 
    				dow: [ 1, 4] 
    			},			
			]
		});
		
	});
use soen341;

select Section, course_Master_List_id 
from Sections;

insert into Timeslot(Sections_Section, Sections_course_Master_List_id) 
select Section, course_Master_List_id 
from Sections;


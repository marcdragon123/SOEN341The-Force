use soen341;

insert into sections(course_Master_List_id,Section, Semester) values 
(((select 1 id from course_master_list),(SUBSTRING(MD5(RAND()) FROM 1 FOR 2),"Fall")));

select Section, course_Master_List_id 
from Sections;

insert into Timeslot(Sections_Section, Sections_course_Master_List_id) 
select Section, course_Master_List_id 
from Sections;


use soen341;
select * from course_Master_List;
select Completed, Enrollment_Sections_course_Master_List_id from transcripts where Enrollment_Student_idStudent = 1;
select * from transcripts;
select * from timeslot where Sections_course_Master_List_id = 3;
delete from  transcripts where Enrollment_Student_idStudent  = 1;
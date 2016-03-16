USE soen341;

Select * from student;
#Alter table student modify column student.idStudent int auto_increment;
#Select * from information_schema.tables
Show columns from student;

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','GMASASASASA', password('BLAHBLAH'), 'gm@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Adam','Arcaro','AAASASASASA', password('BLAHBLAH'), 'aa@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Hassan','Somehting','HSASASASASA', password('BLAHBLAH'),'hs@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('George','SomethingwithaT','GTASASASASA', password('BLAHBLAH'),'gt@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Marc-Andre','Dragon','MDASASASASA', password('BLAHBLAH'),'md@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Stefano','Pace','SPASASASASA', password('BLAHBLAH'),'sp@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Olivier','CC','OCCASASASASA', password('BLAHBLAH'),'oc@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Joe','Tedeschi','JTASASASASA', password('BLAHBLAH'),'jt@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Julian','Ippolito','JIASASASASA', password('BLAHBLAH'),'ji@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Jordan','Stern','JSASASASASA', password('BLAHBLAH'),'js@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Kuan','Jiang','KJASASASASA', password('BLAHBLAH'),'kj@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','aASASASASA', password('BLAHBLAH'),'mkdl@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','bASASASASA', password('BLAHBLAH'),'ab@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','cASASASASA', password('BLAHBLAH'),'ac@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','dASASASASA', password('BLAHBLAH'),'ad@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','eASASASASA', password('BLAHBLAH'),'ae@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','fASASASASA', password('BLAHBLAH'),'af@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','gASASASASA', password('BLAHBLAH'),'ag@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','hASASASASA', password('BLAHBLAH'),'ah@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','iASASASASA', password('BLAHBLAH'),'aj@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','jASASASASA', password('BLAHBLAH'),'ak@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','kASASASASA', password('BLAHBLAH'),'al@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','lASASASASA', password('BLAHBLAH'),'am@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','mASASASASA', password('BLAHBLAH'),'an@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','nASASASASA', password('BLAHBLAH'),'ao@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','oASASASASA', password('BLAHBLAH'),'ap@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','pASASASASA', password('BLAHBLAH'),'aq@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','qASASASASA', password('BLAHBLAH'),'ar@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','rASASASASA', password('BLAHBLAH'),'as@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','sASASASASA', password('BLAHBLAH'),'at@email.com');


Show columns from addresses;
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));
 
insert into addresses 
(address, `line 2`, city, province, country, zip_code, mailing, home, Student_idStudent) values 
(cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), cast(round(rand(),18) as char(20)), 'canada', cast(round(rand(),18) as char(20)), true, true, cast((floor(round(rand(),18) * (Select count(*) from student)+1)+1) as char(20)));

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);

insert into prereq values
(floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1, floor(round(rand(),18) * (Select count(*) from course_master_list)+1)+1);
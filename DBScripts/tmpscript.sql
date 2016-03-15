USE soen341;

Select * from student;
#Alter table student modify column student.idStudent int auto_increment;
#Select * from information_schema.tables
Show columns from student;

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','GMASASASASA', password('BLAH'), 'gm@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Adam','Arcaro','AAASASASASA', password('BLAH'), 'aa@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Hassan','Somehting','HSASASASASA', password('BLAH'),'hs@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('George','SomethingwithaT','GTASASASASA', password('BLAH'),'gt@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Marc-Andre','Dragon','MDASASASASA', password('BLAH'),'md@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Stefano','Pace','SPASASASASA', password('BLAH'),'sp@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Olivier','CC','OCCASASASASA', password('BLAH'),'oc@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Joe','Tedeschi','JTASASASASA', password('BLAH'),'jt@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Julian','Ippolito','JIASASASASA', password('BLAH'),'ji@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Jordan','Stern','JSASASASASA', password('BLAH'),'js@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Kuan','Jiang','KJASASASASA', password('BLAH'),'kj@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','aASASASASA', password('BLAH'),'mkdl@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','bASASASASA', password('BLAH'),'ab@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','cASASASASA', password('BLAH'),'ac@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','dASASASASA', password('BLAH'),'ad@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','eASASASASA', password('BLAH'),'ae@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','fASASASASA', password('BLAH'),'af@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','gASASASASA', password('BLAH'),'ag@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','hASASASASA', password('BLAH'),'ah@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','iASASASASA', password('BLAH'),'aj@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','jASASASASA', password('BLAH'),'ak@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','kASASASASA', password('BLAH'),'al@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','lASASASASA', password('BLAH'),'am@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','mASASASASA', password('BLAH'),'an@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','nASASASASA', password('BLAH'),'ao@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','oASASASASA', password('BLAH'),'ap@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','pASASASASA', password('BLAH'),'aq@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','qASASASASA', password('BLAH'),'ar@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','rASASASASA', password('BLAH'),'as@email.com');

insert into student (FirstName, LastName, PermenantCode, `password`, email) 
values ('Georges','Mathieu','sASASASASA', password('BLAH'),'at@email.com');


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
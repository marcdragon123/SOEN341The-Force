USE soen341;

Select * from student;
#Alter table student modify column student.idStudent int auto_increment;
#Select * from information_schema.tables
Show columns from student;

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','GMASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Adam','Arcaro','AAASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Hassan','Somehting','HSASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('George','SomethingwithaT','GTASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Marc-Andre','Dragon','MDASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Stefano','Pace','SPASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Olivier','CC','OCCASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Joe','Tedeschi','JTASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Julian','Ippolito','JIASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Jordan','Stern','JSASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Kuan','Jiang','KJASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','aASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','bASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','cASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','dASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','eASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','fASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','gASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','hASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','iASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','jASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','kASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','lASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','mASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','nASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','oASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','pASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','qASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','rASASASASA', password('BLAH'));

insert into student (FirstName, LastName, PermenantCode, `password`) 
values ('Georges','Mathieu','sASASASASA', password('BLAH'));


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
 
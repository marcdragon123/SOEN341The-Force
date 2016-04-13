-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema soen341
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema soen341
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soen341` DEFAULT CHARACTER SET utf8 ;
USE `soen341` ;

-- -----------------------------------------------------
-- Table `soen341`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`student` (
  `idStudent` INT(11) NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PermenantCode` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 605
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`addresses` (
  `idAddresses` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `line 2` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `zip_code` VARCHAR(45) NULL DEFAULT NULL,
  `mailing` TINYINT(1) NULL DEFAULT NULL,
  `home` TINYINT(1) NULL DEFAULT NULL,
  `Student_idStudent` INT(11) NOT NULL,
  PRIMARY KEY (`idAddresses`, `Student_idStudent`),
  INDEX `fk_Addresses_Student_idx` (`Student_idStudent` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`admin` (
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `adminID` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`adminID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`course_master_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`course_master_list` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Course_code` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `Credits` INT(11) NULL DEFAULT NULL,
  `Suggested_Semester` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`sections` (
  `Section` VARCHAR(45) NOT NULL,
  `Semester` VARCHAR(45) NULL DEFAULT NULL,
  `course_Master_List_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Section`, `course_Master_List_id`),
  INDEX `fk_Sections_course_Master_List1_idx` (`course_Master_List_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`enrollment` (
  `Student_idStudent` INT(11) NOT NULL,
  `Sections_Section` VARCHAR(45) NOT NULL,
  `Sections_course_Master_List_id` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(45) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`semester`, `Student_idStudent`, `Sections_Section`, `Sections_course_Master_List_id`),
  INDEX `fk_Enrollment_Sections1_idx` (`Sections_Section` ASC, `Sections_course_Master_List_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`prereq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`prereq` (
  `MainCourseID` VARCHAR(45) NOT NULL,
  `PrereqCourseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MainCourseID`, `PrereqCourseID`),
  INDEX `fk_Prereq_course_Master_List2_idx` (`PrereqCourseID` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`timeslot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`timeslot` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Sections_Section` VARCHAR(45) NOT NULL,
  `Sections_course_Master_List_id` VARCHAR(45) NOT NULL,
  `start` TIME NOT NULL,
  `end` TIME NOT NULL,
  `DOW` CHAR(5) NOT NULL,
  PRIMARY KEY (`id`, `Sections_Section`, `Sections_course_Master_List_id`),
  INDEX `fk_Timeslot_Sections1_idx` (`Sections_Section` ASC, `Sections_course_Master_List_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1121
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`transcripts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`transcripts` (
  `Grade` VARCHAR(45) NULL DEFAULT NULL,
  `Completed` TINYINT(1) NULL DEFAULT NULL,
  `Semester` VARCHAR(45) NULL DEFAULT NULL,
  `Enrollment_Student_idStudent` INT(11) NOT NULL,
  `Enrollment_Sections_Section` VARCHAR(45) NOT NULL DEFAULT 'DY',
  `Enrollment_Sections_course_Master_List_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Enrollment_Student_idStudent`, `Enrollment_Sections_Section`, `Enrollment_Sections_course_Master_List_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soen341`.`transcripts_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`transcripts_has_courses` (
  `transcripts_Student_idStudent` INT(11) NOT NULL,
  `courses_department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transcripts_Student_idStudent`, `courses_department`),
  INDEX `fk_transcripts_has_courses_courses1_idx` (`courses_department` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Loading test data

insert into admin (`username`, `password`, `first_name`, `last_name`)
values ('mstyoda', password('there is no try'), 'Master', 'Yoda');

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
 
 INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 232,'Mathematics for Computer Science',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 248,'Object-Oriented Programming I',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 201,'Professional Practice & Responsibility',1.5);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 213,'Applied Ordinary Differential Equations',3);

#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('General Education Elective',null,null);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 249,'Object-Oriented Programming II',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 233,'Applied Advanced Calculus',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 228,'System Hardware',4);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 287,'Introduction to Web Applications',3);

#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('Basic Science',null,null);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 348,'Principles of Programming Languages',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 352,'Data Structures and Algorithms',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENCS', 282,'Technical Writing and Communication',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 202,'Sustainable Development and Environmental Stewardship',1.5);
#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('Basic Science',null,null);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 346,'Operating Systems',4);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ELEC', 275,'Principles of Electrical Engineering',3.5);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 371,'Probability and Statistics in Engineering',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 331,'Introduction to Formal Methods for Software Engineering',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 341,'Software Process',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('COMP', 335,'Introduction to Theoretical Computer Science',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 342,'Software Requirements and Specifications',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 343,'Software Architecture and Design I',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 384,'Management Measurement and Quality Control',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 391,'Numerical Methods in Engineering',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 344,'Software Architecture and Design II',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 345,'Software Testing, Verification and Quality Assurance',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 357,'User Interface Design',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 390,'Software Engineering Team Design Project',3.5);

#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('Elective',null,null);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 490,'Capstone Software Engineering Design Project',4);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 301,'Engineering Management Principles and Economics',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 321,'Information Systems Security',3);

#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('Technical Elective	 ',null,null);
#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('Technical Elective',null,null);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 385,'Control System',3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 392,'Impact of Technology on Society',3);
#INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('SOEN', 490,'Capstone Software Engineering Design Project',4);

INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('BIOL', 206, 'Elementary genetics', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('BIOL', 261, 'Molecular and General Genetics', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('CHEM', 217, 'Introductory Analytic Chemistry I', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('CHEM', 221, 'Introductory Organic Chemsitry', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('CIVI', 231, 'Geology for Civil Engineers', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ELEC', 321, 'Introduction to Semiconductor Materials and Devices', 3.5);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 242, 'Statics', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 251, 'Thermodynamics I', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('ENGR', 361, 'Fluid Mechanics I', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('MECH', 221, 'Materials Science', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('PHYS', 252, 'Optics', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('PHYS', 384, 'Introduction to Astronomy', 3);
INSERT INTO course_master_list(Course_code, `number`, Description, Credits) VALUES ('PHYS', 385, 'Astrophysics', 3);

INSERT INTO Sections(course_Master_List_id, section) VALUES (1,'ZR');
INSERT INTO Sections(course_Master_List_id, section) VALUES (1,'KN');
INSERT INTO Sections(course_Master_List_id, section) VALUES (1,'TV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (2,'RK');
INSERT INTO Sections(course_Master_List_id, section) VALUES (2,'UW');
INSERT INTO Sections(course_Master_List_id, section) VALUES (2,'CO');
INSERT INTO Sections(course_Master_List_id, section) VALUES (3,'TY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (3,'ZF');
INSERT INTO Sections(course_Master_List_id, section) VALUES (3,'ZC');
INSERT INTO Sections(course_Master_List_id, section) VALUES (4,'TM');
INSERT INTO Sections(course_Master_List_id, section) VALUES (4,'OF');
INSERT INTO Sections(course_Master_List_id, section) VALUES (4,'CS');
INSERT INTO Sections(course_Master_List_id, section) VALUES (5,'HO');
INSERT INTO Sections(course_Master_List_id, section) VALUES (5,'ZP');
INSERT INTO Sections(course_Master_List_id, section) VALUES (5,'UC');
INSERT INTO Sections(course_Master_List_id, section) VALUES (6,'ER');
INSERT INTO Sections(course_Master_List_id, section) VALUES (6,'ZH');
INSERT INTO Sections(course_Master_List_id, section) VALUES (6,'SE');
INSERT INTO Sections(course_Master_List_id, section) VALUES (7,'RK');
INSERT INTO Sections(course_Master_List_id, section) VALUES (7,'PW');
INSERT INTO Sections(course_Master_List_id, section) VALUES (7,'VU');
INSERT INTO Sections(course_Master_List_id, section) VALUES (8,'DR');
INSERT INTO Sections(course_Master_List_id, section) VALUES (8,'DU');
INSERT INTO Sections(course_Master_List_id, section) VALUES (8,'GU');
INSERT INTO Sections(course_Master_List_id, section) VALUES (9,'FG');
INSERT INTO Sections(course_Master_List_id, section) VALUES (9,'DY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (9,'YG');
INSERT INTO Sections(course_Master_List_id, section) VALUES (10,'ZV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (10,'OY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (10,'CG');
INSERT INTO Sections(course_Master_List_id, section) VALUES (11,'FT');
INSERT INTO Sections(course_Master_List_id, section) VALUES (11,'MD');
INSERT INTO Sections(course_Master_List_id, section) VALUES (11,'GL');
INSERT INTO Sections(course_Master_List_id, section) VALUES (12,'VY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (12,'XR');
INSERT INTO Sections(course_Master_List_id, section) VALUES (12,'VI');
INSERT INTO Sections(course_Master_List_id, section) VALUES (13,'GP');
INSERT INTO Sections(course_Master_List_id, section) VALUES (13,'KU');
INSERT INTO Sections(course_Master_List_id, section) VALUES (13,'EZ');
INSERT INTO Sections(course_Master_List_id, section) VALUES (14,'HS');
INSERT INTO Sections(course_Master_List_id, section) VALUES (14,'OR');
INSERT INTO Sections(course_Master_List_id, section) VALUES (14,'PC');
INSERT INTO Sections(course_Master_List_id, section) VALUES (15,'TW');
INSERT INTO Sections(course_Master_List_id, section) VALUES (15,'AB');
INSERT INTO Sections(course_Master_List_id, section) VALUES (15,'TP');
INSERT INTO Sections(course_Master_List_id, section) VALUES (16,'JJ');
INSERT INTO Sections(course_Master_List_id, section) VALUES (16,'VQ');
INSERT INTO Sections(course_Master_List_id, section) VALUES (16,'YA');
INSERT INTO Sections(course_Master_List_id, section) VALUES (17,'KB');
INSERT INTO Sections(course_Master_List_id, section) VALUES (17,'WU');
INSERT INTO Sections(course_Master_List_id, section) VALUES (17,'QB');
INSERT INTO Sections(course_Master_List_id, section) VALUES (18,'VR');
INSERT INTO Sections(course_Master_List_id, section) VALUES (18,'OO');
INSERT INTO Sections(course_Master_List_id, section) VALUES (18,'VJ');
INSERT INTO Sections(course_Master_List_id, section) VALUES (19,'HJ');
INSERT INTO Sections(course_Master_List_id, section) VALUES (19,'AI');
INSERT INTO Sections(course_Master_List_id, section) VALUES (19,'WM');
INSERT INTO Sections(course_Master_List_id, section) VALUES (20,'WC');
INSERT INTO Sections(course_Master_List_id, section) VALUES (20,'OO');
INSERT INTO Sections(course_Master_List_id, section) VALUES (20,'DL');
INSERT INTO Sections(course_Master_List_id, section) VALUES (21,'IY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (21,'NM');
INSERT INTO Sections(course_Master_List_id, section) VALUES (21,'ZS');
INSERT INTO Sections(course_Master_List_id, section) VALUES (22,'FT');
INSERT INTO Sections(course_Master_List_id, section) VALUES (22,'DF');
INSERT INTO Sections(course_Master_List_id, section) VALUES (22,'FN');
INSERT INTO Sections(course_Master_List_id, section) VALUES (23,'DP');
INSERT INTO Sections(course_Master_List_id, section) VALUES (23,'OW');
INSERT INTO Sections(course_Master_List_id, section) VALUES (23,'LP');
INSERT INTO Sections(course_Master_List_id, section) VALUES (24,'SK');
INSERT INTO Sections(course_Master_List_id, section) VALUES (24,'XV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (24,'OK');
INSERT INTO Sections(course_Master_List_id, section) VALUES (25,'IY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (25,'NR');
INSERT INTO Sections(course_Master_List_id, section) VALUES (25,'PA');
INSERT INTO Sections(course_Master_List_id, section) VALUES (26,'FS');
INSERT INTO Sections(course_Master_List_id, section) VALUES (26,'LD');
INSERT INTO Sections(course_Master_List_id, section) VALUES (26,'ZL');
INSERT INTO Sections(course_Master_List_id, section) VALUES (27,'UY');
INSERT INTO Sections(course_Master_List_id, section) VALUES (27,'EP');
INSERT INTO Sections(course_Master_List_id, section) VALUES (27,'BX');
INSERT INTO Sections(course_Master_List_id, section) VALUES (28,'AE');
INSERT INTO Sections(course_Master_List_id, section) VALUES (28,'FV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (28,'IB');
INSERT INTO Sections(course_Master_List_id, section) VALUES (29,'XN');
INSERT INTO Sections(course_Master_List_id, section) VALUES (29,'SV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (29,'LS');
INSERT INTO Sections(course_Master_List_id, section) VALUES (30,'KV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (30,'ZQ');
INSERT INTO Sections(course_Master_List_id, section) VALUES (30,'HL');
INSERT INTO Sections(course_Master_List_id, section) VALUES (31,'ZC');
INSERT INTO Sections(course_Master_List_id, section) VALUES (31,'HV');
INSERT INTO Sections(course_Master_List_id, section) VALUES (31,'SJ');

INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('LO','40','18:00','20:30','W,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('LO','40','10:00','12:00','Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('HO','40','13:00','15:30','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('HO','40','15:45','17:45','Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('KJ','40','17:00','19:30','M,Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('KJ','40','13:00','15:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('HJ','41','18:00','20:30','W,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('HJ','41','8:00','10:00','M');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('FG','41','13:00','15:30','Tu,W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('FG','41','14:00','16:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('RT','41','17:00','19:30','M,Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('RT','41','19:45','21:45','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('EU','42','16:00','18:30','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('EU','42','14:00','16:00','Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ER','42','11:00','13:30','Tu,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ER','42','8:30','10:30','Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('QT','42','8:00','10:30','M,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('QT','42','12:00','14:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('OL','43','15:00','16:15','M,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('OL','43','9:00','13:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('GF','43','11:00','12:15','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('GF','43','12:00','16:00','M');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('LK','43','9:00','10:15','M,W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('LK','43','6:00','10:00','Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('EW','44','15:30','17:30','Tu,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('EW','44','00:00','00:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ES','44','12:30','14:30','Th,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ES','44','00:00','00:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('YH','44','13:00','15:00','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('YH','44','00:00','00:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('VF','45','11:45','13:45','M,Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('VF','45','9:00','12:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('CV','45','14:30','16:30','W,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('CV','45','16:30','19:30','M');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('BN','45','18:00','20:00','Tu,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('BN','45','9:00','12:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('XC','46','12:45','14:45','W,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('XC','46','9:00','10:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('XZ','46','17:00','19:00','Th,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('XZ','46','15:30','16:30','Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('XB','46','9:00','11:00','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('XB','46','15:00','16:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('JM','47','14:45','16:00','M,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('JM','47','10:00','11:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('MK','47','11:00','12:15','Th,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('MK','47','8:00','9:00','M');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('UZ','47','16:30','18:45','M,W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('UZ','47','15:00','16:00','Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('DT','48','15:40','16:55','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('DT','48','10:00','11:00','Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('SW','48','13:45','15:00','Tu,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('SW','48','10:00','11:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('EP','48','10:00','11:15','M,Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('EP','48','12:00','13:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('UK','49','18:00','19:15','Th,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('UK','49','16:45','17:45','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ZA','49','13:00','14:15','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ZA','49','9:00','10:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ZW','49','17:00','18:15','M,Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('ZW','49','15:00','16:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('SG','50','18:00','19:00','Tu,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('SG','50','9:00','11:00','M');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('SF','50','13:00','14:00','M,W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('SF','50','17:00','19:00','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('WC','50','17:00','18:00','M,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('WC','50','15:00','17:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('TB','51','18:00','19:15','Th,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('TB','51','11:00','12:00','M');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('TM','51','13:00','14:15','M,W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('TM','51','11:00','12:00','W');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('VG','51','17:00','18:15','M,Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('VG','51','15:00','16:00','Tu');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('QP','52','18:00','19:15','W,F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('QP','52','19:30','20:30','F');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('YK','52','11:45','13:00','W,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('YK','52','9:00','10:00','Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('VT','52','17:00','18:15','M,Th');
INSERT INTO Timeslot(Sections_Section, Sections_course_Master_List_id, start, end, DOW) VALUES ('VT','52','14:00','15:00','Tu');

Insert into prereq (PrereqCourseID, MainCourseID) values (2,5);
Insert into prereq (PrereqCourseID, MainCourseID) values (1,18);
Insert into prereq (PrereqCourseID, MainCourseID) values (7,13);
Insert into prereq (PrereqCourseID, MainCourseID) values (10,13);
Insert into prereq (PrereqCourseID, MainCourseID) values (5,9);
Insert into prereq (PrereqCourseID, MainCourseID) values (1,10);
Insert into prereq (PrereqCourseID, MainCourseID) values (4,15);
Insert into prereq (PrereqCourseID, MainCourseID) values (6,15);
Insert into prereq (PrereqCourseID, MainCourseID) values (2,22);
Insert into prereq (PrereqCourseID, MainCourseID) values (4,22);
Insert into prereq (PrereqCourseID, MainCourseID) values (6,22);
Insert into prereq (PrereqCourseID, MainCourseID) values (11,31);
Insert into prereq (PrereqCourseID, MainCourseID) values (2,8);
Insert into prereq (PrereqCourseID, MainCourseID) values (13,29);
Insert into prereq (PrereqCourseID, MainCourseID) values (1,16);
Insert into prereq (PrereqCourseID, MainCourseID) values (5,16);
Insert into prereq (PrereqCourseID, MainCourseID) values (11,17);
Insert into prereq (PrereqCourseID, MainCourseID) values (10,17);
Insert into prereq (PrereqCourseID, MainCourseID) values (17,19);
Insert into prereq (PrereqCourseID, MainCourseID) values (17,20);
Insert into prereq (PrereqCourseID, MainCourseID) values (19,20);
Insert into prereq (PrereqCourseID, MainCourseID) values (20,23);
Insert into prereq (PrereqCourseID, MainCourseID) values (19,25);
Insert into prereq (PrereqCourseID, MainCourseID) values (11,21);
Insert into prereq (PrereqCourseID, MainCourseID) values (17,21);
Insert into prereq (PrereqCourseID, MainCourseID) values (4,30);
Insert into prereq (PrereqCourseID, MainCourseID) values (6,30);
Insert into prereq (PrereqCourseID, MainCourseID) values (23,26);
Insert into prereq (PrereqCourseID, MainCourseID) values (25,26);
Insert into prereq (PrereqCourseID, MainCourseID) values (26,27);
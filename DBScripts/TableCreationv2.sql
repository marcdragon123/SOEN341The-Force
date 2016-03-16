-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
SET SQL_SAFE_UPDATES = 0;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soen341` DEFAULT CHARACTER SET utf8 ;
USE `soen341` ;

SET FOREIGN_KEY_CHECKS = 0;
SET GROUP_CONCAT_MAX_LEN=32768;
SET @tables = NULL;
SELECT GROUP_CONCAT('`', table_name, '`') INTO @tables
  FROM information_schema.tables
  WHERE table_schema = 'soen341';
SELECT IFNULL(@tables,'dummy') INTO @tables;

SET @tables = CONCAT('DROP TABLE IF EXISTS ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET FOREIGN_KEY_CHECKS = 1;

-- -----------------------------------------------------
-- Table `soen341`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PermenantCode` VARCHAR(45),
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(70) UNIQUE NOT NULL,
  PRIMARY KEY (`idStudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Addresses` (
  `idAddresses` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `line 2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `mailing` TINYINT(1) NULL,
  `home` TINYINT(1) NULL,
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idAddresses`, `Student_idStudent`),
  INDEX `fk_Addresses_Student_idx` (`Student_idStudent` ASC),
  CONSTRAINT `fk_Addresses_Student`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `soen341`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`course_Master_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`course_Master_List` (
  `id` INT(11)  not NULL auto_increment,
  `Course_code` VARCHAR(45) NOT NULL,
  `number` INT(11) NOT NULL,
  `description` VARCHAR(200) NULL,
  `Credits` INT(11) NULL,
  `Suggested_Semester` INT(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`Sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Sections` (
  `Section` VARCHAR(45) NOT NULL,
  `Semester` VARCHAR(45) NULL,
  `course_Master_List_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Section`, `course_Master_List_id`),
  INDEX `fk_Sections_course_Master_List1_idx` (`course_Master_List_id` ASC)/*,
  CONSTRAINT `fk_Sections_course_Master_List1`
    FOREIGN KEY (`course_Master_List_id`)
    REFERENCES `soen341`.`course_Master_List` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION*/)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Enrollment` (
  `Student_idStudent` INT NOT NULL,
  `Sections_Section` VARCHAR(45) NOT NULL,
  `Sections_course_Master_List_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Student_idStudent`, `Sections_Section`, `Sections_course_Master_List_id`),
  INDEX `fk_Enrollment_Student1_idx` (`Student_idStudent` ASC),
  INDEX `fk_Enrollment_Sections1_idx` (`Sections_Section` ASC, `Sections_course_Master_List_id` ASC),
  CONSTRAINT `fk_Enrollment_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `mydb`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Sections1`
    FOREIGN KEY (`Sections_Section` , `Sections_course_Master_List_id`)
    REFERENCES `soen341`.`Sections` (`Section` , `course_Master_List_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`transcripts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`transcripts` (
  `Grade` VARCHAR(45) NULL,
  `Completed` TINYINT(1) NULL,
  `Semester` VARCHAR(45) NULL,
  `Enrollment_Student_idStudent` INT NOT NULL,
  `Enrollment_Sections_Section` VARCHAR(45) NOT NULL,
  `Enrollment_Sections_course_Master_List_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Enrollment_Student_idStudent`, `Enrollment_Sections_Section`, `Enrollment_Sections_course_Master_List_id`),
  CONSTRAINT `fk_transcripts_Enrollment1`
    FOREIGN KEY (`Enrollment_Student_idStudent` , `Enrollment_Sections_Section` , `Enrollment_Sections_course_Master_List_id`)
    REFERENCES `soen341`.`Enrollment` (`Student_idStudent` , `Sections_Section` , `Sections_course_Master_List_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`transcripts_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`transcripts_has_courses` (
  `transcripts_Student_idStudent` INT NOT NULL,
  `courses_department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transcripts_Student_idStudent`, `courses_department`),
  INDEX `fk_transcripts_has_courses_courses1_idx` (`courses_department` ASC)/*,
  CONSTRAINT `fk_transcripts_has_courses_courses1`
    FOREIGN KEY (`courses_department`)
    REFERENCES `soen341`.`course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION*/)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`Prereq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Prereq` (
  `MainCourseID` VARCHAR(45) NOT NULL,
  `PrereqCourseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MainCourseID`, `PrereqCourseID`),
  INDEX `fk_Prereq_course_Master_List2_idx` (`PrereqCourseID` ASC)/*,
  CONSTRAINT `fk_Prereq_course_Master_List1`
    FOREIGN KEY (`MainCourseID`)
    REFERENCES `soen341`.`course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prereq_course_Master_List2`
    FOREIGN KEY (`PrereqCourseID`)
    REFERENCES `soen341`.`course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION*/)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `soen341`.`Timeslot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Sections_Section` VARCHAR(45) NOT NULL,
  `Sections_course_Master_List_id` VARCHAR(45) NOT NULL,
  `start` TIME NOT NULL,
  `end` TIME NOT NULL,
  `DOW` CHAR NOT NULL,
  PRIMARY KEY (`id`, `Sections_Section`, `Sections_course_Master_List_id`),
  INDEX `fk_Timeslot_Sections1_idx` (`Sections_Section` ASC, `Sections_course_Master_List_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

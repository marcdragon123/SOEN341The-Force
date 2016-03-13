-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema soen341
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema soen341
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soen341` DEFAULT CHARACTER SET utf8 ;
USE `soen341` ;

-- -----------------------------------------------------
-- Table `soen341`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PermenantCode` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `PermenantCode_UNIQUE` (`PermenantCode` ASC))
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
  `home` VARCHAR(45) NULL,
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idAddresses`, `Student_idStudent`),
  INDEX `fk_Addresses_Student_idx` (`Student_idStudent` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`course_Master_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`course_Master_List` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Course_code` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NULL,
  `Credits` INT(11) NULL,
  `Suggested_Semester` INT(11) NULL,
  `number` INT NOT NULL,
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
  INDEX `fk_Sections_course_Master_List1_idx` (`course_Master_List_id` ASC))
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
  INDEX `fk_Enrollment_Sections1_idx` (`Sections_Section` ASC, `Sections_course_Master_List_id` ASC))
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
  PRIMARY KEY (`Enrollment_Student_idStudent`, `Enrollment_Sections_Section`, `Enrollment_Sections_course_Master_List_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`transcripts_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`transcripts_has_courses` (
  `transcripts_Student_idStudent` INT NOT NULL,
  `courses_department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transcripts_Student_idStudent`, `courses_department`),
  INDEX `fk_transcripts_has_courses_courses1_idx` (`courses_department` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`Prereq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soen341`.`Prereq` (
  `MainCourseID` VARCHAR(45) NOT NULL,
  `PrereqCourseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MainCourseID`, `PrereqCourseID`),
  INDEX `fk_Prereq_course_Master_List2_idx` (`PrereqCourseID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soen341`.`Timeslot`
-- -----------------------------------------------------
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

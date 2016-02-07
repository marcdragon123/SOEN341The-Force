-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soen341` DEFAULT CHARACTER SET utf8 ;
USE `soen341` ;

-- -----------------------------------------------------
-- Table `Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Student` (
  `idStudent` INT NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `PermenantCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `PermenantCode_UNIQUE` (`PermenantCode` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Addresses` (
  `idAddresses` INT NOT NULL,
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
  INDEX `fk_Addresses_Student_idx` (`Student_idStudent` ASC),
  CONSTRAINT `fk_Addresses_Student`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course_Master_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course_Master_List` (
  `Course_code` VARCHAR(45) NOT NULL,
  `number` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `Credits` INT(11) NULL,
  `Suggested_Semester` INT(11) NULL,
  PRIMARY KEY (`Course_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transcripts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transcripts` (
  `Student_idStudent` INT NOT NULL,
  `Course_code` VARCHAR(45) NOT NULL,
  `Credits` DECIMAL(2,2) NULL,
  `Grade` VARCHAR(45) NULL,
  `Completed` TINYINT(1) NULL,
  `Semester` VARCHAR(45) NULL,
  `transcriptscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Student_idStudent`, `Course_code`, `transcriptscol`),
  INDEX `fk_transcripts_course_Master_List1_idx` (`Course_code` ASC),
  CONSTRAINT `fk_transcripts_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transcripts_course_Master_List1`
    FOREIGN KEY (`Course_code`)
    REFERENCES `course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `transcripts_has_courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transcripts_has_courses` (
  `transcripts_Student_idStudent` INT NOT NULL,
  `courses_department` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transcripts_Student_idStudent`, `courses_department`),
  INDEX `fk_transcripts_has_courses_courses1_idx` (`courses_department` ASC),
  INDEX `fk_transcripts_has_courses_transcripts1_idx` (`transcripts_Student_idStudent` ASC),
  CONSTRAINT `fk_transcripts_has_courses_transcripts1`
    FOREIGN KEY (`transcripts_Student_idStudent`)
    REFERENCES `transcripts` (`Student_idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transcripts_has_courses_courses1`
    FOREIGN KEY (`courses_department`)
    REFERENCES `course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Prereq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Prereq` (
  `MainCourseID` VARCHAR(45) NOT NULL,
  `PrereqCourseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MainCourseID`, `PrereqCourseID`),
  INDEX `fk_Prereq_course_Master_List2_idx` (`PrereqCourseID` ASC),
  CONSTRAINT `fk_Prereq_course_Master_List1`
    FOREIGN KEY (`MainCourseID`)
    REFERENCES `course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prereq_course_Master_List2`
    FOREIGN KEY (`PrereqCourseID`)
    REFERENCES `course_Master_List` (`Course_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

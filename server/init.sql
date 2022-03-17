-- MySQL Script generated by MySQL Workbench
-- Thu Mar 17 15:35:47 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `userID` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `nickname` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Novel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Novel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Novel` (
  `novelTitle` VARCHAR(45) NULL,
  `novelIntro` VARCHAR(45) NULL,
  `novelGenre` VARCHAR(45) NULL,
  `novelID` INT NOT NULL,
  `User_userID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`novelID`, `User_userID`),
  UNIQUE INDEX `novelID_UNIQUE` (`novelID` ASC) VISIBLE,
  INDEX `fk_Novel_User1_idx` (`User_userID` ASC) VISIBLE,
  CONSTRAINT `fk_Novel_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `mydb`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Chapter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Chapter` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Chapter` (
  `chapterID` INT NOT NULL,
  `chapterName` VARCHAR(45) NULL,
  `chapterFileName` VARCHAR(45) NULL,
  `Chaptercol` VARCHAR(45) NULL,
  `Novel_novelID` INT NOT NULL,
  PRIMARY KEY (`chapterID`, `Novel_novelID`),
  INDEX `fk_Chapter_Novel1_idx` (`Novel_novelID` ASC) VISIBLE,
  UNIQUE INDEX `chapterID_UNIQUE` (`chapterID` ASC) VISIBLE,
  CONSTRAINT `fk_Chapter_Novel1`
    FOREIGN KEY (`Novel_novelID`)
    REFERENCES `mydb`.`Novel` (`novelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Owned_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Owned_contents` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Owned_contents` (
  `novelID` INT NOT NULL,
  `chapterID` INT NULL,
  `User_userID` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `novelID_UNIQUE` (`novelID` ASC) VISIBLE,
  PRIMARY KEY (`User_userID`),
  CONSTRAINT `fk_Library_User1`
    FOREIGN KEY (`User_userID`)
    REFERENCES `mydb`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

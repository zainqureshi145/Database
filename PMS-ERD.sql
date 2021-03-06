-- MySQL Script generated by MySQL Workbench
-- 04/16/15 23:06:22
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PMS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PMS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PMS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `PMS` ;

-- -----------------------------------------------------
-- Table `PMS`.`Parking_Space`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PMS`.`Parking_Space` (
  `idParking_Space` INT NOT NULL,
  `Floor` INT NULL,
  `Parking_Slot` INT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idParking_Space`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PMS`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PMS`.`User` (
  `idUser` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Phone` VARCHAR(11) NULL,
  `Premium_user` VARCHAR(45) NULL,
  `Parking_Space_idParking_Space` INT NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Parking_Space1_idx` (`Parking_Space_idParking_Space` ASC),
  CONSTRAINT `fk_User_Parking_Space1`
    FOREIGN KEY (`Parking_Space_idParking_Space`)
    REFERENCES `PMS`.`Parking_Space` (`idParking_Space`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PMS`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PMS`.`Car` (
  `idCar` INT NOT NULL,
  `Registration_No` VARCHAR(10) NULL,
  `Car_Type` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idCar`),
  INDEX `fk_Car_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Car_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `PMS`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PMS`.`Parking_Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PMS`.`Parking_Transactions` (
  `idTransaction_Histroy` INT NOT NULL,
  `Date_Time` DATETIME NULL,
  `User_idUser` INT NOT NULL,
  `Parking_Space_idParking_Space` INT NOT NULL,
  `Arrival_Time` DATETIME NULL,
  `Departure_Time` DATETIME NULL,
  `Payment_Status` VARCHAR(45) NULL,
  `Car_idCar` INT NOT NULL,
  PRIMARY KEY (`idTransaction_Histroy`),
  INDEX `fk_User_Transaction_Histroy_User1_idx` (`User_idUser` ASC),
  INDEX `fk_User_Transaction_Histroy_Parking_Space1_idx` (`Parking_Space_idParking_Space` ASC),
  INDEX `fk_User_Transaction_Histroy_Car1_idx` (`Car_idCar` ASC),
  CONSTRAINT `fk_User_Transaction_Histroy_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `PMS`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Transaction_Histroy_Parking_Space1`
    FOREIGN KEY (`Parking_Space_idParking_Space`)
    REFERENCES `PMS`.`Parking_Space` (`idParking_Space`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Transaction_Histroy_Car1`
    FOREIGN KEY (`Car_idCar`)
    REFERENCES `PMS`.`Car` (`idCar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

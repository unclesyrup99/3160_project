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
-- Table `mydb`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurant` (
  `restaurantID` INT NOT NULL,
  `location` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `website_link` VARCHAR(255) NULL,
  `phone_number` INT NULL,
  `schedule` VARCHAR(155) NULL,
  `menu` VARCHAR(500) NULL,
  PRIMARY KEY (`restaurantID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Locations` (
  `locationID` INT NOT NULL,
  `location_name` VARCHAR(255) NULL,
  `location_adress` VARCHAR(255) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `drop_off_description` VARCHAR(45) NULL,
  PRIMARY KEY (`locationID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Driver` (
  `driverID` INT NOT NULL,
  `license_Number` INT NULL,
  `date_Hired` DATE NULL,
  `ratings` INT NULL,
  `license_Plate` VARCHAR(45) NULL,
  `car_Make` VARCHAR(155) NULL,
  `car_Model` VARCHAR(155) NULL,
  `personID` INT NOT NULL,
  `orderID` INT NOT NULL,
  PRIMARY KEY (`driverID`),
  key `fk_Driver_Persons1_idx` (`PersonID` ASC) VISIBLE,
  key `fk_Driver_OrderID_idx` (`orderID`) VISIBLE,
  CONSTRAINT `fk_Driver_Persons1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `mydb`.`Persons` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Driver_Order1`
    FOREIGN KEY (`orderID`)
    REFERENCES `mydb`.`Order` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `orderID` INT NOT NULL,
  `total_price` DOUBLE NULL,
  `delivery_charge` DOUBLE NULL,
  `restaurantID` INT NOT NULL,
  `driverID` INT NOT NULL,
  `locationID` INT NOT NULL,
  `personID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  key `fk_Order_Restaurant1_idx` (`restaurantID` ASC) VISIBLE,
  key `fk_Order_Locations1_idx` (`locationID` ASC) VISIBLE,
  key `fk_Order_Person1_idx` (`personID` ASC),
  CONSTRAINT `fk_Order_Restaurant1`
    FOREIGN KEY (`restaurantID`)
    REFERENCES `mydb`.`Restaurant` (`restaurantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Locations1`
    FOREIGN KEY (`locationID`)
    REFERENCES `mydb`.`Locations` (`locationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Person1`
    FOREIGN KEY (`personID`)
    REFERENCES `mydb`.`Person` (`personID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persons` (
  `PersonID` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `phone_number` INT NULL,
  PRIMARY KEY (`PersonID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculty` (
  `title` VARCHAR(255) NULL,
  `highest_degree` VARCHAR(155) NULL,
  `degree_college` VARCHAR(155) NULL,
  `PersonID` INT NOT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `fk_Faculty_Persons1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `mydb`.`Persons` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `longitude` DOUBLE NULL,
  `latitude` DOUBLE NULL,
  `admin` TINYINT NULL,
  `PersonID` INT NOT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `fk_Staff_Persons1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `mydb`.`Persons` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `grad_year` INT NULL,
  `major` VARCHAR(155) NULL,
  `PersonID` INT NOT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `fk_Student_Persons1`
    FOREIGN KEY (`PersonID`)
    REFERENCES `mydb`.`Persons` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

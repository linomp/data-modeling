-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mangata_gallo_exercise
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mangata_gallo_exercise
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mangata_gallo_exercise` DEFAULT CHARACTER SET utf8 ;
USE `mangata_gallo_exercise` ;

-- -----------------------------------------------------
-- Table `mangata_gallo_exercise`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_exercise`.`Clients` (
  `ClientID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `ContactNumber` INT NOT NULL,
  PRIMARY KEY (`ClientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_exercise`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_exercise`.`Products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(255) NOT NULL,
  `BuyPrice` DECIMAL(10,2) NOT NULL,
  `SellPrice` DECIMAL(10,2) NOT NULL,
  `AmmountInStock` INT NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_exercise`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_exercise`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `Quantity` INT NOT NULL,
  `TotalPrice` DECIMAL(10,2) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `ClientID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `client_id_fk_idx` (`ClientID` ASC) VISIBLE,
  INDEX `product_id_fk_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `client_id_fk`
    FOREIGN KEY (`ClientID`)
    REFERENCES `mangata_gallo_exercise`.`Clients` (`ClientID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `mangata_gallo_exercise`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_exercise`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_exercise`.`Address` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(255) NOT NULL,
  `ZipCode` VARCHAR(255) NOT NULL,
  `State` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mangata_gallo_exercise`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mangata_gallo_exercise`.`Delivery` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryStatus` VARCHAR(255) NOT NULL,
  `OrderID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `Comment` VARCHAR(255) NULL,
  `DeliveryDate` DATE NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  INDEX `address_id_fk_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mangata_gallo_exercise`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `address_id_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `mangata_gallo_exercise`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

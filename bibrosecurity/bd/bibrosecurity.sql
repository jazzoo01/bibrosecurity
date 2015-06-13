-- MySQL Script generated by MySQL Workbench
-- lun 08 jun 2015 18:09:10 CDT
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bibroSecurity
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bibroSecurity` ;
CREATE SCHEMA IF NOT EXISTS `bibroSecurity` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `bibroSecurity` ;

-- -----------------------------------------------------
-- Table `partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `partner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `lastName` VARCHAR(60) NOT NULL,
  `street` VARCHAR(45) NULL,
  `noExt` VARCHAR(45) NULL,
  `noInt` VARCHAR(45) NULL,
  `colony` VARCHAR(45) NULL,
  `zip` VARCHAR(10) NULL,
  `locality` VARCHAR(60) NULL,
  `phone` VARCHAR(45) NULL,
  `mobile` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `customer` TINYINT(1) NULL DEFAULT 1,
  `supplier` TINYINT(1) NULL DEFAULT 0,
  `image` VARCHAR(1000) NULL,
  `city_id` INT NULL,
  `state_id` INT NULL,
  `country_id` INT NULL,
  `active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `partner_id` INT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `uom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `uom` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `uom` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `parent_id` INT NULL,
  `full_name` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `purchasePrice` DOUBLE NOT NULL DEFAULT 0.0,
  `salePrice` DOUBLE NOT NULL DEFAULT 0.0,
  `qtyAvailable` DOUBLE NOT NULL DEFAULT 0.0,
  `incomingQty` DOUBLE NOT NULL DEFAULT 0.0,
  `virtualAvailable` DOUBLE NOT NULL DEFAULT 0.0,
  `ean13` VARCHAR(45) NULL,
  `uom_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `saleOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saleOrder` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `saleOrder` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datetime_create` DATETIME NULL,
  `subTotal` DOUBLE NOT NULL DEFAULT 0.0,
  `discount` DOUBLE NOT NULL DEFAULT 0.0,
  `total` DOUBLE NOT NULL DEFAULT 0.0 COMMENT '	',
  `type` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL DEFAULT 'confirmed',
  `partner_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `purchaseOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchaseOrder` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `purchaseOrder` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datetime_create` DATETIME NULL,
  `subtotal` DOUBLE NOT NULL,
  `total` DOUBLE NOT NULL,
  `status` VARCHAR(45) NULL DEFAULT 'draft',
  `partner_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `saleOrderLine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saleOrderLine` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `saleOrderLine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `saleOrder_id` INT NOT NULL,
  `qty` DOUBLE NULL,
  `unit_price` DOUBLE NULL,
  `subtotal` DOUBLE NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `purchaseOrderLine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchaseOrderLine` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `purchaseOrderLine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `qty` DOUBLE NULL,
  `unit_price` DOUBLE NULL,
  `subtotal` DOUBLE NULL,
  `product_id` INT NOT NULL,
  `purchaseOrder_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alias` VARCHAR(100) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `partner_id` INT NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `camera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camera` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `camera` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alias` VARCHAR(100) NOT NULL,
  `ipv4` VARCHAR(45) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `multimedia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `multimedia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `multimedia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ruta` VARCHAR(1000) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partnerPassword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partnerPassword` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `partnerPassword` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `partner_id` INT NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `productImage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `productImage` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `productImage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `image` VARCHAR(1000) NOT NULL,
  `description` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `serviceCamera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `serviceCamera` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `serviceCamera` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `service_id` INT NOT NULL,
  `camera_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

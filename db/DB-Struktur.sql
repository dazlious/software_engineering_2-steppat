-- MySQL Script generated by MySQL Workbench
-- Wed Dec 10 14:00:50 2014
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema se
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema se
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `se` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `se` ;

-- -----------------------------------------------------
-- Table `se`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `se`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `password` CHAR(60) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `hash` CHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `se`.`Contest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `se`.`Contest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(500) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `starts_at` TIMESTAMP NULL,
  `ends_at` TIMESTAMP NULL,
  `image_url` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `se`.`Idea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `se`.`Idea` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contest_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(450) NOT NULL,
  `image_url` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`contest_id` ASC),
  INDEX `id_idx1` (`user_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `se`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `se`.`Comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(450) NOT NULL,
  `user_id` INT NOT NULL,
  `idea_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `id_idx` (`user_id` ASC),
  INDEX `id_idx1` (`idea_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `se`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `se`.`Rating` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `idea_id` INT NOT NULL,
  `rating` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`user_id` ASC),
  INDEX `id_idx1` (`idea_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

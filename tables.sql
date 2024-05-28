-- MySQL Script generated by MySQL Workbench
-- Sun May 12 18:07:13 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema kenefbet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kenefbet
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema databet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema databet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `databet` DEFAULT CHARACTER SET utf8 ;
USE `databet` ;

-- -----------------------------------------------------
-- Table `databet`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`users` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  `balance` DOUBLE NOT NULL,
  `egn` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`bank_accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`bank_accounts` (
  `bank_account_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `account_number` VARCHAR(34) NOT NULL,
  `bank_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`bank_account_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  CONSTRAINT `fk_bank_accounts_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `databet`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`banlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`banlist` (
  `banlist_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `reason` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`banlist_id`),
  INDEX `fk_banlist_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_banlist_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `databet`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`game_winners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`game_winners` (
  `game_winners_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT(10) UNSIGNED NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`game_winners_id`),
  INDEX `idgames` (`game_id` ASC),
  INDEX `idusers` (`user_id` ASC),
  CONSTRAINT `game_winners_ibfk_1`
    FOREIGN KEY (`game_id`)
    REFERENCES `kenefbet`.`games` (`idgames`),
  CONSTRAINT `game_winners_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `databet`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`games` (
  `game_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `kind` VARCHAR(45) NOT NULL,
  `chance` DOUBLE NOT NULL,
  `jackpot_chance` DOUBLE NOT NULL,
  `bonus` DOUBLE NOT NULL,
  `jackpot` DOUBLE NOT NULL,
  `date_added` DATE NOT NULL,
  PRIMARY KEY (`game_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`most_played`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`most_played` (
  `most_played_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT(10) UNSIGNED NOT NULL,
  `traffic` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`most_played_id`, `game_id`),
  INDEX `fk_most_played_games1_idx` (`game_id` ASC),
  CONSTRAINT `fk_most_played_games1`
    FOREIGN KEY (`game_id`)
    REFERENCES `databet`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`transaction` (
  `transaction_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `size` DOUBLE NOT NULL,
  `date` DATE NOT NULL,
  `user_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transaction_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_transaction_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `databet`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `databet`.`user_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `databet`.`user_games` (
  `user_id` INT(10) UNSIGNED NOT NULL,
  `game_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `game_id`),
  INDEX `fk_user_games_games` (`game_id` ASC),
  CONSTRAINT `fk_user_games_games`
    FOREIGN KEY (`game_id`)
    REFERENCES `databet`.`games` (`game_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_games_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `databet`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

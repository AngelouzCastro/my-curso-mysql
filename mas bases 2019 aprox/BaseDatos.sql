create database BASEDEDATOS;
USE BASEDEDATOS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Base de datos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `acopiadora` ;
CREATE SCHEMA IF NOT EXISTS `acopiadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `acopiadora` ;

-- -----------------------------------------------------
-- Usuario
-- -----------------------------------------------------
Create user 'acopio_user'@'localhost' identified by 'secreto';
grant all on acopiadora.* to 'acopio_user'@'localhost';
Create user 'acopio_user'@'%' identified by 'secreto';
grant all on acopiadora.* to 'acopio_user'@'%';
-- -----------------------------------------------------
-- Table `acopiadora`.`productor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acopiadora`.`productor` ;

CREATE TABLE IF NOT EXISTS `acopiadora`.`productor` (
  `idproductor` INT NOT NULL AUTO_INCREMENT,
  `nombre_productor` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idproductor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acopiadora`.`semilla`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acopiadora`.`semilla` ;

CREATE TABLE IF NOT EXISTS `acopiadora`.`semilla` (
  `idsemilla` INT NOT NULL AUTO_INCREMENT,
  `nombre_semilla` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `precio_kg` FLOAT NOT NULL,
  PRIMARY KEY (`idsemilla`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acopiadora`.`acopio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `acopiadora`.`acopio` ;

CREATE TABLE IF NOT EXISTS `acopiadora`.`acopio` (
  `idacopio` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `folio` INT NOT NULL,
  `cantidad_kg` INT UNSIGNED NOT NULL,
  `idproductor` INT NOT NULL,
  `idsemilla` INT NOT NULL,
  PRIMARY KEY (`idacopio`),
  INDEX `fk_acopio_productor_idx` (`idproductor` ASC),
  INDEX `fk_acopio_producto1_idx` (`idsemilla` ASC),
  CONSTRAINT `fk_acopio_productor`
    FOREIGN KEY (`idproductor`)
    REFERENCES `acopiadora`.`productor` (`idproductor`)
    ON DELETE cascade
    ON UPDATE cascade,
  CONSTRAINT `fk_acopio_producto1`
    FOREIGN KEY (`idsemilla`)
    REFERENCES `acopiadora`.`semilla` (`idsemilla`)
    ON DELETE cascade
    ON UPDATE cascade)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `acopiadora`.`productor` (`nombre_productor`, `direccion`, `telefono`) VALUES ('Reynaldo Gonzalez Torres', 'Loreto', '498 98-6899');
INSERT INTO `acopiadora`.`productor` (`nombre_productor`, `direccion`, `telefono`) VALUES ('Luis Lopez Rios', 'Juan Aldama', '492 92-1598');
INSERT INTO `acopiadora`.`productor` (`nombre_productor`, `direccion`, `telefono`) VALUES ('Mayra Salcedo Salas', 'Miguel Auza', '493 93-9547');
INSERT INTO `acopiadora`.`productor` (`nombre_productor`, `direccion`, `telefono`) VALUES ('Hugo Acosta Diaz', 'Rio Grande', '498 92-3214');

INSERT INTO `acopiadora`.`semilla` (`nombre_semilla`, `descripcion`, `precio_kg`) VALUES ('Frijol común', 'Phaseolus vulgaris es la especie más conocida del género Phaseolus en la familia Fabaceae.', '12.5');
INSERT INTO `acopiadora`.`semilla` (`nombre_semilla`, `descripcion`, `precio_kg`) VALUES ('Frijol comba', 'Bejuco herbáceo voluble, que alcanza 5-6 m de largo. Tallos obtuso-pentagonales o cilíndricos, puberulentos. ', '13.2');
INSERT INTO `acopiadora`.`semilla` (`nombre_semilla`, `descripcion`, `precio_kg`) VALUES ('Frijol ayocote', 'Phaseolus coccineus, conocido como ayocote o ayecote[1] (nahuatlismo de ayecohtli) es una planta herbácea, anual, cultivada y originaria de México. Las variedades con flores rojas se cultivan como ornamentales.', '9.99');
INSERT INTO `acopiadora`.`semilla` (`nombre_semilla`, `descripcion`, `precio_kg`) VALUES ('Frijol tepari', 'El frijol tépari es más resistente a los climas secos que el frijol común (Phaseolus vulgaris) y se ha adaptado muy bien en las condiciones desérticas y semidesérticas desde Arizona hasta Costa Rica.', '10.25');

INSERT INTO `acopiadora`.`acopio` (`fecha`, `folio`, `cantidad_kg`, `idproductor`, `idsemilla`) VALUES ('2016/12/04', '1001', '4000', '1', '2');
INSERT INTO `acopiadora`.`acopio` (`fecha`, `folio`, `cantidad_kg`, `idproductor`, `idsemilla`) VALUES ('2016/10/14', '1002', '5500', '1', '1');
INSERT INTO `acopiadora`.`acopio` (`fecha`, `folio`, `cantidad_kg`, `idproductor`, `idsemilla`) VALUES ('2016/8/01', '1003', '3000', '2', '1');
INSERT INTO `acopiadora`.`acopio` (`fecha`, `folio`, `cantidad_kg`, `idproductor`, `idsemilla`) VALUES ('2016/8/01', '1004', '3000', '2', '3');
INSERT INTO `acopiadora`.`acopio` (`fecha`, `folio`, `cantidad_kg`, `idproductor`, `idsemilla`) VALUES ('2016/02/5', '1005', '4500', '3', '4');
INSERT INTO `acopiadora`.`acopio` (`fecha`, `folio`, `cantidad_kg`, `idproductor`, `idsemilla`) VALUES ('2016/5/8', '1006', '15000', '4', '4');

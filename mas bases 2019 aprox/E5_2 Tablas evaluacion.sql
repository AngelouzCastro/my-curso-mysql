

-- -----------------------------------------------------
-- Table `evaluacion`.`Evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Evaluacion` (
  `Folio` INT NOT NULL AUTO_INCREMENT,
  `Evaluador` VARCHAR(45) NOT NULL,
  `Evaluado` VARCHAR(45) NOT NULL,
  `calificacion` FLOAT NOT NULL,
  PRIMARY KEY (`Folio`))
ENGINE = InnoDB;		


-- -----------------------------------------------------
-- Table `evaluacion`.`Detalles_evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Detalles_evaluacion` (
  `idDetalles_evaluacion` INT NOT NULL AUTO_INCREMENT,
  `criterio` TEXT NOT NULL,
  `evaluacion` TINYINT NOT NULL,
  `Folio` INT NOT NULL,
  PRIMARY KEY (`idDetalles_evaluacion`),
  INDEX `fk_Detalles_evaluacion_Evaluacion_idx` (`Folio` ASC),
  CONSTRAINT `fk_Detalles_evaluacion_Evaluacion`
    FOREIGN KEY (`Folio`)
    REFERENCES `Evaluacion` (`Folio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

insert into Evaluacion VALUES
(111, 'Rene', 'Ximena', 4.5),
(222, 'Tania', 'Ximena', 3.5),
(333, 'Rene', 'Tania', 2);

insert into detalles_evaluacion values 
(null,'Trabajo en equipo',3,111),
(null,'Cumpliminto',5,111),
(null,'Proactividad',2,111),
(null,'Trabajo en equipo',4,222),
(null,'Cumpliminto',5,222),
(null,'Proactividad',5,222),
(null,'Trabajo en equipo',1,333),
(null,'Cumpliminto',2,333),
(null,'Proactividad',2,333);
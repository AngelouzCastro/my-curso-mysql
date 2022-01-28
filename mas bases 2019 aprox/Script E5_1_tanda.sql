
-- -----------------------------------------------------
-- Table socio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS socio (
  idsocio INT NOT NULL AUTO_INCREMENT,
  nombre_socio VARCHAR(100) NOT NULL,
  tellefono VARCHAR(45) NOT NULL,
  PRIMARY KEY (idsocio))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table tanda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tanda (
  idtanda INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(45) NOT NULL,
  monto_tanda FLOAT NOT NULL,
  PRIMARY KEY (idtanda))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table membresia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS membresia (
  idmembresia INT NOT NULL AUTO_INCREMENT,
  numero TINYINT NOT NULL,
  tanda_recibida TINYINT NULL,
  idsocio INT NULL,
  idtanda INT NULL,
  PRIMARY KEY (idmembresia),
  CONSTRAINT fk_membresia_socio
    FOREIGN KEY (idsocio)
    REFERENCES socio (idsocio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_membresia_tanda1
    FOREIGN KEY (idtanda)
    REFERENCES tanda (idtanda)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table pago
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pago (
  idpago INT NOT NULL AUTO_INCREMENT,
  fecha_pago DATE NULL,
  monto FLOAT NOT NULL,
  pagado TINYINT NULL,
  idmembresia INT NULL,
  PRIMARY KEY (idpago),
  CONSTRAINT fk_pago_membresia1
    FOREIGN KEY (idmembresia)
    REFERENCES membresia (idmembresia)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- datos
-- -----------------------------------------------------
insert into socio values
(111, 'Ximena', '493-205486'),
(222, 'Rafael', '498-125483'),
(333, 'Teofilo', '492-97613'),
(444, 'Graciela', '495-456313');

insert into tanda values
(1000, 'Tanda por la salud',2500),
(2000, 'Tanda navideña',3000),
(3000, 'Tanda vacacional',4000);
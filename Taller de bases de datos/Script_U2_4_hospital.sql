CREATE TABLE `doctor` (
  `iddoctor` int(11) NOT NULL auto_increment,
  `cedula` varchar(45) NOT NULL,
  `nombre_doctor` varchar(45) NOT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddoctor`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`)
) ENGINE=InnoDB;

CREATE TABLE `paciente` (
  `idpaciente` int(11) NOT NULL auto_increment,
  `NSS` varchar(45) NOT NULL,
  `nombre_paciente` varchar(45) NOT NULL,
  `direccion` text,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpaciente`),
  UNIQUE KEY `NSS_UNIQUE` (`NSS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `consulta` (
  `idconsulta` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  `diagnostico` text NOT NULL,
  `idpaciente` int(11) NOT NULL,
  `iddoctor` int(11) NOT NULL,
  PRIMARY KEY (`idconsulta`),
  KEY `fk_consulta_paciente_idx` (`idpaciente`),
  KEY `fk_consulta_doctor1_idx` (`iddoctor`),
  CONSTRAINT `fk_consulta_paciente` FOREIGN KEY (`idpaciente`) REFERENCES `paciente` (`idpaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_doctor1` FOREIGN KEY (`iddoctor`) REFERENCES `doctor` (`iddoctor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `medicamento` (
  `idmedicamento` int(11) NOT NULL auto_increment,
  `codigo` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idmedicamento`)
) ENGINE=InnoDB;

CREATE TABLE `receta` (
  `idreceta` int(11) NOT NULL auto_increment,
  `folio` varchar(45) NOT NULL,
  `idconsulta` int(11) NOT NULL,
  `idmedicamento` int(11) NOT NULL,
  `dosis` varchar(45) NOT NULL,
  `frecuencia` varchar(45) NOT NULL,
  PRIMARY KEY (`idreceta`),
  KEY `fk_receta_consulta1_idx` (`idconsulta`),
  KEY `fk_receta_medicamento1_idx` (`idmedicamento`),
  CONSTRAINT `fk_receta_consulta1` FOREIGN KEY (`idconsulta`) REFERENCES `consulta` (`idconsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_medicamento1` FOREIGN KEY (`idmedicamento`) REFERENCES `medicamento` (`idmedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL auto_increment,
  `factura` varchar(45) NOT NULL,
  `monto` float NOT NULL,
  `fecha_pago` varchar(45) DEFAULT NULL,
  `idconsulta` int(11) NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pago_consulta1_idx` (`idconsulta`),
  CONSTRAINT `fk_pago_consulta1` FOREIGN KEY (`idconsulta`) REFERENCES `consulta` (`idconsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `doctor` VALUES (1,'0125403','Cristal Reyes Rojas','Oftalmologo'),(2,'3548838','Heron Torres Lopez','Pediatra'),(3,'9514853','Teodoro Islas Portales','Pediatra'),(4,'9551258','Felix Talamantes Rios','General');

INSERT INTO `medicamento` VALUES (1,'1002','paracetamol','suspención'),(2,'1003','Bencilpenicilina','polvo'),(3,'1004','Dicloxacilina ','tabletas'),(4,'1005','Cefazolina','capsulas'),(5,'1006','Azitromicina ','polvo');

INSERT INTO `paciente` VALUES (1,'ABC12345','Amanda Diaz Salas','Loreto','98 2-11-22'),(2,'VBN09875','Vanesa Cordova Rios','Fresnillo','94 2-44-87'),(3,'TYU98744','Tania Mares Briones','Rio Grande','98 2-99-66'),(4,'RFB19537','Raymundo Flores Briones','Fresnillo','94 2-98-74');

INSERT INTO `consulta` VALUES (1,'2017-11-24','Inflamación intestinal',1,2),(2,'2017-10-24','Infeccion ocular',3,1),(3,'2017-10-07','Contusion craneal',1,2),(4,'2017-11-09','Fractura de brazo',2,4),(5,'2017-11-08','Crisis nerviosa',2,4),(6,'2017-11-24','Estres e insomnio',2,4);

INSERT INTO `pago` VALUES (1,'111',150,'2017-11-9',1),(2,'222',500,'2017-11-29',2),(3,'333',850,'2017-11-29',3),(4,'444',150,'2017-11-29',4),(5,'555',100,'2017-11-29',5);

INSERT INTO `receta` VALUES (1,'100',1,1,'3','8'),(2,'100',1,2,'1','6'),(3,'200',2,3,'1','12'),(4,'200',2,1,'3','8'),(5,'300',3,4,'1','12'),(6,'400',4,5,'5','24');

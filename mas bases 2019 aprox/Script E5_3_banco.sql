

-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.30-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Definition of table `clientes_potenciales`
--

DROP TABLE IF EXISTS `clientes_potenciales`;
CREATE TABLE `clientes_potenciales` (
  `idcuentahabiente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` text,
  PRIMARY KEY (`idcuentahabiente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes_potenciales`
--

/*!40000 ALTER TABLE `clientes_potenciales` DISABLE KEYS */;
INSERT INTO `clientes_potenciales` (`idcuentahabiente`,`nombre`,`telefono`,`email`,`direccion`) VALUES 
 (1,'David Morelos Lopez','982-34-78','davidmorelos@yahoo.com','Galeana #23-A Col. Centro');
/*!40000 ALTER TABLE `clientes_potenciales` ENABLE KEYS */;


--
-- Definition of table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE `cuenta` (
  `no_cuenta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcuentahabiente` int(10) unsigned DEFAULT NULL,
  `idSucursal` int(10) unsigned DEFAULT NULL,
  `tipo` enum('AHORRO','PLAZO','CREDITO') DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  PRIMARY KEY (`no_cuenta`),
  KEY `idSucursal` (`idSucursal`),
  KEY `idcuentahabiente` (`idcuentahabiente`),
  CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cuenta_ibfk_2` FOREIGN KEY (`idcuentahabiente`) REFERENCES `cuentahabiente` (`idcuentahabiente`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuenta`
--

/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` (`no_cuenta`,`idcuentahabiente`,`idSucursal`,`tipo`,`fecha_apertura`) VALUES 
 (1001,10,102,'AHORRO','2019-08-09'),
 (1002,11,103,'PLAZO','2017-10-11'),
 (1003,12,102,'PLAZO','2017-10-12'),
 (1004,12,102,'AHORRO','2018-01-05'),
 (1005,13,105,'CREDITO','2015-12-03'),
 (1006,10,102,'CREDITO','2019-10-01');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;


--
-- Definition of table `cuentahabiente`
--

DROP TABLE IF EXISTS `cuentahabiente`;
CREATE TABLE `cuentahabiente` (
  `idcuentahabiente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` text,
  PRIMARY KEY (`idcuentahabiente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuentahabiente`
--

/*!40000 ALTER TABLE `cuentahabiente` DISABLE KEYS */;
INSERT INTO `cuentahabiente` (`idcuentahabiente`,`nombre`,`telefono`,`email`,`direccion`) VALUES 
 (10,'Carlos Ibañez Torres','982-43-67','carlos_277@hotmail.com','Insurgentes #56, Col. Los Condes'),
 (11,'Mateo Solis Canales','923-11-22','mateo_solis@yahoo.com.mx','Montes de Oca #98, Col. Los Alamos'),
 (12,'Paz Martínez Ferniza','921-87-90','pasita@gmail.com','Zaragoza #68, Col. Centro'),
 (13,'Sofia Reyes Castillo','973-12-12','reyes_castillo@hotmail.com','Priv. Melchor Ocampo #102, Col. Los Ramírez');
/*!40000 ALTER TABLE `cuentahabiente` ENABLE KEYS */;


--
-- Definition of table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE `movimiento` (
  `idmovimiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_cuenta` int(10) unsigned DEFAULT NULL,
  `monto` float NOT NULL,
  `fecha` date NOT NULL,
  `tipo` enum('APERTURA','DEPOSITO','RETIRO','INTERES') DEFAULT NULL,
  PRIMARY KEY (`idmovimiento`),
  KEY `no_cuenta` (`no_cuenta`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`no_cuenta`) REFERENCES `cuenta` (`no_cuenta`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movimiento`
--

/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` (`idmovimiento`,`no_cuenta`,`monto`,`fecha`,`tipo`) VALUES 
 (1,1001,3000,'2019-08-09','APERTURA'),
 (2,1001,5000,'2019-11-01','DEPOSITO'),
 (3,1002,2000,'2017-10-11','APERTURA'),
 (4,1002,500,'2017-12-01','RETIRO'),
 (5,1003,25000,'2017-10-12','APERTURA'),
 (6,1004,12000,'2018-05-01','APERTURA'),
 (7,1005,3000,'2015-12-03','APERTURA'),
 (8,1006,4500,'2019-10-01','APERTURA'),
 (9,1005,300,'2015-12-23','RETIRO');
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;


--
-- Definition of table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
  `idSucursal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`idSucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sucursal`
--

/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` (`idSucursal`,`direccion`,`ciudad`) VALUES 
 (102,'Morelos #3, Col. Mochis','Río Grande'),
 (103,'Constitución #123, Col. Industrial','Fresnillo'),
 (104,'Insurgentes #78, Col Gavilanes','Río Grande'),
 (105,'Lopez Mateos #1002, Col. Centro','Zacatecas');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

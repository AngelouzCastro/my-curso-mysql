
CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(30) NOT NULL,
  `edad` tinyint(3) unsigned NOT NULL,
  `peso` float unsigned NOT NULL,
  `estatura` float unsigned NOT NULL,
  `sexo` char(1) NOT NULL,
  `localidad` char(50) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `personas` VALUES (1,'Javier',26,85,1.65,'M','Fresnillo'),(2,'Dalia',13,45,1.4,'F','Juan Aldama'),(3,'Raquel',19,65,1.5,'F','Río Grande'),(4,'Felipe',45,105,1.89,'M','Miguel Auza'),(5,'Carmen',68,78,1.66,'F','Río Grande'),(6,'Rogelio',8,50,1.3,'M','Juan Aldama'),(7,'Leonardo',42,89,1.91,'M','Miguel Auza'),(8,'Oliva',58,65,1.72,'F','Juan Aldama'),(9,'Martha',23,58,1.45,'F','Río Grande'),(10,'Ana',12,40,1.5,'F','Fresnillo');

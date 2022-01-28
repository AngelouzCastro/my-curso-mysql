use bdreplicada;

CREATE TABLE  paciente  (
   idpaciente  int NOT NULL auto_increment,
   NSS  varchar(45) NOT NULL,
   nombre_paciente  varchar(45) NOT NULL,
   direccion  text,
   telefono  varchar(45) DEFAULT NULL,
  PRIMARY KEY ( idpaciente )
)engine =innodb;


INSERT INTO  paciente  VALUES (1,'ABC12345','Amanda Diaz Salas','Loreto','98 2-11-22'),(2,'VBN09875','Vanesa Cordova Rios','Fresnillo','94 2-44-87'),(3,'TYU98744','Tania Mares Briones','Rio Grande','98 2-99-66'),(4,'RFB19537','Raymundo Flores Briones','Fresnillo','94 2-98-74');

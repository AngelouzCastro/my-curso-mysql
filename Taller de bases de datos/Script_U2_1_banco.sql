
use MCAJ_banco;



create table socio(
	no_socio int primary key auto_increment,
	nombre char(100) not null,
	RFC char(100)  null unique,
	telefono char(30) null
);

create table cuecuentanta(
	no_cuenta int primary key auto_increment,
	tipo_cuenta enum('AHORRO','PLAZO','CREDITO') not null,
	no_socio int,
    foreign key (no_socio) references socio(no_socio)
);

create table movimiento(
  no_mov int primary key auto_increment,
  tipo_mov enum('APERTURA','DEPOSITO','RETIRO','INTERES') not null,
	monto float unsigned not null,
	fecha_hora datetime,
	no_cuenta int,
	FOREIGN KEY (no_cuenta) REFERENCES cuenta(no_cuenta) 
);



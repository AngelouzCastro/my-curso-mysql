create database MCAJ_ventasOnline;
use MCAJ_ventasOnline;

create table socio(
	id_socio int primary key auto_increment,
    alias char(30) not null unique,
    contrasena char(100) not null,
    rfc char(30) unique,
    email char(100) not null unique
);

create table carrito_electronico(
	factura char(30) primary key,
    fecha datetime not null,
    total float not null,
    id_socio int null,
    foreign key(id_socio) references socio(id_socio) 
);

create table producto(
	codigo char(30) primary key,
    descripcion char(100) not null,
    detalles text
);

create table almacen(
	codigo char(30) primary key,
    foreign key (codigo) references producto(codigo),
    existencia int unsigned,
    precio_venta float not null,
    ubicacion char(20)
);

create table detalle_carrito(
	factura char(30),
    foreign key (factura) references carrito_electronico (factura),
    codigo char(30),
    foreign key (codigo) references almacen (codigo),
    cantidad int unsigned default 1,
    observaciones text,
    primary key (factura, codigo)
);
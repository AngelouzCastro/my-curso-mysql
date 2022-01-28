create database MCAJ_farmacia;
use MCAJ_farmacia;
create table laboratorio(
	id_lab int primary key auto_increment,
    nombre_laboratorio char(100) not null unique,
    dirccion text,
    telefono char(20)
);

create table medicamento(
	codigo int primary key,
    nombre_medicamento char(100) not null unique,
    tipo enum('libre', 'restringido') default 'libre',
    id_lab int,
    foreign key(id_lab) references laboratorio(id_lab)
);
    
create table stock(
	id_stock int primary key auto_increment,
    codigo int,
    caducidad date not null,
    existencias int default 1,
    precio_venta float not null,
    foreign key (codigo) references medicamento(codigo)
);

create table cliente(
	no_cliente int primary key auto_increment,
    nombre char(100) not null,
    direcion varchar(45),
    rfc varchar(30) unique,
    curp char(30) not null unique
);

create table venta(
	id_venta int primary key auto_increment,
    no_cliente int,
    foreign key (no_cliente) references cliente(no_cliente),
    fechayhora datetime not null,
    total float unsigned default 0
);

create table venta_medicamento(
	id_venta_med int primary key auto_increment,
    id_venta int,
    foreign key (id_venta) references venta(id_venta),
    id_stock int,
    foreign key (id_stock) references stock(id_stock),
    cantidad int default 1
);
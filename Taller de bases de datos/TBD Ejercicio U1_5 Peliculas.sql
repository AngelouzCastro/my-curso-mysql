create database MCAJ_PELICULAS;
USE MCAJ_PELICULAS;

create table Tarifa(
  id_Tarifa int primary key,
  descripcion char(100) not null unique,
  precio decimal default 10.00
  );
create table pelicula(
  no_pelicula int primary key auto_increment,
  titulo_pelicula char(100) not null unique,
  anyo int,
  id_Tarifa int
  );
  
create table socio(
  curp char(20) primary key,
  nombre char(100) not null unique,
  direccion text not null,
  anyo_afifliacion decimal not null
  );
  
create table renta(
  folio int not null,
  curp char(20),
  no_pelicula int,
  primary key(folio,curp,no_pelicula),
  fecha date not null,
  foreign key(curp) references socio(curp),
  foreign key(no_pelicula) references pelicula(no_pelicula)
  );
  
create table geneeeros(
  id_genero int primary key,
  descripcion char(100) not null unique,
  palabras_clave char(10)
  );
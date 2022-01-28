create table cliente(
  no_cliente int primary key auto_increment,
  nombre_completo char(100) not null,
  telefono char(100) null
);
  
create table equipo(
  id_equipo int primary key auto_increment,
  descripcion char(100) not null,
  no_cliente int,
  foreign key(no_cliente) references cliente(no_cliente)
);

create table reparacion(
  codigo int,
  detalle text not null,
  precio int not null
);

create table equipo_reparacion(
  id_equipo int,
  codigo int
);


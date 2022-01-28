alter table cliente
add direcion text not null;

alter table equipo
add marca char(100);

alter table cliente
drop telefono;

alter table reparacion
change precio precio float;

alter table reparacion
add primary key (codigo);

alter table equipo_reparacion
add id int primary key auto_increment;

alter table equipo_reparacion
drop id;

alter table equipo_reparacion
add primary key (id_equipo, codigo);

alter table equipo_reparacion
add foreign key (id_equipo) references equipo (id_equipo),
add foreign key (codigo) references reparacion (codigo);

alter table equipo
drop foreign key equipo_ibfk_1;
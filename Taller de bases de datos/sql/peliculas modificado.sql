alter table socio
add correo_electronico char(100) null unique;

alter table pelicula
drop anyo;

alter table geneeeros rename genero;

alter table genero
change palabras_clave palabras_clave text;

alter table tarifa
change precio precio float not null;

alter table pelicula
add foreign key (id_Tarifa) references Tarifa (id_Tarifa);

alter table pelicula
add id_genero int,
add foreign key (id_genero) references genero (id_genero);

alter table renta
add id_renta int,
drop primary key,
add primary key (id_renta);


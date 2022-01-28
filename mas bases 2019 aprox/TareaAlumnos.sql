
create table alumno(
	NC int primary key,
    nombre_alumno char(100) not null unique,
    Apellidos_alumno char(100) not null unique,
    id_carrera int,
    foreign key (id_carrera) references carrera(id_carrera)
);

insert into alumno values(17010189, "Rogelio","Dominguez Sanchez", 1);
insert into alumno values(17010190, "Victor Manuel","Delfin Santos", 1);
insert into alumno values(17010369, "Angel Josue","Martinez Castro",1);
insert into alumno values(17010363, "Carmen Alejandra","Castro Salazar",1);
insert into alumno values(17212389, "Pancho", "Ramirez Juarez", 2);
insert into alumno values(17242389, "Juan", "Esparza Lopez", 3);
insert into alumno values(17232389, "Humberto", "Dominguez Juarez", 4);
insert into alumno values(17252389, "Antonio", "Alvarado Sanchez", 5);
insert into alumno values(17262389, "Daniel", "Vital Suarez", 6);
insert into alumno values(17272389, "Fernando", "Domingues Sanchez", 7);




create table carrera(
	id_carrera int primary key auto_increment,
    nombre_carrera char(100) not null unique,
    info_carrera text
);

insert into carrera values(1,"Ingenieria en sistemas computacionales", "Programacion y mas");
insert into carrera values("","Ingenieria en gestion empresarial", "Innovación de procesos");
insert into carrera values("","Ingenieria en TICS", "Administrar tecnologias");
insert into carrera values("","Ingenieria en administracion", "Visión emprendedora");
insert into carrera values("","Ingenieria en industrias alimentarias", "Producción de alimentos"); 
insert into carrera values("","Ingenieria en electromecanica", "Sistemas electromecanicos");
insert into carrera values("","Contador publico", "Hacer cuentas y mas cuentas");


create table materia(
	id_materia int primary key auto_increment,
    id_carrera int,
    foreign key(id_carrera) references carrera(id_carrera),
    nombre_materia char(100) not null 
);

insert into materia values(1,1,"ing en software");
insert into materia values("",2,"Gestionamiento");
insert into materia values("",3, "Redes");
insert into materia values("",4,"administracion de empresas");
insert into materia values("",5,"Comida");
insert into materia values("",6,"Calculo diferencial");
insert into materia values("",1,"Calculo diferencial");
insert into materia values("",7, "Contabilidad");




create table alumno_materia(
	id_alumno_mat int primary key auto_increment,
    NC int,
    foreign key (NC) references alumno(NC),
    id_materia int,
    foreign key (id_materia) references materia(id_materia)
);

insert into alumno_materia values (1, 17010189, 1);
insert into alumno_materia values ("", 17010189, 6);
insert into alumno_materia values("", 17010190,1);
insert into alumno_materia values ("", 17010190, 6);
insert into alumno_materia values("", 17010369,1);
insert into alumno_materia values("", 17010369,6);
insert into alumno_materia values("", 17010363,1);
insert into alumno_materia values("", 17010363,6);
insert into alumno_materia values("", 17212389,2);
insert into alumno_materia values("", 17242389,3);
insert into alumno_materia values("", 17232389,4);
insert into alumno_materia values("", 17252389,5);
insert into alumno_materia values("", 17262389,6);
insert into alumno_materia values("", 17272389,7);






select nombre_materia
from materia natural join carrera
where nombre_carrera = "Ingenieria en sistemas computacionales";


select nombre_alumno
from alumno natural join carrera
where nombre_carrera Like '%Ingenieria%'
order by nombre_alumno;


select nombre_materia
from materia natural join alumno_materia
where NC = 17010190;

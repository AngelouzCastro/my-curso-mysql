create user 'mateo'@'%' identified by 'm@teo';

create user 'rosa'@'localhost' identified by 'erebos';

grant select (id_inscripcion,rol)
on das_deportivo.inscripcion
to 'invitado'@'%' identified by '1234';

grant all
on *.*
to 'adim'@'localhost'
withpersonas grant option;


create user 'supervisor'@'localhost' identified by 'superman';

create user 'invitado'@'%' identified by 'guest';

create user 'admin'@'localhost' identified by '@dmin';

create user 'programador'@'%' identified by 'torque';

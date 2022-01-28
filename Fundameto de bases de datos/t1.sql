/*Crear el usuario para accerso remoto*/
create user 'Angel'@'%'
identified by '1234';

/*asignar privilegios para consultas*/
grant all on *.* to 'Angel'@'%';
create database genealogico;
use genealogico;
create table persona( 
    idpersona int primary key auto_increment,
    nombre char(100) not null,
    idpredecesor int null,
    foreign key(idpredecesor) references persona(idpersona)
on delete set null
on update cascade
);

/*Crear el usuario con acceso remoto*/
create user 'user_gen'@'%' identified by 'admin';
grant select, insert, update, delete on genealogico.* to 'user_gen'@'%';
/*Crear el usuario con acceso local*/
create user 'user_gen'@'localhost' identified by 'admin';
grant select, insert, update, delete on genealogico.* to 'user_gen'@'localhost';
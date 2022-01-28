insert into buzon (id_buzon, nombre, idusuario)
values
(7, 'Academico',
(select idUsuario from usuario
where nombre ='Teodoro Cervantes' limit 1)
);

select contenido
from mensaje
where mensaje_padre=any
(select id_mensaje from mensaje
where asunto='invitación a despedida');

select u1.nombre as remitente,
u2.nombre as destinatario, asunto
from (usuario u1 inner join mensaje
		on u1.idusuario=mensaje.id_remitente)
        inner join buzon on buzon.id_buzon=mensaje.id_buzon
        inner join usuario u2 on u2.idusuario=buzon.idusuario;
        
select m1.contenido as mensaje_padre,
		m2.contenido as mensaje_hijo
from mensaje m1 left join mensaje m2
	on m1.id_mensaje=m2.mensaje_padre;
    
select asunto 
from mensaje 
where id_mensaje <> all (select mensaje_padre from mensaje
	where not isnull(mensaje_padre));
    
create view usuario_buzon as 
select usuario.nombre as nombre_usuario, buzon.nombre as nombre_buzon
from usuario inner join buzon on usuario.idusuario=buzon.idusuario;

create view mensajes_no_leidos as
select * from mensaje where estatus = 'No Leido';

create view lista_mensajes as
select asunto, u1.nombre as remitente, u2.nombre as destinatario
from usuario u1 inner join mensaje on u1.idusuario=mensaje.id_remitente
inner join buzon on mensaje.id_buzon=buzon.id_buzon
inner join usuario u2 on u2.idusuario=buzon.idusuario;

create view lista_mensajes2 as
select asunto, contenido, u1.nombre as remitente, u2.nombre as destinatario
from usuario u1 inner join mensaje on u1.idusuario=mensaje.id_remitente
inner join buzon on mensaje.id_buzon=buzon.id_buzon
inner join usuario u2 on u2.idusuario=buzon.idusuario;


create table usuario(idusuario int primary key, alias varchar(30),
password  varchar(30),
nombre text);

insert into usuario values(1,'Talos','@limañ@','Teodoro  Cervantes'),
                          (2,'Mickey','Limones2310','Miguel Limones'),
                          (3,'Guaguis','damasco','Laura Rios'),
                          (4,'Monze','minusmaximus','Monserrat Canales');


create table buzon(
	id_buzon int primary key,
	nombre text,
	idusuario int,
foreign key (idusuario) references usuario(idusuario));

insert into buzon values(1,'Negocios',1),(2,'Amigos',1),
                        (3,'negocios',2),(4,'Amigos',2),
                        (5,'Cadenas',3),(6,'Amigos',3);


create table mensaje(id_mensaje int primary key,
asunto varchar(30),
contenido text,
estatus varchar(30),
mensaje_padre int,
id_remitente int,
id_buzon int,
foreign key(id_remitente)references usuario(idusuario),
foreign key(id_buzon)references buzon(id_buzon));


insert into mensaje values
(1,'Invitacion a despedida','Hola! Te invito a mi fiesta de despedida.Mañana 8:15 en casa de Fer.Saludos','Leido', Null,2,2),
(2,'Re:Invitacion','OK.Te aviso que voy a llevar algunos amigos interesantes','No Leido',1,1,4),
(3,'Re:Invitacion','Vas a ir Claudia','No Leido',1,1,4),
(4,'junta de estatus','Te recuerdo que mañana te toca presentar avances','Leido',null,1,3),
(5,'Re: Junta de estatus','Ya estoy listo solo falta la parte de Monze','Leido',4,2,1),
(6,'Buen dia','Se feliz y envia este mensaje a 50 contactos','No leido',null,2,5);

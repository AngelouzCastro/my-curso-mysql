insert socio 
values(102, 'Reyes Leyva Antonio', null, '(498) 98 - 23531');

insert into socio
(no_socio, nombre, rfc)
values (103, 'Adame Padilla Laura', 'AAGL8030723');

insert into cuenta
values (2203,'AHORRO', 102), (2204,'PLAZO',102),(2205,'AHORRO',103);

insert into movimiento
values (null,'APERTURA',5000,'2016/09/01 12:30',2203);


insert into movimiento
values (null,'DEPOSITO',500,'2016/09/13 08:45',2203),(null,'APERTURA',3000,'2016/08/03 14:30',2204),
(null,'RETIRO',350,'2016/09/04 15:30',2204),(null,'APERTURA',3500,'2016/09/07 11:00',2205),
(null,'DEPOSITO',150,'2016/09/09 11:00',2205);


insert into socio
values(102, 'Reyes Leyva antonio' ,
null, '(498)98-23531');

insert into cuenta
values (2203, 'AHORRO', 102),
(2204, 'PLAZO', 102),
(2205, 'AHORRO', 103);

insert into movimiento
values (null, 'APERTURA', 5000, '2016/09/01 12:30', 2203);

update socio
set nombre='Leyva Acosta Antonio'
where no_socio=102;

update socio
set telefono='(498)9824355'
where no_socio=103;

update cuenta
set tipo_cuenta='AHORRO';

update movimiento
set monto=monto-50
where tipo_mov='APERTURA';

update movimiento
set monto = monto + monto* .05
where tipo_mov ='DEPOSITO' and monto > 400;

delete from movimiento
where no_cuenta=2205;

delete from movimiento
where tipo_mov='DPOSITO' and monto < 200;

delete from movimiento
where tipo_mov='APERTURA' and monto between 1500 and 2500;
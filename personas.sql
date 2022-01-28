select avg(edad) as promedio_edad
from personas;

select round(min(estatura),2), round(max(estatura),2)
from personas;
 
select localidad, count(*)
from personas
group by localidad;

select localidad, sexo, count(*)
from personas
group by localidad, sexo;

select localidad, avg(edad) as promedio_edad
from personas
group by localidad;

select sexo, avg(peso) as promedio_peso
from personas
group by sexo;

select localidad, min(estatura)
from personas
group by localidad
order by estatura asc;

select localidad, max(peso)
from personas
group by localidad
order by peso desc;


select localidad, avg(estatura) as prom_est
from personas
group by localidad
order by prom_est DESC
limit 1;

select avg(edad) as prom_edad, avg(peso) as prom_peso, avg(estatura) as prom_est
from personas
where edad between 10 and 30;

select localidad, count(*) as registro
from personas
group by localidad
having registro>=3;

select localidad, sexo, round(avg(edad),2) as prom_edad, round(avg(estatura),2) as prom_est, round(avg(peso),2)
from personas
group by localidad, sexo;

select localidad, round(avg(estatura),2) as prom_est
from personas
group by localidad
having prom_est between 1.80 and 1.90;
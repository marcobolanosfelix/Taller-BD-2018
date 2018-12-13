use cuatro_cuadras
Go
--1 Numero de check in que se hicieron en la fecha 09/10/2018
select count(*)
from Checkin
where fecha ='2015-06-21'

--2 id del usuario con check in en la fecha 12/09/2018 
select nombre from Usuario as us inner join Checkin as c on us.id=c.usuario_id
where fecha='2015-06-21'

-- 3 Nombre de los usuarios que ya consiguieron un logro 
select nombre  from Usuario as us inner join Logro as lo on us.id=lo.id_usuario 


--4 Mostrar cuantas personas tienen la insignia fotogenico 
select nombre  from Usuario as us inner join Logro as lo on us.id=lo.id_usuario inner join Insignia as insg on lo.id_insignia=insg.id
where insg.id like '1'




--5 Mostrar los usuarios con ningun logro y que sean de culiacan
select * from Usuario as us inner join Ciudad as cu on us.id_ciudad=cu.id
where us.id not in(select id_usuario from Logro) and cu.id like '1'






--6 mostrar usuarios que adquieron un logro despues del 01/09/2018
select nombre  from Usuario as us inner join Logro as lo on us.id=lo.id_usuario 
where us.id in (select lo.id_usuario where fecha>'2017-06-21')


--7 mostrar nombre del lugar que pertenezcan a la categoria restaurant
select lug.nombre from Lugar as lug inner join categoria as cat on lug.id_categoria=cat.id
where cat.id like '1'

--8 mostrar usuarios con mas de 1 logro
select * from Usuario 
where id  in(
select log1.id_usuario from Logro as log1 inner join Logro as log2 on log1.id_usuario=log2.id_usuario
where log1.id_usuario like log2.id_usuario)


--9 Mostrar los usuarios con ningun interes
select *  from usuario 
where id not in( select id_usuario from Intereses_Usuario)

-- 10 Mostrar los usuarios con mas de 1 interes
select * from usuario 
where id in (
select   int1.id_usuario from Intereses_Usuario as int1 inner join Intereses_Usuario as int2 on int1.id_usuario=int2.id_usuario
where int1.id_usuario like int2.id_usuario)

--11 mostrar los usuarios con interes en sinaloa
select us.nombre from usuario as us inner join Intereses_Usuario as intus on us.id=intus.id_usuario inner join interes as inte on 
inte.id=intus.id_interes
where inte.id like '30'

-- 12mostrar los usuarios con interes en videojues y chicas 
select us.nombre from usuario as us inner join Intereses_Usuario as intus on us.id=intus.id_usuario inner join interes as inte on 
inte.id=intus.id_interes
where inte.id like '1' and inte.id like '6'

-- 13 mostrar las solicitudes que se recibieron antes  de la fecha 2017-01-01

select * from Solicitud
where id_recibe not in(select id_recibe from Solicitud where fecha>'2017-01-01')

--14 mostrar las solicitudes que fueron aceptadas

select * from Solicitud
where estado='Aceptado'


--15 mostrar las solicitudes  a parti de la fecha 2017-01-01 y fueron aceptadas
select *from Solicitud
where fecha>'2017-01-01' and estado='Aceptado'

--16 mostrar las solicitudes que le llegaron a el usuario con id 5

select * from usuario as us inner join Solicitud as so on us.id=so.id_recibe
where so.id_recibe='44'

--17 mostrar las solicitudes que  envio el usuario con id 7
select * from usuario as us inner join Solicitud as so on us.id=so.id_recibe
where so.id_envio='7'

--18 mostrar las solicitudes que envio el usuario con id 10 y que fueron rehazadas
select * from usuario as us inner join Solicitud as so on us.id=so.id_recibe
where so.id_envio='10' and estado='Rechazado'

--19 mostrar las etiquetas del lugar con id 5
select * from Lugar as lu inner join Etiqueta_Lugar as et on lu.id=et.id_lugar inner join Etiqueta as et2 on 
et.id_etiqueta=et2.id
where lu.id='5'

--20 mostrar cuantas solicitudes se enviaron en total

select count(id_recibe)
from Solicitud
where estado='Aceptado'

--21 mostras los usuarios de mazatlan y que tengan interes en corridos  ----no trivial --------
select * from Usuario as us inner join Intereses_Usuario as intus on us.id=intus.id_usuario inner join Interes as int2 on intus.id_interes=int2.id inner join Ciudad as ci on us.id_ciudad=ci.id
where int2.id='23' and ci.id='2'

--22 mostrar los check in con valoracon mayor a 3.0
select *from Checkin 
where valoracion>'3.0'


--23 Cantidad de check in realizados entre 2017-01-01 y 2018-01-01

select count(*) from Checkin c
where c.fecha>='2017-01-01' and c.fecha<='2018-01-01'

--24 mostrar cantidad de ckeck in que se hicieron en el restaurant cabanna
select count(*) from Checkin c
WHERE c.lugar_id='1'

--25 mostrar la de donde es el usuario con id 8

select c.nombre from ciudad as c inner join usuario as us on us.id_ciudad=c.id
where   us.id='8'

--26 mostrar cuantos logros se hicieron de 2017-01-01 hasta el 2017-01-01
select COUNT(*) from Logro l 
where l.fecha>='2017-01-01' and l.fecha<= '2018-01-01'

--27 mostrar cuantos logros se hicieron en el restaurant cabanna 

select count(*) from logro 
where lugar_id='1'

--28 mostrar cuantos logros se hicieron con la insignia que tiene id = 4
select count(*) from logro
where id_insignia='4'

--29 mostrar el nombre de la persona que hizo el check in numero 100 y en que restaurant fue 
select us.id,us.nombre,c.id,l.nombre from Checkin as c inner join Lugar as l on l.id=c.lugar_id inner join Usuario as us on us.id=c.usuario_id
where c.id like 100 

--30 mostrar cuantas personas estan interesadas en programacion y de donde son 

select count(*) from Intereses_Usuario   
where id_interes='2'

--31 mostrar cuantos usuarios no an echo 1 check in 
select count(*) from Checkin c
where c.usuario_id not in(select usuario_id from Checkin)

--32 mostrar did_recibeonde hizo check in la persona con nombre 'Alessandro Romanov'

select c.id,lu.nombre,us.nombre,c.fecha from  Checkin as c inner join Lugar as lu on lu.id=c.lugar_id inner join Usuario as us on 
c.usuario_id=us.id where c.usuario_id in (select id from usuario where nombre='Jorge Barraza')


--33 mostrar cantidad de usuarios por cuidad 

select c.id,count(us.id_ciudad)
from ciudad c inner join usuario as us on us.id_ciudad=c.id 
group by c.id






--34 mostrar cuando acepto la persona con id 15 a su primer persona 

select fecha from Solicitud as s
where s.id_recibe='15'

--35 mostrar el usuario con mas logros
select * from  logro 
where 







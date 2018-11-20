

go
create view Usuarios_V
as
select id, nombre_usuario,email from Usuario
go

go
create view Checkin_V
as 
select lugar_id, usuario_id, comentario, valoracion from Checkin
where(valoracion >3.0)
go

go 
create view Solicitud_V
as
select  fecha,id_recibe,estado from Solicitud
where(fecha>'2015-06-21' and fecha<'2018-01-01')
go 


go

create view Logro_V 
as
select id_insignia,id_usuario,fecha from Logro
where( id_usuario >=1 and id_usuario<=20)
go 


go
create view Lugar_V
as 
select nombre,longitud,latitud,descripcion from Lugar 
go

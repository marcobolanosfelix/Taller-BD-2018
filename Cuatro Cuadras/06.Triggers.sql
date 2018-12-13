use Cuatro_Cuadras
Go
create trigger ValidaCategoria on Categoria 
for insert as
declare @nombre varchar(50)
select @nombre = nombre from inserted
if(@nombre like '[0123456789]%')
begin 
rollback tran
    raiserror('el nombre no puede empezar con un numero',16,1)
	end
	go

create trigger Validacontraseña on Usuario
for insert as
declare @contraseña varchar(50)
select @contraseña = contraseña from inserted
if(@contraseña not like '[A-Z]%')
begin 
	rollback tran
    raiserror('LA CONTRASEÑA DEBE EMPEZAR CON UNA LETRA',16,1)
end
go

create trigger ValidaCiudad on Ciudad
for insert as
declare @nombre varchar(50)
select @nombre = nombre from inserted
if(@nombre  like '[1234567890]%'or @nombre  like '%[1234567890]%' or @nombre  like '%[1234567890]')
begin 
	rollback tran
    raiserror('El nombre de ciudad  no debe tener numeros',16,1)
end
go

create trigger ValidaInsignia on Insignia
for insert as
declare @descripcion varchar(100)
select @descripcion = descripcion from inserted
if(LEN(@descripcion)<5)
begin 
	rollback tran
    raiserror('la descripcion debe ser mayor a 5',16,1)
end
go

create trigger asignalogrofotogenico on Checkin
for insert as 
declare @lugar int, @usuario int, @fecha date, @count int,@hora time
set @count=0
select @lugar=lugar_id,@usuario=usuario_id,@fecha=fecha from inserted

select @count= count(*) from Checkin
where usuario_id=@usuario and lugar_id in (select id_lugar from Lugar l inner join Etiqueta_Lugar e on e.id_lugar=l.id and e.id_etiqueta=2)
if (@count=3)
begin 
if not exists (select*from Logro where id_usuario=@usuario and id_insignia=1)
insert Logro values(1,@lugar,@usuario,@fecha,@hora)
end
go


go
create trigger asignalogrocanoa on Checkin
for insert as 
declare @lugar int, @usuario int, @fecha date, @count int,@hora time
set @count=0
select @lugar=lugar_id,@usuario=usuario_id,@fecha=fecha from inserted

select @count= count(*) from Checkin
where usuario_id=@usuario and lugar_id in (select id_lugar from Lugar l inner join Etiqueta_Lugar e on e.id_lugar=l.id and e.id_etiqueta=1)

if (@count=3)
begin 
if not exists (select*from Logro where id_usuario=@usuario and id_insignia=8)
insert Logro values(8,@lugar,@usuario,@fecha,@hora)
end
go


go
create trigger asignalogroexotico on Checkin
for insert as 
declare @lugar int, @usuario int, @fecha date, @count int,@hora time
set @count=0
select @lugar=lugar_id,@usuario=usuario_id,@fecha=fecha from inserted

select @count= count(*) from Checkin
where usuario_id=@usuario and lugar_id in (select id_lugar from Lugar l inner join Etiqueta_Lugar e on e.id_lugar=l.id and e.id_etiqueta=3)

if (@count=3)
begin 
if not exists (select*from Logro where id_usuario=@usuario and id_insignia=8)
insert Logro values(8,@lugar,@usuario,@fecha,@hora)
end

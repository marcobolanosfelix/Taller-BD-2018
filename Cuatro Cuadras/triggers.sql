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

create trigger t_longitud on Lugar
for insert as
declare @longitud decimal(5,2)
select @longitud = longitud from inserted
if(@longitud<20)
begin 
	rollback tran
    raiserror('la longitud debe ser mayor a 20',16,1)
end
go

create trigger Validacontraseña on Usuario
for insert as
declare @contraseña varchar(50)
select @contraseña = contraseña from inserted
if(@contraseña like '[A-Z]%')
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

create trigger asignalogro on Checkin
for insert as 
declare @lugar int @usuario int @fecha datetime, @count int 
set @count=0
select @lugar=lugar_id,@usuario=usuario_id,@fecha=fecha from inserted

select @count= count(*) from Checkin
where usuario_id=@usuario and lugar_id=@lugar
if (@count=3 and @lugar=1)
begin 
insert Logro values(3,@usuario,@lugar,@fecha

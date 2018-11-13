---Vistas
---#1
use [Gallo Giro]
Go
Create view Fecha
as
select DATEADD(day,(rand()*(datediff(day,'04-02-2017',getdate())-1))+1,'04-02-2017') as Fecharandom
Go

Create view Hora
as
select convert(time,DATEADD(MILLISECOND,rand()*(datediff(MILLISECOND,'06:00:00','20:30:00')),'06:00:00')) as Horarandom
Go

Create view SucursalRand
as 
select convert(smallint,(select top(1) ID_Almacen from Sucursal order by newid())) as IDRand
Go

Create view AlmacenSucursal
as 
select s.ID_Almacen,a.ID from Almacen a join Sucursal s on a.ID=s.ID_Almacen 
Go

drop view AlmacenSucursal


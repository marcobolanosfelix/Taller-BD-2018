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

Create view Venta_Entrega
as 
select v.Folio as Folio, t.Nombre as TipoEntrega, v.ID_Sucursal as SucursalID, d.UPC_Producto from DetalleVenta d 
inner join Venta v on v.Folio=d.Folio_Venta inner join TipoEntrega t on t.ID=v.ID_Entrega 
Go


select Folio from Venta_Entrega where TipoEntrega='En Sucursal'
drop view Venta_Entrega
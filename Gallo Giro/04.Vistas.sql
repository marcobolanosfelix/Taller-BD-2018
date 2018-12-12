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

Create view CEDISRand
as
select top(1) ID_Almacen from CEDIS order by NEWID()
Go

Create view AlmacenRand
as
select top(1) ID from Almacen order by NEWID()
Go

Create view Producto_Rand
as
select top(1) UPC from Presentación order by NEWID()
Go

Create view Venta_Entrega
as 
select v.Folio as Folio, t.Nombre as TipoEntrega, v.ID_Sucursal as SucursalID, d.UPC_Producto from DetalleVenta d 
inner join Venta v on v.Folio=d.Folio_Venta inner join TipoEntrega t on t.ID=v.ID_Entrega 
Go

Create view Presentación_Precio
as
select UPC,PrecioUnitarioActual from Presentación 
Go

Create view Stock_Sucursal
as
select UPC_Producto,[Stock Producto],Sucursal.ID_Almacen as ID_Sucursal,ID_CEDIS,Folio as [Folio Venta], Nombre from Venta inner join
TipoEntrega on TipoEntrega.ID=Venta.ID_Entrega 
left join Inventario on Inventario.ID_Almacen=Venta.ID_Sucursal
left join Sucursal on Sucursal.ID_Almacen=Venta.ID_Sucursal 
Go

Create view [Productos Peligrosos]
as 
select UPC from Presentación p where exists(select*from Presentación pe
inner join Peligrosidad_Etiqueta pel on pel.ID_Producto=pe.ID_Base 
inner join Etiqueta_Peligro e on e.ID=pel.ID_Etiqueta where p.UPC=pe.UPC and (e.Simbolo='E' or e.Simbolo='T+' or e.Simbolo='C' or e.Simbolo='F+') )
Go
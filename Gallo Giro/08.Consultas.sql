----Consultas 
use [Gallo Giro]
Go
-----------Consultas No Triviales:

----#1.-Mostrar los nombres de los clientes que hayan comprado un mismo producto de distinta sucursal el mismo mes
select distinct  c1.Nombre+' '+c1.ApellIDoPaterno [Comprador 1], c2.Nombre+' '+c2.ApellIDoPaterno [Comprador 2],d1.UPC_Producto,d2.UPC_Producto from Cliente c1 
inner join Venta v1 on v1.ID_Cliente=c1.ID
inner join DetalleVenta d1 on d1.Folio_Venta=v1.Folio 
inner join DetalleVenta d2 on d2.UPC_Producto=d1.UPC_Producto
inner join Venta v2 on v2.Folio=d2.Folio_Venta 
inner join Cliente c2 on c2.ID=v2.ID_Cliente where v1.ID_Sucursal<>v2.ID_Sucursal and month(v1.fecha)=month(v2.fecha) and year(v1.fecha)=year(v2.Fecha) and c1.ID<c2.ID

----#2.-Número de sucursales que generaron en promedio un número mayor o igual a 4 ventas por mes los últimos cuatro meses 
select s.ID_Almacen,count(v.Folio) from Sucursal s 
inner join Venta v on v.ID_Sucursal=s.ID_Almacen 
where (v.Fecha between dateadd(month,-4,getdate()) and getdate()) 
group by s.ID_Almacen
having (count(v.Folio)/datediff(month, dateadd(month,-4,getdate()) ,getdate()))>=4

---#3.-Mostrar el id y dirección de la sucursal que haya generado el mayor número ventas entre los meses de enero y mayo de 2018
select top(1) s.id_Almacen,d.Calle+' '+isnull(convert(varchar,d.Número),'')+' '+c.Nombre+' '+ci.Nombre, count(v.folio) as [Total de ventas] from Sucursal s 
inner join Venta v on v.id_sucursal=s.id_almacen 
inner join Almacen a on a.id=s.id_Almacen 
inner join Dirección d on d.ID=a.ID_Dirección
inner join Colonia c on c.ID=d.ID_Colonia
inner join Ciudad ci on ci.ID=c.ID_Ciudad
where (datepart(month,v.Fecha) between 1 and 5) and (datepart(year,v.Fecha)=2018)
group by s.ID_Almacen,d.calle,c.Nombre,ci.Nombre,d.Número
order by [Total de ventas] desc

---#4.-Mostrar el periodo del año en el que hay mayor ingreso de ventas (por cuatrimestre) 
select top(1) datepart(quarter,v.fecha) as [Cuatrimestre], format(sum(dv.Cantidad*dv.PrecioUnitarioProducto),'$###,##')as [Ingreso total de ventas] from DetalleVenta dv 
inner join Venta v on v.Folio=dv.Folio_Venta
group by datepart(quarter,v.fecha)
order by [Ingreso total de ventas] desc

---#5.-




----Just in case of emergency :D
select format(FechaCompra, 'dd/MM/yyyy') from Compra where Folio=49

select top(1) ID_Almacen from Sucursal order by newid()

select Cliente.id ,count(UPC_Producto)
from Cliente 
inner join Venta on venta.ID_Cliente=Cliente.ID
inner join DetalleVenta on DetalleVenta.Folio_Venta=Venta.Folio
group by cliente.id

---
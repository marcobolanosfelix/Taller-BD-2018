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

----#2.-Número de sucursales que generaron en promedio un número mayor o igual a 3 ventas de producto por mes los últimos tres meses 
select s.ID_Almacen,count(d.UPC_Producto) as [Cantidad] from Sucursal s 
inner join Venta v on v.ID_Sucursal=s.ID_Almacen 
inner join DetalleVenta d on d.Folio_Venta=v.Folio
where (v.Fecha between dateadd(month,-3,getdate()) and getdate()) 
group by s.ID_Almacen
having (count(v.Folio)/datediff(month, dateadd(month,-3,getdate()) ,getdate()))>=2

---#3.-Mostrar el id y dirección de la sucursal que haya generado el mayor número ventas entre los meses de enero y mayo de 2018
select top(1) s.id_Almacen,d.Calle+' '+isnull(convert(varchar,d.Número),'')+' '+ci.Nombre, count(v.folio) as [Total de ventas] from Sucursal s 
inner join Venta v on v.id_sucursal=s.id_almacen 
inner join Almacen a on a.id=s.id_Almacen 
inner join Dirección d on d.ID=a.ID_Dirección
inner join Ciudad ci on ci.ID=d.ID_Ciudad
where (datepart(month,v.Fecha) between 1 and 5) and (datepart(year,v.Fecha)=2018)
group by s.ID_Almacen,d.calle,ci.Nombre,d.Número
order by [Total de ventas] desc

---#4.-Mostrar el periodo del año en el que hay mayor ingreso de ventas (por cuatrimestre) 
select top(1) datepart(quarter,v.fecha) as [Cuatrimestre], format(sum(dv.Cantidad*dv.PrecioUnitarioProducto),'$###,##')as [Ingreso total de ventas] from DetalleVenta dv 
inner join Venta v on v.Folio=dv.Folio_Venta
group by datepart(quarter,v.fecha)
order by [Ingreso total de ventas] desc

---#5.-Mostrar los productos que cambiaron de precio el mes pasado
select UPC_Producto from Historico_Ventas h1
where datepart(MONTH,Fecha_Actualización)=datepart(month,dateadd(month,-1,GETDATE())) and 
datepart(year,Fecha_Actualización)=datepart(year,dateadd(month,-1,GETDATE())) and exists (select*from Historico_Ventas h2 where Fecha_Actualización<h1.Fecha_Actualización)

---#6.-Demostrar que el inventario funciona correctamente
select Almacen,UPC,sum(Cantidad) from (
select c.ID_CEDIS as [Almacen],cp.UPC_Producto as [UPC],sum(cp.Cantidad) as [Cantidad] from Compra c 
inner join CompraProducto cp on cp.Folio_Compra=c.Folio group by c.ID_CEDIS,cp.UPC_Producto
union
select v.ID_Sucursal,d.UPC_Producto,-sum(d.Cantidad) from Venta v 
inner join DetalleVenta d on d.Folio_Venta=v.Folio group by v.ID_Sucursal,d.UPC_Producto
union
select ti.ID_AlmacenEnvío,tp.[UPC-Producto],-sum(tp.Cantidad) from TransferenciaInventario ti
inner join TransferenciaProducto tp on tp.ID_TransferenciaInventario=ti.ID group by ti.ID_AlmacenEnvío,tp.[UPC-Producto]
union
select ti.ID_AlmacenRecibe,tp.[UPC-Producto],sum(tp.Cantidad) from TransferenciaInventario ti
inner join TransferenciaProducto tp on tp.ID_TransferenciaInventario=ti.ID group by ti.ID_AlmacenRecibe,tp.[UPC-Producto] ) temp group by Almacen,UPC

select*from Inventario


---#7.-Mostrar el primer registro historico que se tiene de los productos que se ofrecen 
select*from(select ROW_NUMBER()over(partition by UPC_Producto order by Fecha_Actualización) as [Orden], Fecha_Actualización as Fecha,UPC_Producto, Hora_Actualización as Hora  
	from Historico_Ventas) p where Orden=1

---#8.-Mostrar las ganancias obtenidas por la empresa de dos meses atrás hasta la fecha
select sum(Ganancia) from
(
select sum((PrecioUnitarioProducto*Cantidad)) as [Ganancia] from Venta v 
inner join DetalleVenta d on d.Folio_Venta=v.Folio
where (v.Fecha between dateadd(month,-4,getdate()) and getdate()) 
union
select -sum((PrecioUnitario*Cantidad)) from Compra c
inner join  CompraProducto cp on cp.Folio_Compra=c.Folio
where (c.FechaCompra between dateadd(month,-4,getdate()) and getdate()) 
) p

---#9.-Mostrar a los clientes que no han comprado ningun producto el año
select*from Cliente 
where not exists(select*from Venta inner join DetalleVenta on DetalleVenta.Folio_Venta=Venta.Folio where DATEPART(year,Venta.Fecha)<>datepart(year,GETDATE())
and Cliente.ID=Venta.ID_Cliente)

---#10.-Mostrar las ventas que se realizaron en una misma sucursal el mes pasado
select v1.Folio as [Venta 1],v2.Folio as [Venta 2] from Venta v1 
inner join Sucursal s1 on s1.ID_Almacen=v1.ID_Sucursal
inner join Sucursal s2 on s2.ID_Almacen=s1.ID_Almacen
inner join Venta v2 on v2.ID_Sucursal=s2.ID_Almacen
where v2.Folio<v1.Folio  and datepart(month,v2.Fecha)=datepart(month,DATEADD(month,-1,getdate())) and 
datepart(year,v2.Fecha)=datepart(year,getdate()) and
datepart(month,v1.Fecha)=datepart(month,DATEADD(month,-1,getdate())) and 
datepart(year,v1.Fecha)=datepart(year,getdate())


---#11.-

----Just in case of emergency :D
select format(FechaCompra, 'dd/MM/yyyy') from Compra where Folio=49

select top(1) ID_Almacen from Sucursal order by newid()

select Cliente.id ,count(UPC_Producto)
from Cliente 
inner join Venta on venta.ID_Cliente=Cliente.ID
inner join DetalleVenta on DetalleVenta.Folio_Venta=Venta.Folio
group by cliente.id

---
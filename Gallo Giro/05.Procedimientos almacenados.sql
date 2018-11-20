use [Gallo Giro]
Go
---5to Paso: Procedimientos almacenados

---Actualiza el inventario de acuerdo a la operación señalada (Aumentar stock=1 |Reducir stock=0) 
Create Procedure Actualizar_Inventario
(
@Operación bit,
@IDAlmacen smallint,
@UPC bigint,
@Cantidad smallint
)
as

if(@Operación='True')
begin
update Inventario set [Stock Producto]=([Stock Producto]+@cantidad) where @UPC=UPC_Producto and @IDAlmacen=ID_Almacen
return
end

update Inventario set [Stock Producto]=([Stock Producto]-@cantidad) where @UPC=UPC_Producto and @IDAlmacen=ID_Almacen
Go

---Valida la peligrosidad de un producto para verificar su permanencia en los almacenes
Create procedure Peligrosidad_Validación
(
@UPC bigint
)
as
if exists(select*from Presentación pe
inner join Peligrosidad_Etiqueta pel on pel.ID_Producto=pe.ID_Base 
inner join Etiqueta_Peligro e on e.ID=pel.ID_Etiqueta where @UPC=pe.UPC and (e.Simbolo='E' or e.Simbolo='T+' or e.Simbolo='C') ) 
return 1

else
return 0

Go

---Permite conservar los precios de compra y venta que se ven implicados en las operaciones
Create Procedure Asignar_Precio
(
@Folio_Movimiento smallint,
@Fecha date,
@Hora time,
@UPC bigint,
@Movimiento bit
)
as 
	declare @FechaMovimiento datetime=(convert(varchar,@fecha)+' '+convert(varchar,format(@hora,'hh\:mm\:ss')))

	declare @FechaPrimerRegistro datetime=(select (convert(varchar,fecha)+' '+convert(varchar,format(hora,'hh\:mm\:ss'))) 
	from (select ROW_NUMBER()over(partition by UPC_Producto order by Fecha_Actualización) as [Orden], Fecha_Actualización as Fecha,UPC_Producto, Hora_Actualización as Hora  
	from Historico_Ventas) p where Orden=1 and UPC_Producto=@UPC)

if(@FechaMovimiento<@FechaPrimerRegistro)
	begin
		if (@Movimiento='True')
		 begin
			print 'Ya sientese, señora'
			delete from DetalleVenta where @Folio_Movimiento=Folio_Venta and @UPC=UPC_Producto
			return
		end
		else
			delete from CompraProducto where @Folio_Movimiento=Folio_Compra and @UPC=UPC_Producto
			return
		end

declare @contador int=1
while(@contador<=(select count(*) from Historico_Ventas where UPC_Producto=@UPC group by UPC_Producto))

begin
	declare @Precio money
	declare @fechaTemp date=(select(convert(varchar,fecha)+' '+convert(varchar,format(hora,'hh\:mm\:ss'))) 
	from (select ROW_NUMBER()over(partition by UPC_Producto order by Fecha_Actualización) as [Orden], Fecha_Actualización as Fecha,UPC_Producto,Hora_Actualización as Hora 
	from Historico_Ventas) p where orden=@contador and UPC_Producto=@UPC)

	print @fechaTemp

	if(@FechaMovimiento>=@fechatemp)
	begin
		print 'Ya valió v'
		set @Precio=(select Precio from(select ROW_NUMBER()over(partition by UPC_Producto order by Fecha_Actualización) as [Orden], UPC_Producto,Precio_Venta as Precio 
		from Historico_Ventas) p where orden=@contador and UPC_Producto=@UPC)
		set @contador=@contador+1
		print @contador
	end

	else
	break
end
	return @Precio
Go

---Conserva la integridad de los precios al momento de realizar una compra o venta
Create Procedure Precios_Venta_Compra
(
@Cantidad smallint,
@UPC bigint,
@FolioMovimiento smallint,
@Precio money,
@TipoMovimiento bit
)
as

	if(@TipoMovimiento='False')
		begin
			if(@Cantidad<100)
			update DetalleVenta set [PrecioUnitarioProducto]=@Precio where Folio_Venta=@FolioMovimiento and UPC_Producto=@UPC

			if(@Cantidad>=100)
			update DetalleVenta set [PrecioUnitarioProducto]=@Precio-((.10)*(@Precio)) where Folio_Venta=@FolioMovimiento and UPC_Producto=@UPC

			if(@Cantidad>=500)
			update DetalleVenta set [PrecioUnitarioProducto]=@Precio-((.15)*(@Precio)) where Folio_Venta=@FolioMovimiento and UPC_Producto=@UPC

			return
		end

	update CompraProducto set [PrecioUnitario]=@Precio-((@Precio)*(0.3)) where Folio_Compra=@FolioMovimiento and UPC_Producto=@UPC
Go

 SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE ROUTINE_TYPE = 'PROCEDURE'
   ORDER BY ROUTINE_NAME


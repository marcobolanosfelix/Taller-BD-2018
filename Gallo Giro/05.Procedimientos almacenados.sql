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

	if not exists (select * from Inventario where @UPC=UPC_Producto and @IDAlmacen=ID_Almacen)
		begin 
			insert into Inventario(ID_Almacen,UPC_Producto,[Stock Producto])
			values(@IDAlmacen,@UPC,@cantidad)
			print 'Se agregó el producto al inventario del Almacen con ID: '+convert(varchar,@IDAlmacen)
			return
		end
update Inventario set [Stock Producto]=([Stock Producto]+@cantidad) where @UPC=UPC_Producto and @IDAlmacen=ID_Almacen
return
end


if not exists (select * from Inventario where @UPC=UPC_Producto and @IDAlmacen=ID_Almacen)
		begin 
			raiserror('El producto no existe en el inventario',16,1)
			return
			rollback
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
inner join Etiqueta_Peligro e on e.ID=pel.ID_Etiqueta where @UPC=pe.UPC and (e.Simbolo='E' or e.Simbolo='T+' or e.Simbolo='C' or e.Simbolo='F+') ) 
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
		 begin;
			THROW 51000,'La fecha de venta no coincide con el primer registro que se tiene del producto',1
			return
		end
		else
		 begin;
			THROW 51000,'La fecha de compra no coincide con el primer registro que se tiene del producto',1
			return
		 end
		end

declare @contador int=1
while(@contador<=(select count(*) from Historico_Ventas where UPC_Producto=@UPC group by UPC_Producto))

begin
	declare @Precio money
	declare @fechaTemp date=(select(convert(varchar,fecha)+' '+convert(varchar,format(hora,'hh\:mm\:ss'))) 
	from (select ROW_NUMBER()over(partition by UPC_Producto order by Fecha_Actualización) as [Orden], Fecha_Actualización as Fecha,UPC_Producto,Hora_Actualización as Hora 
	from Historico_Ventas) p where orden=@contador and UPC_Producto=@UPC)

	if(@FechaMovimiento>=@fechatemp)
	begin
		set @Precio=(select Precio from(select ROW_NUMBER()over(partition by UPC_Producto order by Fecha_Actualización) as [Orden], UPC_Producto,Precio_Venta as Precio 
		from Historico_Ventas) p where orden=@contador and UPC_Producto=@UPC)
		set @contador=@contador+1
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

---Calcular el saldo del cliente hasta la fecha actual
Create Procedure Saldo
(
@IDCliente smallint
)
as
select*from Cliente
Go


 SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE ROUTINE_TYPE = 'PROCEDURE'
   ORDER BY ROUTINE_NAME


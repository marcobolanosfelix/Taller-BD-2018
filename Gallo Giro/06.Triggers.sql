use [Gallo Giro]
Go
---6to Paso: Triggers
select*from Inventario
select*from DetalleVenta

select r.Nombre,c.Nombre from Ciudad c inner join Region r on r.ID=c.ID_Region

---Actualizar el stock del inventario al momento de una venta
Create Trigger VentaAlmacen
On DetalleVenta for insert
as
	declare @cantidad smallint
	declare @UPC bigint
	declare @IDSucursal smallint

 select @cantidad=Cantidad,@UPC=UPC_Producto,@IDSucursal=ID_Sucursal from inserted i inner join Venta v on v.Folio=i.Folio_Venta

if(@cantidad=0)
	begin 
		raiserror('No se puede vender una cantidad nula de productos',10,1);
		rollback;
	return
	end

if not exists (select * from Inventario
where @UPC=UPC_Producto and @IDSucursal=ID_Almacen)
	begin
		raiserror('El producto no existe en el inventario',10,1)
		rollback;
	return
	end 

if ((select [Stock Producto]-@cantidad from Inventario 
	where @UPC=UPC_Producto and @IDSucursal=ID_Almacen)<0)
	begin 
		raiserror('No hay suficiente stock en el invetario para satisfacer la venta del producto',10,1)
		rollback;
	end

 update Inventario set [Stock Producto]=([Stock Producto]-@cantidad) where @UPC=UPC_Producto and @IDSucursal=ID_Almacen
Go

---Actualizar el stock del inventario al momento de una compra
Create Trigger CompraAlmacen
On CompraProducto after insert 
as
	declare @cantidad smallint
	declare @UPC bigint
	declare @IDCEDIS smallint

 select @cantidad=Cantidad,@UPC=UPC_Producto,@IDCEDIS=ID_CEDIS from Inserted i inner join Compra c on c.Folio=i.Folio_Compra

if not exists (select * from Inventario where @UPC=UPC_Producto and @IDCEDIS=ID_Almacen)
	begin 
		insert into Inventario(ID_Almacen,UPC_Producto,[Stock Producto])
		values(@IDCEDIS,@UPC,@cantidad)
		print 'Se agregó el producto al inventario del CEDIS con ID: '+@IDCEDIS
		return;
	end
update Inventario set [Stock Producto]=([Stock Producto]-@cantidad) where @UPC=UPC_Producto and @IDCEDIS=ID_Almacen
Go

----Validar la inserción de una Sucursal respecto al Almacen
Create Trigger ValidarSucursal
On Sucursal instead of insert
as
	if exists (select*from Almacen a inner join CEDIS c on c.ID_Almacen=a.ID where c.ID_Almacen=(select id from inserted))
	begin
		raiserror('Este almacen ya existe en la tabla de CEDIS',16,1)
		return
	end---Por terminar
Go

drop trigger ValidarSucursal

----Validar la inserción de un CEDIS respecto al Almacen
Create Trigger ValidarCEDIS
On CEDIS instead of insert
as
	if exists (select*from Almacen a inner join Sucursal s on s.ID_Almacen=a.ID where s.ID_Almacen=(select id from inserted))
	begin
		raiserror('Este almacen ya existe en la tabla de Sucursales',16,1)
		return
	end
Go

drop trigger ValidarCEDIS

Create Trigger InventarioTransferido
On TransferenciaInventario after insert
as
	declare @Almacen_Envio smallint
	declare @Almacen_Recibe smallint

	select @Almacen_Envio=ID_AlmacenEnvío,@Almacen_Recibe=ID_AlmacenRecibe from inserted

	if @Almacen_Envio in (select ID_Almacen from Sucursal where ID_Almacen=@Almacen_Envio )
	begin
		if @Almacen_Recibe not in(select ID_Almacen from CEDIS where )
	end
			
Go



drop trigger VentaAlmacen
drop trigger CompraAlmacen
select (@@IDENTITY+1) from Inventario_Producto
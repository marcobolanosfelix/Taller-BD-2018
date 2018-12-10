use [Gallo Giro]
Go
---6to Paso: Triggers
Go
---Evaluar que los precios de los productos implicados en las ventas cumplan con los requerimientos establecidos
Create Trigger Precios_Venta
On Detalleventa after insert
as
	declare @Folio smallint
	declare @UPC bigint 
	declare @Fecha date
	declare @Cantidad smallint
	declare @PrecioActualizar money
	declare @Hora time

	select @Folio=Folio_Venta,@UPC=UPC_Producto,@Fecha=Fecha,@Cantidad=Cantidad,@Hora=v.Hora from inserted i inner join Venta v on v.Folio=i.Folio_Venta 
	begin try
	  	exec @PrecioActualizar=Asignar_Precio @Folio,@Fecha,@Hora,@UPC,'True'
		exec Precios_Venta_Compra @Cantidad,@UPC,@Folio,@PrecioActualizar,'False'
	end try
	begin catch
	   throw;
	   rollback 
	   return
	end catch
Go

---Actualizar el stock del inventario al momento de una venta
Create Trigger Venta_Almacen
On DetalleVenta after insert
as
	declare @cantidad smallint
	declare @UPC bigint
	declare @IDSucursal smallint
	declare @TipoEntrega varchar(50)
	declare @MensajeError NVARCHAR(2048)
	declare @Severidad INT
	declare @EstadoError INT
	 
 select @cantidad=Cantidad,@UPC=UPC_Producto,@IDSucursal=ID_Sucursal,@TipoEntrega=t.Nombre from inserted i inner join Venta v on v.Folio=i.Folio_Venta 
 inner join TipoEntrega t on t.ID=v.ID_Entrega

		if(@TipoEntrega='En CEDIS')
		begin
		declare @flag bit
		exec @flag= Peligrosidad_Validación @UPC

			if ((select [Stock Producto]-@cantidad from Inventario where ID_Almacen=@IDSucursal and UPC_Producto=@UPC)<0 and @flag='False')
			raiserror('Puedes recoger el producto en tienda, gracias por su compresión',10,1)
			rollback
			return
		end

		if(@TipoEntrega ='A Domicilio')
		begin
			if not exists(select*from Inventario where @IDSucursal=ID_Almacen and @UPC=UPC_Producto) or (select [Stock Producto]-@cantidad from Inventario where @IDSucursal=ID_Almacen and @UPC=UPC_Producto)<0
			begin
				declare @cantTemp smallint

				set @cantTemp=@cantidad
				set @cantidad=(select [Stock Producto] from Inventario where @IDSucursal=ID_Almacen and @UPC=UPC_Producto)

							begin try
							exec Actualizar_Inventario'False',@IDSucursal,@UPC,@cantidad
							end try
							begin catch 
							   select 
									@MensajeError=ERROR_MESSAGE(),
									@Severidad=ERROR_SEVERITY(),
									@EstadoError=ERROR_STATE()

								raiserror(@MensajeError,@Severidad,@EstadoError)
								rollback
								return
							end catch

				set	@IDSucursal=(select ID_CEDIS from Sucursal where ID_Almacen=@IDSucursal)
				set @cantidad=@cantTemp-@cantidad
			end
		end

				begin try
				   exec Actualizar_Inventario'False',@IDSucursal,@UPC,@cantidad
				end try
				begin catch
					select 
						@MensajeError=ERROR_MESSAGE(),
						@Severidad=ERROR_SEVERITY(),
						@EstadoError=ERROR_STATE()

					raiserror(@MensajeError,@Severidad,@EstadoError)
					rollback
					return
				end catch
Go

---Evaluar que los precios de los productos implicados en las compras cumplan con los requerimientos establecidos
Create Trigger Precios_Compra
On CompraProducto after insert
as
	declare @Folio smallint
	declare @UPC bigint 
	declare @Fecha date
	declare @Hora time
	declare @Cantidad smallint
	declare @PrecioActualizar money

	select @Folio=Folio_Compra,@UPC=UPC_Producto,@Fecha=FechaCompra,@Cantidad=Cantidad,@Hora=c.HoraCompra from inserted i inner join Compra c on c.Folio=i.Folio_Compra 
	begin try
	  exec @PrecioActualizar=Asignar_Precio @Folio,@Fecha,@Hora,@UPC,'False'
	end try
	begin catch
	   throw;
	   rollback 
	   return
	end catch

	exec Precios_Venta_Compra @Cantidad,@UPC,@Folio,@PrecioActualizar,'True'
Go

---Actualizar el stock del inventario al momento de una compra
Create Trigger CompraAlmacen
On CompraProducto after insert 
as
	declare @cantidad smallint
	declare @UPC bigint
	declare @IDCEDIS smallint

 select @cantidad=Cantidad,@UPC=UPC_Producto,@IDCEDIS=ID_CEDIS from Inserted i inner join Compra c on c.Folio=i.Folio_Compra

exec Actualizar_Inventario 'True',@iDCEDIS,@UPC,@cantidad
Go

----Validar la inserción de un CEDIS respecto al Almacen
Create Trigger ValidarCEDIS
On CEDIS after insert
as
	declare @ID_Almacen smallint

 select @ID_Almacen=id_almacen from inserted

	if exists (select*from Almacen a inner join Sucursal s on s.ID_Almacen=a.ID where s.ID_Almacen=(@ID_Almacen))
	begin
		raiserror('Este almacen ya existe en la tabla de Sucursales',16,1)
		rollback tran
		return
	end
Go
----Validar la inserción de una Sucursal respecto al Almacen
Create Trigger ValidarSucursal
On Sucursal after insert
as
	declare @ID_Almacen smallint
	
select @ID_Almacen=id_almacen from inserted

	if exists (select*from Almacen a inner join CEDIS c on c.ID_Almacen=a.ID where c.ID_Almacen=(select @ID_Almacen))
	begin
		raiserror('Este almacen ya existe en la tabla de CEDIS',16,1)
		rollback tran
		return
	end
Go

---Validando los ID de los Almacenes Envío-Recibe *PENDIENTE

Create Trigger Inventario_Transferido
On TransferenciaInventario after insert
as
	declare @Almacen_Envio smallint
	declare @Almacen_Recibe smallint

	select @Almacen_Envio=ID_AlmacenEnvío,@Almacen_Recibe=ID_AlmacenRecibe from inserted

	if @Almacen_Envio in (select ID_Almacen from Sucursal where ID_Almacen=@Almacen_Envio )---Validamos que el almacen que realiza la transferencia sea una sucursal
	 begin
		if @Almacen_Recibe in (select ID_Almacen from Sucursal)
		begin
			raiserror('No se puede realizar una transferencia de inventario de una sucursal a otra',16,1)
			rollback
			return
		end

		if @Almacen_Recibe not in(select ID_CEDIS from sucursal where @Almacen_Recibe=ID_CEDIS and ID_Almacen=@Almacen_Envio)
		begin
			raiserror('No se puede realizar una transferencia de inventario de una sucursal a un CEDIS que no le corresponde',16,1)
			rollback
			return
		end
	 end

	else----Si el almacen que realiza el envío no es una sucursal, se entiende que se trata de un CEDIS
	 begin
		if @Almacen_Recibe in (select ID_Almacen from Sucursal)
		begin
			if not exists(select*from Sucursal where ID_CEDIS=@Almacen_Envio and ID_Almacen=@Almacen_Recibe)
			begin
				raiserror('Este CEDIS no puede realizar una transferencia a una sucursal a la que no ha sido asignado',16,1)
				rollback
				return
			end
		end
	 end
Go

---Validar los procesos desarrollados en una transferencia de producto
Create Trigger ValidarTransferenciaProducto
On TransferenciaProducto after insert 
as
	declare @UPC bigint
	declare @Cantidad smallint
	declare @IDRecibe smallint
	declare @IDEnvía smallint

	select @UPC=i.[UPC-Producto],@Cantidad=i.Cantidad,@IDRecibe=t.ID_AlmacenRecibe,@IDEnvía=t.ID_AlmacenEnvío from inserted i 
	inner join TransferenciaInventario t on t.ID=i.ID_TransferenciaInventario

	if @IDRecibe in(select ID_Almacen from Sucursal)
	begin  
		declare @flag bit
		exec @flag= Peligrosidad_Validación @UPC
		if(@flag='True')
			begin 
			raiserror('Es muy peligroso que este producto permanezca en una sucursal',16,1)
			rollback tran
			return
			end

		begin try
			exec Actualizar_Inventario 'False',@IDEnvía,@UPC,@Cantidad
			exec Actualizar_Inventario 'True',@IDRecibe,@UPC,@Cantidad
		end try
		begin catch
		declare 
		 @MensajeError NVARCHAR(2048),
		 @Severidad INT,
		 @EstadoError INT

		 select 
		 @MensajeError=ERROR_MESSAGE(),
		 @Severidad=ERROR_SEVERITY(),
		 @EstadoError=ERROR_STATE()

		raiserror(@MensajeError,@Severidad,@EstadoError)
		rollback
		end catch
	
	end
Go
---Validar las operaciones realizadas dentro de la tabla de inventarios
Create Trigger Inventario_Validaciones
on Inventario for insert, update
as
	declare @Stock smallint
	declare @IDAlmacen smallint
	declare @UPC bigint

	select @Stock=[Stock Producto], @IDAlmacen=ID_Almacen,@UPC=UPC_Producto from inserted

	if(@Stock<0)
		begin
		raiserror('No se tiene suficiente stock en el inventario para satisfacer esta operación',10,1)
		rollback
		return
		end
Go

---Trigger que registre los cambios de precio de un producto
Create Trigger PrecioVenta
on Presentación after insert,update
as
	declare @UPC bigint
	declare @PrecioAntigüo money
	declare @PrecioInsertado money

	select @UPC=UPC,@PrecioInsertado=PrecioUnitarioActual from inserted

	if not exists (select*from Historico_Ventas where @UPC=UPC_Producto)
	begin
		insert into Historico_Ventas(UPC_Producto,Precio_Venta,Fecha_Actualización,Hora_Actualización)
		values(@UPC,@PrecioInsertado, (select format (convert(date,getdate()),'yyyy/MM/dd')), (select format(convert(time,getdate()),'hh\:mm\:ss')))
		return
	end	

	select @PrecioAntigüo=PrecioUnitarioActual from deleted

	if(@PrecioInsertado<>@PrecioAntigüo)
	begin
		insert into Historico_Ventas(UPC_Producto,Precio_Venta,Fecha_Actualización,Hora_Actualización)
		values(@UPC,@PrecioInsertado, (select format(convert(date,getdate()),'yyyy/MM/dd')), (select format(convert(time,getdate()),'hh\:mm\:ss')))
		return 
	end
	
Go

SELECT
    Object_name(so .parent_object_id) Parent_Name,
    so .name ObjectName,
    so .type_desc [Type Description],
    so .create_date [Create Date],
    sm.definition [Text]
FROM   sys .objects so
INNER JOIN sys. sql_modules sm
ON so.object_id = sm.object_id
WHERE  so .type = 'TR' 

Use [Gallo Giro]
Go
---4to Paso: Restricciones(Unique, Check)
ALTER TABLE [Presentación] 
 ADD CONSTRAINT [CK_UPC] CHECK (UPC<10000000000000)
Go

Alter table [Actividad] 
	add constraint [CK_Actividad_Nombre] unique(Nombre)
Go

Alter table [TipoCliente]
	add constraint [CK_TipoCliente_Nombre] check (Tipo IN ('Domestico','Agricultor'))
Go

Alter table [Compra]
	add constraint [CK_Compra_Hora] check (datepart(hour,HoraCompra)>=6 and datepart(hour,HoraCompra)<21)
Go

Alter table [CompraProducto]
	add constraint [UQ_Compra_Producto] unique([Folio_Compra],[UPC_Producto])
Go

ALTER TABLE [DetalleVenta]
	add constraint [UQ_Venta_Producto] unique([Folio_Venta],[UPC_Producto])
Go

ALTER TABLE [DetalleVenta]
	add constraint [CK_Validar_Cantidad] check(Cantidad>0)
Go

ALTER TABLE [Historico_Ventas]
	ADD CONSTRAINT [CK_Precio_Fecha] check(Fecha_Actualización>='04-02-2017')
Go

ALTER TABLE [Historico_Ventas]
	ADD CONSTRAINT [UQ_Actualización_Precio] unique(Precio_Venta,UPC_Producto)
Go

Alter table [TipoPago]
	add constraint [CK_Tipo_Pago] check (Tipo IN ('Efectivo', 'Tarjeta de Crédito','Cheque Bancario'))
Go

Alter table [TipoPago]
	add constraint [UQ_Tipo_Nombre] unique(Tipo)
Go

Alter table [TransferenciaInventario]
	add constraint [CK_Transferencia_IDs] check ([ID_AlmacenEnvío]<>[ID_AlmacenRecibe])
Go

ALTER TABLE [TransferenciaInventario]
	ADD CONSTRAINT [UQ_Transferencia] unique([Fecha],[ID_AlmacenEnvío],[ID_AlmacenRecibe])
Go

ALTER TABLE [TransferenciaProducto]
	ADD CONSTRAINT [UQ_Transferencia_Producto] unique([UPC-Producto],[ID_TransferenciaInventario])
Go

ALTER TABLE [Saldo]
	ADD CONSTRAINT [UQ_Saldo_Cliente] unique ([ID_Cliente])
Go

Alter table [Venta]
	add constraint [UQ_Venta_Cliente] unique ([ID_Cliente],[Fecha],[Hora])
Go

Alter table [Venta]
	add constraint [UQ_Venta_Sucursal] unique ([ID_Sucursal],[Fecha],[Hora])
Go

Alter table [Venta]
	add constraint [CK_Venta_Hora] check (datepart(hour,Hora)>=6 and datepart(hour,Hora)<21)
Go

Alter table Dimensión
	add constraint [CK_Dimensión,UnidaddeMedida] check (Unidad_de_Medida IN ('L','g','Kg','Lb','gal','ml'))
Go
ALTER TABLE [Cliente] 
 ADD CONSTRAINT [UQ_RFC] UNIQUE NONCLUSTERED ([RFC])
Go

ALTER TABLE [Cliente] 
 ADD CONSTRAINT [CK_RFC] check (len(RFC)>10 and len(RFC)<14)
Go

ALTER TABLE Ciudad
ADD CONSTRAINT UQ_Nombre_Ciudad unique(Nombre)
Go

ALTER TABLE Componente_Activo 
 ADD CONSTRAINT [UQ_Componente_Nombre] UNIQUE(Nombre)
 Go

 ALTER TABLE [Dirección]
 ADD CONSTRAINT [UQ_Dirección] UNIQUE(Calle,ID_Ciudad,Número)
 Go

ALTER TABLE [Almacen] 
 ADD CONSTRAINT [UQ_Dirección_Almacen] UNIQUE NONCLUSTERED ([id_Dirección])
Go

ALTER TABLE [Familia]
 ADD CONSTRAINT [UQ_Nombre_Familia] unique ([Nombre])
 Go

--Alter table Colonia 
	--add constraint [UQ_Colonia_Ciudad] unique(ID_Ciudad,Nombre)
--Go

ALTER TABLE [Etiqueta_Peligro] 
 ADD CONSTRAINT [UQ_Simbolo_Peligro] UNIQUE NONCLUSTERED ([Simbolo])
Go

--ALTER TABLE [FraseR] 
 --ADD CONSTRAINT [UQ_Frase] UNIQUE NONCLUSTERED ([Frase])
--Go

ALTER TABLE [TipoEntrega]
	ADD CONSTRAINT [CK_TipoEntrega_Tipo] check(Nombre IN ('A Domicilio','En CEDIS','En Sucursal'))
Go

ALTER TABLE [TipoEntrega]
	ADD CONSTRAINT [UQ_TipoEntrega_Nombre] unique ([Nombre])
Go

ALTER TABLE [Producto] 
 ADD CONSTRAINT [UQ_Nombre_Producto] UNIQUE NONCLUSTERED ([Nombre])
Go

Alter table [Sucursal]
 add constraint [CK_CEDIS_Almacen] check(ID_CEDIS!=ID_Almacen)
Go

ALTER TABLE [Proveedor]
 ADD CONSTRAINT [UQ_Proveedor_Email] unique([E-mail])
Go

ALTER TABLE [Proveedor]
 ADD CONSTRAINT [UQ_Proveedor_RFC] unique([RFC])
Go

ALTER TABLE [Region] 
ADD CONSTRAINT [UQ_Nombre_Región] unique([Nombre])
Go
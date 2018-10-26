Use [Gallo Giro]
Go
---2do Paso: Creación de PK
ALTER TABLE [Almacen] 
 ADD CONSTRAINT [PK_Almacen]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [Actividad]
ADD CONSTRAINT [PK_Actividad]
	PRIMARY KEY(ID)
Go

ALTER TABLE [Actividad_Agricultor]
ADD CONSTRAINT [PK_Agricultor]
	PRIMARY KEY(ID_Actividad, ID_Agricultor)
Go

ALTER TABLE [Calle] 
 ADD CONSTRAINT [PK_Calle]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [CEDIS] 
 ADD CONSTRAINT [PK_CEDIS]
	PRIMARY KEY CLUSTERED ([id_Almacen])
Go

ALTER TABLE [Ciudad] 
 ADD CONSTRAINT [PK_Ciudad]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [Cliente] 
 ADD CONSTRAINT [PK_ Cliente]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [Colonia] 
 ADD CONSTRAINT [PK_Colonia]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [Componente_Activo] 
 ADD CONSTRAINT [PK_Componente_Activo]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [CompraProducto] 
 ADD CONSTRAINT [PK_CompraProducto]
	PRIMARY KEY CLUSTERED ([Folio])
Go
ALTER TABLE [DetalleVenta] 
 ADD CONSTRAINT [PK_DetalleVenta]
	PRIMARY KEY CLUSTERED ([Folio_Venta],[UPC_Producto])
Go

ALTER TABLE [Dimensión] 
 ADD CONSTRAINT [PK_Dimensión]
	PRIMARY KEY CLUSTERED ([id])
Go
ALTER TABLE [Dirección] 
 ADD CONSTRAINT [PK_Dirección]
	PRIMARY KEY CLUSTERED ([id])
Go
ALTER TABLE [Etiqueta_Peligro] 
 ADD CONSTRAINT [PK_Etiqueta_Peligro]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [Familia ] 
 ADD CONSTRAINT [PK_Familia]
	PRIMARY KEY CLUSTERED ([id])
Go
ALTER TABLE [FraseR]
 ADD CONSTRAINT[PK_Frase]
	PRIMARY KEY ([ID])
GO

--ALTER TABLE [Inventario] 
 --ADD CONSTRAINT [PK_Inventario]
	--PRIMARY KEY CLUSTERED ([id])
--Go

ALTER TABLE [Pago] 
 ADD CONSTRAINT [PK_Pago]
	PRIMARY KEY CLUSTERED ([ID])
Go
ALTER TABLE [Peligrosidad_Etiqueta] 
 ADD CONSTRAINT [PK_Peligrosidad]
	PRIMARY KEY CLUSTERED ([id_Etiqueta],[ID_Producto])
Go
ALTER TABLE [FraseR_Producto] 
 ADD CONSTRAINT [PK_Peligrosidad_Producto]
	PRIMARY KEY CLUSTERED ([ID_Producto],[ID_Frase])
Go
ALTER TABLE [Producto] 
 ADD CONSTRAINT [PK_Producto]
	PRIMARY KEY CLUSTERED ([ID])
Go
ALTER TABLE [Proveedor] 
 ADD CONSTRAINT [PK_Proveedor]
	PRIMARY KEY CLUSTERED ([ID])
Go
ALTER TABLE [Sucursal] 
 ADD CONSTRAINT [PK_Sucursal]
	PRIMARY KEY CLUSTERED ([id_Almacen])
Go
ALTER TABLE [TipoCliente] 
 ADD CONSTRAINT [PK_TipoCliente]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [TipoEntrega] 
 ADD CONSTRAINT [PK_TipoEntrega]
	PRIMARY KEY CLUSTERED ([id])
Go

ALTER TABLE [TipoPago] 
 ADD CONSTRAINT [PK_TipoPago]
	PRIMARY KEY CLUSTERED ([ID])
Go
ALTER TABLE [TransferenciaInventario] 
 ADD CONSTRAINT [PK_TransferenciaInventario]
	PRIMARY KEY CLUSTERED ([id])
Go
ALTER TABLE [TransferenciaProducto] 
 ADD CONSTRAINT [PK_TransferenciaProducto]
	PRIMARY KEY CLUSTERED ([id_TransferenciaInventario],[UPC-Producto])
Go

ALTER TABLE [Venta] 
 ADD CONSTRAINT [PK_Venta]
	PRIMARY KEY CLUSTERED ([Folio])
Go

ALTER TABLE [Presentación]
 ADD CONSTRAINT [PK_Presentación]
	PRIMARY KEY ([UPC])
Go

---3er Paso: Creación de FK
ALTER TABLE [Actividad_Agricultor] ADD CONSTRAINT [FK_Actividad_Agricultor_Act]
	FOREIGN KEY([ID_Actividad]) REFERENCES [Actividad] ([ID])
Go

ALTER TABLE [Actividad_Agricultor] ADD CONSTRAINT [FK_Actividad_Agricultor_Ag]
	FOREIGN KEY([ID_Agricultor]) REFERENCES [Cliente] ([ID])
Go

ALTER TABLE [Cliente] ADD CONSTRAINT [FK_Cliente_Dirección]
	FOREIGN KEY ([id_Dirección]) REFERENCES [Dirección] ([id]) 
	Go

ALTER TABLE [Cliente] ADD CONSTRAINT [FK_ Cliente_TipoCliente]
	FOREIGN KEY ([id_Tipo]) REFERENCES [TipoCliente] ([id]) 
	Go

ALTER TABLE [Almacen] ADD CONSTRAINT [FK_Almacen_Dirección]
	FOREIGN KEY ([id_Dirección]) REFERENCES [Dirección] ([id])
    Go

ALTER TABLE [Calle] ADD CONSTRAINT [FK_Calle_Ciudad]
	FOREIGN KEY ([id_Ciudad]) REFERENCES [Ciudad] ([id]) 
	Go

ALTER TABLE [CEDIS] ADD CONSTRAINT [FK_CEDIS_Almacen]
	FOREIGN KEY ([id_Almacen]) REFERENCES [Almacen] ([id]) 
	Go

ALTER TABLE [Colonia] ADD CONSTRAINT [FK_Colonia_Ciudad]
	FOREIGN KEY ([id_Ciudad]) REFERENCES [Ciudad] ([id]) 
	Go

ALTER TABLE [CompraProducto] ADD CONSTRAINT [FK_CompraProducto_CEDIS]
	FOREIGN KEY ([id_CEDIS]) REFERENCES [CEDIS] ([id_Almacen]) 
	Go

ALTER TABLE [CompraProducto] ADD CONSTRAINT [FK_CompraProducto_Producto]
	FOREIGN KEY ([UPC_Producto]) REFERENCES [Presentación] ([UPC]) 
	Go

ALTER TABLE [DetalleVenta] ADD CONSTRAINT [FK_DetalleVenta_Producto]
	FOREIGN KEY ([UPC_Producto]) REFERENCES [Presentación] ([UPC]) 
	Go

ALTER TABLE [DetalleVenta] ADD CONSTRAINT [FK_DetalleVenta_Venta]
	FOREIGN KEY ([Folio_Venta]) REFERENCES [Venta] ([Folio]) 
	Go

ALTER TABLE [Dirección] ADD CONSTRAINT [FK_Dirección_Ciudad]
	FOREIGN KEY ([id_Colonia]) REFERENCES [Colonia] ([id]) 
	Go
		
ALTER TABLE [Dirección] ADD CONSTRAINT [FK_Dirección_Colonia]
	FOREIGN KEY ([id_Colonia]) REFERENCES [Colonia] ([id]) 
	Go

--ALTER TABLE [Inventario] ADD CONSTRAINT [FK_Inventario_Almacen]
	--FOREIGN KEY ([ID_Almacen]) REFERENCES [Almacen] ([id]) 
	--Go

--ALTER TABLE [Inventario_Producto] add constraint [FK_Inventario_Producto_IDInventario]
	--FOREIGN KEY ([ID_Inventario]) REFERENCES [Inventario]([id])
	--Go

--ALTER TABLE [Inventario_Producto] ADD CONSTRAINT [FK_Inventario_Producto]
	--FOREIGN KEY ([UPC_Producto]) REFERENCES [Presentación] ([UPC]) 
	--Go

ALTER TABLE [Pago] ADD CONSTRAINT [FK_Pago_ Cliente]
	FOREIGN KEY ([ID_Cliente]) REFERENCES [Cliente] ([id]) 
	Go

ALTER TABLE [Pago] ADD CONSTRAINT [FK_Pago_TipoPago]
	FOREIGN KEY ([ID_TipoPAgo]) REFERENCES [TipoPago] ([ID]) 
	Go

ALTER TABLE [Peligrosidad_Etiqueta] ADD CONSTRAINT [FK_Peligrosidad_Etiqueta_Etiqueta_Peligro]
	FOREIGN KEY ([id_Etiqueta]) REFERENCES [Etiqueta_Peligro] ([id]) 
	Go

ALTER TABLE [Peligrosidad_Etiqueta] ADD CONSTRAINT [FK_Peligrosidad_Etiqueta_Peligrosidad_Producto]
	FOREIGN KEY ([id_Producto]) REFERENCES [Producto] ([id]) 
	Go

ALTER TABLE [FraseR_Producto] ADD CONSTRAINT [FK_Peligrosidad_Producto_FraseR]
	FOREIGN KEY ([id_Frase]) REFERENCES [FraseR] ([ID]) 
	Go

ALTER TABLE [FraseR_Producto] ADD CONSTRAINT [FK_Peligrosidad_Producto_Producto]
	FOREIGN KEY ([ID_Producto]) REFERENCES [Producto] ([ID]) 
	Go

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Componente_Activo]
	FOREIGN KEY ([id_ComponenteActivo]) REFERENCES [Componente_Activo] ([id]) 
	Go

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Familia ]
	FOREIGN KEY ([id_Familia]) REFERENCES [Familia ] ([id]) 
	Go

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Proveedor]
	FOREIGN KEY ([ID_Proveedor]) REFERENCES [Proveedor] ([ID]) 
	Go

ALTER TABLE [Presentación] ADD CONSTRAINT [FK_Dimensión_Producto]
	FOREIGN KEY (ID_Dimensión) REFERENCES [Dimensión](ID)
	Go

ALTER TABLE [Presentación] ADD CONSTRAINT [FK_Producto_Dimensión]
	FOREIGN KEY (ID_Base) REFERENCES [Producto](ID)
	Go

ALTER TABLE [Sucursal] ADD CONSTRAINT [FK_Sucursal_Almacen]
	FOREIGN KEY ([id_Almacen]) REFERENCES [Almacen] ([id]) 
	Go

ALTER TABLE [Sucursal] ADD CONSTRAINT [FK_Sucursal_CEDIS]
	FOREIGN KEY ([id_CEDIS]) REFERENCES [CEDIS] ([id_Almacen]) 
	Go

ALTER TABLE [TransferenciaInventario] ADD CONSTRAINT [FK_TransferenciaInventario_Almacen]
	FOREIGN KEY ([id_AlmacenEnvío]) REFERENCES [Almacen] ([id]) 
	Go

ALTER TABLE [TransferenciaInventario] ADD CONSTRAINT [FK_TransferenciaInventario_Almacen_03]
	FOREIGN KEY ([id_AlmacenRecibe]) REFERENCES [Almacen] ([id]) 
	Go

ALTER TABLE [TransferenciaProducto] ADD CONSTRAINT [FK_TransferenciaProducto_Producto]
	FOREIGN KEY ([UPC-Producto]) REFERENCES [Presentación] ([UPC]) 
	Go

ALTER TABLE [TransferenciaProducto] ADD CONSTRAINT [FK_TransferenciaProducto_TransferenciaInventario]
	FOREIGN KEY ([id_TransferenciaInventario]) REFERENCES [TransferenciaInventario] ([id]) 
	Go

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_ Cliente]
	FOREIGN KEY ([id_Cliente]) REFERENCES [Cliente] ([id]) 
	Go

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_TipoEntrega]
	FOREIGN KEY ([id_TipoEntrega]) REFERENCES [TipoEntrega] ([id]) 
	Go
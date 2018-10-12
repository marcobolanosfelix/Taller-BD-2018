
CREATE TABLE [ Cliente]
(
	[RFC] varchar(10) NOT NULL,
	[id_Tipo] tinyint NOT NULL,
	[Nombre] varchar(15) NOT NULL,
	[ApellidoPaterno] varchar(15) NOT NULL,
	[ApellidoMaterno] varchar(15) NOT NULL,
	[id_Dirección] smallint NOT NULL,
	[id] smallint NOT NULL
)
;

CREATE TABLE [Almacen]
(
	[id_Dirección] smallint NOT NULL,
	[id] smallint NOT NULL IDENTITY (1, 1)
)
;

CREATE TABLE [Calle]
(
	[id_Colonia] int NOT NULL,
	[id] int NOT NULL,
	[Nombre] varchar(30) NOT NULL
)
;

CREATE TABLE [CEDIS]
(
	[id_Almacen] smallint NOT NULL,
	[Capacidad_(palets/nivel)] smallint NOT NULL
)
;

CREATE TABLE [Ciudad]
(
	[Nombre] varchar(30) NOT NULL,
	[id] int NOT NULL IDENTITY (1, 1)
)
;

CREATE TABLE [Colonia]
(
	[id] int NOT NULL,
	[CP] int NOT NULL,
	[Nombre] varchar(40) NOT NULL,
	[id_Ciudad] int NOT NULL
)
;

CREATE TABLE [Componente_Activo]
(
	[Nombre] varchar(30) NOT NULL,
	[id] smallint NOT NULL,
	[Fórmula_Química] varchar(50) NOT NULL
)
;

CREATE TABLE [CompraProducto]
(
	[id_CEDIS] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[FechaCompra] date,
	[Folio] varchar(4) NOT NULL,
	[PrecioUnitario] money NOT NULL
)
;

CREATE TABLE [DetalleVenta]
(
	[Folio_Venta] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[PrecioUnitarioProducto] money NOT NULL
)
;

CREATE TABLE [Dimensión]
(
	[Cantidad] smallint NOT NULL,
	[Unidad_de_Medida] varchar(40) NOT NULL,
	[id] smallint NOT NULL
)
;

CREATE TABLE [Dirección]
(
	[Dirección] varchar(50),
	[id_Calle] int NOT NULL,
	[Número] smallint NOT NULL,
	[id] smallint NOT NULL IDENTITY (1, 1)
)
;

CREATE TABLE [Etiqueta_Peligro]
(
	[Nombre_Peligro] varchar(50) NOT NULL,
	[id] tinyint NOT NULL IDENTITY (1, 1),
	[Simbolo] char(1)
)
;

CREATE TABLE [Familia ]
(
	[Nombre] varchar(30) NOT NULL,
	[id] smallint NOT NULL,
	[Descripción] varchar(50) NOT NULL
)
;

CREATE TABLE [FraseR]
(
	[Frase] varchar(3) NOT NULL,
	[id] tinyint IDENTITY (1, 1)
)
;

CREATE TABLE [Inventario]
(
	[UPC_Producto] bigint NOT NULL,
	[id_Almacen] smallint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[FechaInventario] date NOT NULL,
	[id] smallint NOT NULL IDENTITY (1, 1)
)
;

CREATE TABLE [Pago]
(
	[ID_Cliente] smallint NOT NULL,
	[ID_TipoPAgo] tinyint NOT NULL,
	[Monto] money NOT NULL,
	[FechaPago] date NOT NULL,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
;

CREATE TABLE [Peligrosidad_Etiqueta]
(
	[id_Etiqueta] tinyint NOT NULL,
	[id_Peligrosidad] tinyint NOT NULL
)
;

CREATE TABLE [Peligrosidad_Producto]
(
	[UPC_Producto] bigint NOT NULL,
	[id_Frase] tinyint NOT NULL,
	[id] tinyint NOT NULL
)
;

CREATE TABLE [Producto]
(
	[Punto_de_reorden] smallint NOT NULL,
	[Nombre] varchar(40) NOT NULL,
	[PrecioUnitarioActual] money NOT NULL,
	[UPC] bigint NOT NULL,
	[FechaVencimiento] date NOT NULL,
	[id_Dimensión] smallint NOT NULL,
	[id_ComponenteActivo] smallint,
	[id_Familia] smallint NOT NULL,
	[Volumen(m3)] smallint,
	[RFC_Proveedor] varchar(10) NOT NULL
)
;

CREATE TABLE [Proveedor]
(
	[Nombre] varchar(30) NOT NULL,
	[RFC] varchar(10) NOT NULL,
	[E-Mail] varchar(50) NOT NULL
)
;

CREATE TABLE [Sucursal]
(
	[id_CEDIS] smallint NOT NULL,
	[id_Almacen] smallint NOT NULL
)
;

CREATE TABLE [TipoCliente]
(
	[id] tinyint NOT NULL,
	[Tipo] varchar(25) NOT NULL,
	[Descripción] varchar(50) NOT NULL
)
;

CREATE TABLE [TipoEntrega]
(
	[Nombre] varchar(25) NOT NULL,
	[Descripción] varchar(50) NOT NULL,
	[id] tinyint NOT NULL IDENTITY (1, 1)
)
;

CREATE TABLE [TipoPago]
(
	[ID] tinyint NOT NULL IDENTITY (1, 1),
	[Tipo] varchar(20) NOT NULL,
	[Descripción] varchar(55) NOT NULL
)
;

CREATE TABLE [TransferenciaInventario]
(
	[id_AlmacenEnvío] smallint NOT NULL,
	[id_AlmacenRecibe] smallint NOT NULL,
	[Fecha] date NOT NULL,
	[Folio] varchar(5) NOT NULL,
	[id] smallint NOT NULL
)
;

CREATE TABLE [TransferenciaProducto]
(
	[UPC-Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[id_TransferenciaInventario] smallint NOT NULL
)
;

CREATE TABLE [Venta]
(
	[id_Cliente] smallint NOT NULL,
	[id_Sucursal] smallint NOT NULL,
	[Folio] smallint NOT NULL,
	[Fecha] date NOT NULL,
	[Hora] time(7),
	[id_TipoEntrega] tinyint NOT NULL,
	[Estatus] varchar(30) NOT NULL
)
;

CREATE INDEX [IXFK_ Cliente_Dirección] 
 ON [ Cliente] ([id_Dirección] ASC)
;

CREATE INDEX [IXFK_ Cliente_TipoCliente] 
 ON [ Cliente] ([id_Tipo] ASC)
;

ALTER TABLE [ Cliente] 
 ADD CONSTRAINT [UQ_RFC] UNIQUE NONCLUSTERED ([RFC])
;

CREATE INDEX [IXFK_Almacen_Dirección] 
 ON [Almacen] ([id_Dirección] ASC)
;

ALTER TABLE [Almacen] 
 ADD CONSTRAINT [UQ_Dirección] UNIQUE NONCLUSTERED ([id_Dirección])
;

CREATE INDEX [IXFK_Calle_Colonia] 
 ON [Calle] ([id_Colonia] ASC)
;

ALTER TABLE [Calle] 
 ADD CONSTRAINT [UQ_Nombre] UNIQUE NONCLUSTERED ([Nombre])
;

CREATE INDEX [IXFK_CEDIS_Almacen] 
 ON [CEDIS] ([id_Almacen] ASC)
;

CREATE INDEX [IXFK_Colonia_Ciudad] 
 ON [Colonia] ([id_Ciudad] ASC)
;

CREATE INDEX [IXFK_CompraProducto_CEDIS] 
 ON [CompraProducto] ([id_CEDIS] ASC)
;

CREATE INDEX [IXFK_CompraProducto_Producto] 
 ON [CompraProducto] ([UPC_Producto] ASC)
;

CREATE INDEX [IXFK_DetalleVenta_Producto] 
 ON [DetalleVenta] ([UPC_Producto] ASC)
;

CREATE INDEX [IXFK_DetalleVenta_Venta] 
 ON [DetalleVenta] ([Folio_Venta] ASC)
;

ALTER TABLE [Dimensión] 
 ADD CONSTRAINT [UQ_Unidad_de_Medida] UNIQUE NONCLUSTERED ([Unidad_de_Medida])
;

CREATE INDEX [IXFK_Dirección_Calle] 
 ON [Dirección] ([id_Calle] ASC)
;

CREATE INDEX [IXFK_Dirección_Calle_02] 
 ON [Dirección] ([id_Calle] ASC)
;

ALTER TABLE [Dirección] 
 ADD CONSTRAINT [UQ_Dirección_Calle] UNIQUE NONCLUSTERED ([id_Calle])
;


ALTER TABLE [Etiqueta_Peligro] 
 ADD CONSTRAINT [UQ_Nombre] UNIQUE NONCLUSTERED ([Nombre_Peligro])
;


ALTER TABLE [FraseR] 
 ADD CONSTRAINT [UQ_Frase] UNIQUE NONCLUSTERED ([Frase])
;

CREATE INDEX [IXFK_Inventario_Almacen] 
 ON [Inventario] ([id_Almacen] ASC)
;

CREATE INDEX [IXFK_Inventario_Producto] 
 ON [Inventario] ([UPC_Producto] ASC)
;

CREATE INDEX [IXFK_Pago_ Cliente] 
 ON [Pago] ([ID_Cliente] ASC)
;

CREATE INDEX [IXFK_Pago_TipoPago] 
 ON [Pago] ([ID_TipoPAgo] ASC)
;

CREATE INDEX [IXFK_Peligrosidad_Etiqueta_Etiqueta_Peligro] 
 ON [Peligrosidad_Etiqueta] ([id_Etiqueta] ASC)
;

CREATE INDEX [IXFK_Peligrosidad_Etiqueta_Peligrosidad_Producto] 
 ON [Peligrosidad_Etiqueta] ([id_Peligrosidad] ASC)
;

CREATE INDEX [IXFK_Peligrosidad_Producto_FraseR] 
 ON [Peligrosidad_Producto] ([id_Frase] ASC)
;

CREATE INDEX [IXFK_Peligrosidad_Producto_Producto] 
 ON [Peligrosidad_Producto] ([UPC_Producto] ASC)
;


CREATE INDEX [IXFK_Producto_Componente_Activo] 
 ON [Producto] ([id_ComponenteActivo] ASC)
;

CREATE INDEX [IXFK_Producto_Dimensión] 
 ON [Producto] ([id_Dimensión] ASC)
;

CREATE INDEX [IXFK_Producto_Familia ] 
 ON [Producto] ([id_Familia] ASC)
;

CREATE INDEX [IXFK_Producto_Proveedor] 
 ON [Producto] ([RFC_Proveedor] ASC)
;

ALTER TABLE [Producto] 
 ADD CONSTRAINT [CK_UPC] CHECK (UPC<10000000000000)
;

ALTER TABLE [Producto] 
 ADD CONSTRAINT [UQ_Nombre] UNIQUE NONCLUSTERED ([Nombre])
;

CREATE INDEX [IXFK_Sucursal_Almacen] 
 ON [Sucursal] ([id_Almacen] ASC)
;

CREATE INDEX [IXFK_Sucursal_CEDIS] 
 ON [Sucursal] ([id_CEDIS] ASC)
;

CREATE INDEX [IXFK_TransferenciaInventario_Almacen] 
 ON [TransferenciaInventario] ([id_AlmacenEnvío] ASC)
;

CREATE INDEX [IXFK_TransferenciaInventario_Almacen_02] 
 ON [TransferenciaInventario] ([id_AlmacenEnvío] ASC)
;

CREATE INDEX [IXFK_TransferenciaInventario_Almacen_03] 
 ON [TransferenciaInventario] ([id_AlmacenRecibe] ASC)
;

CREATE INDEX [IXFK_TransferenciaProducto_Producto] 
 ON [TransferenciaProducto] ([UPC-Producto] ASC)
;

CREATE INDEX [IXFK_TransferenciaProducto_TransferenciaInventario] 
 ON [TransferenciaProducto] ([id_TransferenciaInventario] ASC)
;

CREATE INDEX [IXFK_Venta_ Cliente] 
 ON [Venta] ([id_Cliente] ASC)
;

CREATE INDEX [IXFK_Venta_TipoEntrega] 
 ON [Venta] ([id_TipoEntrega] ASC)
;

ALTER TABLE [ Cliente] ADD CONSTRAINT [FK_ Cliente_Dirección]
	FOREIGN KEY ([id_Dirección]) REFERENCES [Dirección] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [ Cliente] ADD CONSTRAINT [FK_ Cliente_TipoCliente]
	FOREIGN KEY ([id_Tipo]) REFERENCES [TipoCliente] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Almacen] ADD CONSTRAINT [FK_Almacen_Dirección]
	FOREIGN KEY ([id_Dirección]) REFERENCES [Dirección] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Calle] ADD CONSTRAINT [FK_Calle_Colonia]
	FOREIGN KEY ([id_Colonia]) REFERENCES [Colonia] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [CEDIS] ADD CONSTRAINT [FK_CEDIS_Almacen]
	FOREIGN KEY ([id_Almacen]) REFERENCES [Almacen] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Colonia] ADD CONSTRAINT [FK_Colonia_Ciudad]
	FOREIGN KEY ([id_Ciudad]) REFERENCES [Ciudad] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [CompraProducto] ADD CONSTRAINT [FK_CompraProducto_CEDIS]
	FOREIGN KEY ([id_CEDIS]) REFERENCES [CEDIS] ([id_Almacen]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [CompraProducto] ADD CONSTRAINT [FK_CompraProducto_Producto]
	FOREIGN KEY ([UPC_Producto]) REFERENCES [Producto] ([UPC]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [DetalleVenta] ADD CONSTRAINT [FK_DetalleVenta_Producto]
	FOREIGN KEY ([UPC_Producto]) REFERENCES [Producto] ([UPC]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [DetalleVenta] ADD CONSTRAINT [FK_DetalleVenta_Venta]
	FOREIGN KEY ([Folio_Venta]) REFERENCES [Venta] ([Folio]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Dirección] ADD CONSTRAINT [FK_Dirección_Calle_02]
	FOREIGN KEY ([id_Calle]) REFERENCES [Calle] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Inventario] ADD CONSTRAINT [FK_Inventario_Almacen]
	FOREIGN KEY ([id_Almacen]) REFERENCES [Almacen] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Inventario] ADD CONSTRAINT [FK_Inventario_Producto]
	FOREIGN KEY ([UPC_Producto]) REFERENCES [Producto] ([UPC]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Pago] ADD CONSTRAINT [FK_Pago_ Cliente]
	FOREIGN KEY ([ID_Cliente]) REFERENCES [ Cliente] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Pago] ADD CONSTRAINT [FK_Pago_TipoPago]
	FOREIGN KEY ([ID_TipoPAgo]) REFERENCES [TipoPago] ([ID]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Peligrosidad_Etiqueta] ADD CONSTRAINT [FK_Peligrosidad_Etiqueta_Etiqueta_Peligro]
	FOREIGN KEY ([id_Etiqueta]) REFERENCES [Etiqueta_Peligro] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Peligrosidad_Etiqueta] ADD CONSTRAINT [FK_Peligrosidad_Etiqueta_Peligrosidad_Producto]
	FOREIGN KEY ([id_Peligrosidad]) REFERENCES [Peligrosidad_Producto] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Peligrosidad_Producto] ADD CONSTRAINT [FK_Peligrosidad_Producto_FraseR]
	FOREIGN KEY ([id_Frase]) REFERENCES [FraseR] ([Frase]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Peligrosidad_Producto] ADD CONSTRAINT [FK_Peligrosidad_Producto_Producto]
	FOREIGN KEY ([UPC_Producto]) REFERENCES [Producto] ([UPC]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Componente_Activo]
	FOREIGN KEY ([id_ComponenteActivo]) REFERENCES [Componente_Activo] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Dimensión]
	FOREIGN KEY ([id_Dimensión]) REFERENCES [Dimensión] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Familia ]
	FOREIGN KEY ([id_Familia]) REFERENCES [Familia ] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Producto] ADD CONSTRAINT [FK_Producto_Proveedor]
	FOREIGN KEY ([RFC_Proveedor]) REFERENCES [Proveedor] ([RFC]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Sucursal] ADD CONSTRAINT [FK_Sucursal_Almacen]
	FOREIGN KEY ([id_Almacen]) REFERENCES [Almacen] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Sucursal] ADD CONSTRAINT [FK_Sucursal_CEDIS]
	FOREIGN KEY ([id_CEDIS]) REFERENCES [CEDIS] ([id_Almacen]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [TransferenciaInventario] ADD CONSTRAINT [FK_TransferenciaInventario_Almacen]
	FOREIGN KEY ([id_AlmacenEnvío]) REFERENCES [Almacen] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [TransferenciaInventario] ADD CONSTRAINT [FK_TransferenciaInventario_Almacen_03]
	FOREIGN KEY ([id_AlmacenRecibe]) REFERENCES [Almacen] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [TransferenciaProducto] ADD CONSTRAINT [FK_TransferenciaProducto_Producto]
	FOREIGN KEY ([UPC-Producto]) REFERENCES [Producto] ([UPC]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [TransferenciaProducto] ADD CONSTRAINT [FK_TransferenciaProducto_TransferenciaInventario]
	FOREIGN KEY ([id_TransferenciaInventario]) REFERENCES [TransferenciaInventario] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_ Cliente]
	FOREIGN KEY ([id_Cliente]) REFERENCES [ Cliente] ([id]) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_TipoEntrega]
	FOREIGN KEY ([id_TipoEntrega]) REFERENCES [TipoEntrega] ([id]) ON DELETE No Action ON UPDATE No Action
;

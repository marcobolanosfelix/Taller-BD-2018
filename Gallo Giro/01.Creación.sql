Create database [Gallo Giro]
Go
Use [Gallo Giro]
Go
---1er Paso: Creación de las tablas
CREATE TABLE [Almacen]----Check
(
	[ID_Dirección] smallint NOT NULL,
	[ID] smallint NOT NULL IDENTITY (250, 4)
)
Go

CREATE TABLE [Actividad]----Check
(
ID tinyint not null identity(1,1),
Nombre varchar(35) not null
)
Go

CREATE TABLE [Actividad_Agricultor]----Check
(
ID_Actividad tinyint not null,
ID_Agricultor smallint not null
)
Go

CREATE TABLE [Cliente]----Faltan agregar algunos
(
	[RFC] varchar(13) NOT NULL,
	[ID_Tipo] tinyint NOT NULL,
	[Nombre] varchar(15) NOT NULL,
	[ApellIDoPaterno] varchar(15) NOT NULL,
	[ApellIDoMaterno] varchar(15) NULL,
	[ID_Dirección] smallint NOT NULL,
	[ID] smallint NOT NULL identity(100,4)
)
Go


CREATE TABLE [CEDIS]----Check
(
	[ID_Almacen] smallint NOT NULL,
	[Capacidad_(palets/nivel)] smallint NOT NULL default(320)
)
Go

CREATE TABLE [Ciudad]----Check
(
	[Nombre] varchar(30) NOT NULL,
	[ID] int NOT NULL IDENTITY (1, 1),
	[ID_Region] tinyint not null
)
Go

CREATE TABLE [Componente_Activo]----Check
(
	[Nombre] varchar(50) NOT NULL,
	[ID] smallint NOT NULL identity(1,1),
	[Fórmula_Química] varchar(50) null
)
Go


CREATE TABLE [Compra]------Check
(
	[ID_CEDIS] smallint NOT NULL,
	[FechaCompra] date not null,
	[HoraCompra] time not null,
	[Folio] smallint NOT NULL
)
Go

CREATE TABLE [CompraProducto]---Faltan agregar algunos
(
	[Folio_Compra] smallint not null,
	[UPC_Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[PrecioUnitario] money 
)
Go

CREATE TABLE [DetalleVenta]---Faltan agregar algunos
(
	[Folio_Venta] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[PrecioUnitarioProducto] money 
)
Go

CREATE TABLE [Dimensión]----Check
(
	[Cantidad] decimal(5,2) NOT NULL,
	[Unidad_de_Medida] varchar(40) NOT NULL,
	[ID] smallint NOT NULL
)
Go

CREATE TABLE [Dirección]----Check
(
	[CP] int null,
	--[ID_Calle] int NOT NULL,
	[Calle] varchar(50),
	[Número] smallint NULL,
	--[ID_Colonia] int not null,
	[ID_Ciudad] int not null,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [Etiqueta_Peligro]----Check
(
	[Nombre_Peligro] varchar(50) NOT NULL,
	[ID] tinyint NOT NULL IDENTITY (20, 3),
	[Simbolo] char(2) not null
)
Go

CREATE TABLE [Familia]----Check
(
	[Nombre] varchar(30) NOT NULL,
	[ID] smallint NOT NULL identity(30,3),
	[Descripción] varchar(120) NOT NULL
)
Go

CREATE TABLE [Historico_Ventas]----Pendiente
(
	[UPC_Producto] bigint NOT NULL,
	[Fecha_Actualización] date not null,
	[Hora_Actualización] time not null,
	[Precio_Venta] money not null,
	[ID] smallint identity(1,1)
)
Go

CREATE TABLE [Inventario]----¿Triggers?
( 
	[ID] smallint identity(1,1) not null,
	[UPC_Producto] bigint not NULL,
	[Stock Producto] smallint NOT NULL,
	[ID_Almacen] smallint not null
)
Go

CREATE TABLE [Pago]----Check
(
	[ID_Cliente] smallint NOT NULL,
	[ID_TipoPAgo] tinyint NOT NULL,
	[Monto] money NOT NULL,
	[Fecha] date NOT NULL,
	[Hora] time not null,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [Peligrosidad_Etiqueta]----Check
(
	[ID_Etiqueta] tinyint NOT NULL,
	[ID_Producto] smallint NOT NULL
)
Go

CREATE TABLE [Producto]----Check
(
	[Punto_de_reorden] smallint NOT NULL,
	[Nombre] varchar(40) NOT NULL,
	[ID_ComponenteActivo] smallint,
	[ID_Familia] smallint NOT NULL,
	[ID_Proveedor] tinyint NOT NULL,
	[ID] smallint not null identity(1,1)
)
Go

Create table [Presentación]---Pendiente
(
	[ID_Base] smallint not null,
	[ID_Dimensión] smallint not null,
	[Volumen(dm3)] smallint,
	[PrecioUnitarioActual] money NOT NULL,
	[UPC] bigint NOT NULL,
)
Go

CREATE TABLE [Proveedor]----Check
(
	[Nombre] varchar(30) NOT NULL,
	[RFC] varchar(13) NOT NULL,
	[E-Mail] varchar(50) NOT NULL,
	[ID] tinyint not null identity(1,1)
)
Go

CREATE TABLE [Region]----Check
(
	[Nombre] varchar(50) not null,
	[ID] tinyint not null identity(1,1)
)
Go

CREATE TABLE [Saldo]-----¿Triggers?
(
	[ID] smallint identity(1,1) not null,
	[ID_Cliente] smallint not null,
	[Saldo] money 

)
Go

CREATE TABLE [Sucursal]----Check
(
	[ID_CEDIS] smallint NOT NULL,
	[ID_Almacen] smallint NOT NULL
)
Go

CREATE TABLE [TipoCliente]----Check
(
	[ID] tinyint NOT NULL,
	[Tipo] varchar(25) NOT NULL,
	[Descripción] varchar(75) NOT NULL
)
Go

CREATE TABLE [TipoEntrega]----Check
(
	[Nombre] varchar(25) NOT NULL,
	[Descripción] varchar(120) NOT NULL,
	[ID] tinyint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [TipoPago]----Check
(
	[ID] tinyint NOT NULL IDENTITY (1, 1),
	[Tipo] varchar(20) NOT NULL,
	[Descripción] varchar(100) NOT NULL
)
Go

CREATE TABLE [TransferenciaInventario]-----¿Triggers?
(
	[ID_AlmacenEnvío] smallint NOT NULL,
	[ID_AlmacenRecibe] smallint NOT NULL,
	[Fecha] date NOT NULL,
	[ID] smallint NOT NULL
)
Go

CREATE TABLE [TransferenciaProducto]---¿Triggers?
(
	[UPC-Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[ID_TransferenciaInventario] smallint NOT NULL
)
Go

CREATE TABLE [Venta]----Faltan agregar algunos
(
	[ID_Cliente] smallint NOT NULL,
	[ID_Sucursal] smallint NOT NULL,
	[Folio] smallint NOT NULL,
	[Fecha] date NOT NULL,
	[Hora] time(7),
	[ID_Entrega] tinyint not null
)
Go



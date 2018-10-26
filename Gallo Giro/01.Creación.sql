Create database [Gallo Giro]
Go
Use [Gallo Giro]
Go
---1er Paso: Creación de las tablas
CREATE TABLE [Almacen]
(
	[ID_Dirección] smallint NOT NULL,
	[ID] smallint NOT NULL IDENTITY (250, 4)
)
Go

CREATE TABLE [Actividad]
(
ID tinyint not null identity(1,1),
Nombre varchar(35) not null
)
Go

CREATE TABLE [Actividad_Agricultor]
(
ID_Actividad tinyint not null,
ID_Agricultor smallint not null
)
Go

CREATE TABLE [Cliente]
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

CREATE TABLE [Calle]
(
	[ID_Ciudad] int NOT NULL,
	[ID] int NOT NULL identity(1,1),
	[Nombre] varchar(30) NOT NULL
)
Go

CREATE TABLE [CEDIS]
(
	[ID_Almacen] smallint NOT NULL,
	[Capacidad_(palets/nivel)] smallint NOT NULL default(320)
)
Go

CREATE TABLE [Ciudad]
(
	[Nombre] varchar(30) NOT NULL,
	[ID] int NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [Colonia]
(
	[ID] int NOT NULL identity(1,1),
	[Nombre] varchar(40) NOT NULL,
	[ID_Ciudad] int NOT NULL
)
Go

CREATE TABLE [Componente_Activo]
(
	[Nombre] varchar(50) NOT NULL,
	[ID] smallint NOT NULL identity(1,1),
	[Fórmula_Química] varchar(50) null
)
Go

CREATE TABLE [CompraProducto]---
(
	[ID_CEDIS] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[CantIDad] smallint NOT NULL,
	[FechaCompra] date,
	[Folio] varchar(4) NOT NULL,
	[PrecioUnitario] money NOT NULL
)
Go

CREATE TABLE [DetalleVenta]---
(
	[Folio_Venta] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[PrecioUnitarioProducto] money NOT NULL
)
Go

CREATE TABLE [Dimensión]
(
	[Cantidad] decimal(5,2) NOT NULL,
	[Unidad_de_Medida] varchar(40) NOT NULL,
	[ID] smallint NOT NULL
)
Go

CREATE TABLE [Dirección]
(
	[CP] int null,
	[ID_Calle] int NOT NULL,
	[Número] smallint NULL,
	ID_Colonia int not null,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [Etiqueta_Peligro]
(
	[Nombre_Peligro] varchar(50) NOT NULL,
	[ID] tinyint NOT NULL IDENTITY (20, 3),
	[Simbolo] char(2) not null
)
Go

CREATE TABLE [Familia]
(
	[Nombre] varchar(30) NOT NULL,
	[ID] smallint NOT NULL identity(30,3),
	[Descripción] varchar(120) NOT NULL
)
Go

CREATE TABLE [FraseR]
(
	[Frase] varchar(3) NOT NULL,
	[ID] tinyint IDENTITY (1, 1), 
	Descripción varchar(100) null
)
Go


--CREATE TABLE [Inventario]---
--(
 --[ID] smallint NOT NULL IDENTITY (1, 1),
 --[FechaInventario] date NOT NULL,
 --[ID_Almacen] smallint NOT NULL
--)
--Go

--CREATE TABLE [Inventario_Producto]---
--(
	--[UPC_Producto] bigint not NULL,
	--[PrecioProductoActual] money,
	--[Stock inicial] smallint NOT NULL,
	--[Stock actual] smallint NOT NULL,
	--[ID_Inventario] smallint not null
--)
--Go

CREATE TABLE [Pago]---
(
	[ID_Cliente] smallint NOT NULL,
	[ID_TipoPAgo] tinyint NOT NULL,
	[Monto] money NOT NULL,
	[FechaPago] date NOT NULL,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [Peligrosidad_Etiqueta]
(
	[ID_Etiqueta] tinyint NOT NULL,
	[ID_Producto] smallint NOT NULL
)
Go

CREATE TABLE [FraseR_Producto]
(
	[ID_Producto] smallint NOT NULL,
	[ID_Frase] tinyint NOT NULL,
)
Go

CREATE TABLE [Producto]
(
	[Punto_de_reorden] smallint NOT NULL,
	[Nombre] varchar(40) NOT NULL,
	[ID_ComponenteActivo] smallint,
	[ID_Familia] smallint NOT NULL,
	[ID_Proveedor] tinyint NOT NULL,
	[ID] smallint not null identity(1,1)
)
Go
---Precios_Ventas
Create table [Presentación]
(
	[ID_Base] smallint not null,
	[ID_Dimensión] smallint not null,
	[Volumen(dm3)] smallint,
	[PrecioUnitarioActual] money NOT NULL,
	[UPC] bigint NOT NULL,
)
Go

CREATE TABLE [Proveedor]
(
	[Nombre] varchar(30) NOT NULL,
	[RFC] varchar(13) NOT NULL,
	[E-Mail] varchar(50) NOT NULL,
	[ID] tinyint not null identity(1,1)
)
Go

CREATE TABLE [Sucursal]
(
	[ID_CEDIS] smallint NOT NULL,
	[ID_Almacen] smallint NOT NULL
)
Go

CREATE TABLE [TipoCliente]
(
	[ID] tinyint NOT NULL,
	[Tipo] varchar(25) NOT NULL,
	[Descripción] varchar(75) NOT NULL
)
Go

CREATE TABLE [TipoEntrega]
(
	[Nombre] varchar(25) NOT NULL,
	[Descripción] varchar(120) NOT NULL,
	[ID] tinyint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [TipoPago]
(
	[ID] tinyint NOT NULL IDENTITY (1, 1),
	[Tipo] varchar(20) NOT NULL,
	[Descripción] varchar(70) NOT NULL
)
Go

CREATE TABLE [TransferenciaInventario]
(
	[ID_AlmacenEnvío] smallint NOT NULL,
	[ID_AlmacenRecibe] smallint NOT NULL,
	[Fecha] date NOT NULL,
	[Folio] varchar(5) NOT NULL,
	[ID] smallint NOT NULL
)
Go

CREATE TABLE [TransferenciaProducto]
(
	[UPC-Producto] bigint NOT NULL,
	[Cantidad] smallint NOT NULL,
	[ID_TransferenciaInventario] smallint NOT NULL
)
Go

CREATE TABLE [Venta]
(
	[ID_Cliente] smallint NOT NULL,
	[ID_Sucursal] smallint NOT NULL,
	[Folio] smallint NOT NULL,
	[Fecha] date NOT NULL,
	[Hora] time(7),
	[ID_TipoEntrega] tinyint NOT NULL,
	[Estatus] varchar(30) NOT NULL
)
Go

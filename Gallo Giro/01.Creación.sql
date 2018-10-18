Create database [Gallo Giro]
Go
Use [Gallo Giro]
Go
---1er Paso: Creación de las tablas
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
	[RFC] varchar(10) NOT NULL,
	[ID_Tipo] tinyint NOT NULL,
	[Nombre] varchar(15) NOT NULL,
	[ApellIDoPaterno] varchar(15) NOT NULL,
	[ApellIDoMaterno] varchar(15) NOT NULL,
	[ID_Dirección] smallint NOT NULL,
	[ID] smallint NOT NULL identity(1,1)
)
Go

CREATE TABLE [Almacen]
(
	[ID_Dirección] smallint NOT NULL,
	[ID] smallint NOT NULL IDENTITY (1, 1)
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
	[CapacIDad_(palets/nivel)] smallint NOT NULL
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
	[Nombre] varchar(30) NOT NULL,
	[ID] smallint NOT NULL,
	[Fórmula_Química] varchar(50) NOT NULL
)
Go

CREATE TABLE [CompraProducto]
(
	[ID_CEDIS] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[CantIDad] smallint NOT NULL,
	[FechaCompra] date,
	[Folio] varchar(4) NOT NULL,
	[PrecioUnitario] money NOT NULL
)
Go

CREATE TABLE [DetalleVenta]
(
	[Folio_Venta] smallint NOT NULL,
	[UPC_Producto] bigint NOT NULL,
	[CantIDad] smallint NOT NULL,
	[PrecioUnitarioProducto] money NOT NULL
)
Go

CREATE TABLE [Dimensión]
(
	[CantIDad] smallint NOT NULL,
	[UnIDad_de_MedIDa] varchar(40) NOT NULL,
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
	[ID] tinyint NOT NULL IDENTITY (1, 1),
	[Simbolo] char(1)
)
Go

CREATE TABLE [Familia ]
(
	[Nombre] varchar(30) NOT NULL,
	[ID] smallint NOT NULL,
	[Descripción] varchar(50) NOT NULL
)
Go

CREATE TABLE [FraseR]
(
	[Frase] varchar(3) NOT NULL,
	[ID] tinyint IDENTITY (1, 1)
)
Go

CREATE TABLE [Inventario]
(
	[UPC_Producto] bigint NOT NULL,
	[ID_Almacen] smallint NOT NULL,
	[CantIDad] smallint NOT NULL,
	[FechaInventario] date NOT NULL,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [Pago]
(
	[ID_Cliente] smallint NOT NULL,
	[ID_TipoPAgo] tinyint NOT NULL,
	[Monto] money NOT NULL,
	[FechaPago] date NOT NULL,
	[ID] smallint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [PeligrosIDad_Etiqueta]
(
	[ID_Etiqueta] tinyint NOT NULL,
	[ID_PeligrosIDad] tinyint NOT NULL
)
Go

CREATE TABLE [PeligrosIDad_Producto]
(
	[UPC_Producto] bigint NOT NULL,
	[ID_Frase] tinyint NOT NULL,
	[ID] tinyint NOT NULL
)
Go

CREATE TABLE [Producto]
(
	[Punto_de_reorden] smallint NOT NULL,
	[Nombre] varchar(40) NOT NULL,
	[PrecioUnitarioActual] money NOT NULL,
	[UPC] bigint NOT NULL,
	[FechaVencimiento] date NOT NULL,
	[ID_Dimensión] smallint NOT NULL,
	[ID_ComponenteActivo] smallint,
	[ID_Familia] smallint NOT NULL,
	[Volumen(m3)] smallint,
	[RFC_Proveedor] varchar(10) NOT NULL
)
Go

CREATE TABLE [Proveedor]
(
	[Nombre] varchar(30) NOT NULL,
	[RFC] varchar(10) NOT NULL,
	[E-Mail] varchar(50) NOT NULL
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
	[Descripción] varchar(70) NOT NULL
)
Go

CREATE TABLE [TipoEntrega]
(
	[Nombre] varchar(25) NOT NULL,
	[Descripción] varchar(50) NOT NULL,
	[ID] tinyint NOT NULL IDENTITY (1, 1)
)
Go

CREATE TABLE [TipoPago]
(
	[ID] tinyint NOT NULL IDENTITY (1, 1),
	[Tipo] varchar(20) NOT NULL,
	[Descripción] varchar(55) NOT NULL
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
	[CantIDad] smallint NOT NULL,
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

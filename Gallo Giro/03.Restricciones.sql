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

Alter table [Venta]
	add constraint [CK_Venta_Estatus] check (Estatus IN ('Pagado', 'Pendiente'))
Go

Alter table [Venta]
	add constraint [CK_Venta_Hora] check (datepart(hour,Hora)>6 and datepart(hour,Hora)<24)
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

ALTER TABLE [Almacen] 
 ADD CONSTRAINT [UQ_Dirección] UNIQUE NONCLUSTERED ([id_Dirección])
Go

ALTER TABLE [Familia]
 ADD CONSTRAINT [UQ_Nombre_Familia] unique ([Nombre])
 Go

Alter table Colonia 
	add constraint [UQ_Colonia_Ciudad] unique(ID_Ciudad,Nombre)
Go

ALTER TABLE [Calle] 
 ADD CONSTRAINT [UQ_Calle_Ciudad] UNIQUE NONCLUSTERED (Nombre,ID_Ciudad)
Go

ALTER TABLE [Etiqueta_Peligro] 
 ADD CONSTRAINT [UQ_Simbolo_Peligro] UNIQUE NONCLUSTERED ([Simbolo])
Go

ALTER TABLE [FraseR] 
 ADD CONSTRAINT [UQ_Frase] UNIQUE NONCLUSTERED ([Frase])
Go

ALTER TABLE [TipoEntrega]
	ADD CONSTRAINT [CK_TipoEntrega_Tipo] check(Nombre IN ('A Domicilio','En CEDIS','En Sucursal'))
Go

ALTER TABLE [TipoEntrega]
	ADD CONSTRAINT [UQ_TipoEntrega_Nombre] unique ([Nombre])
Go

ALTER TABLE [Producto] 
 ADD CONSTRAINT [UQ_Nombre_Producto] UNIQUE NONCLUSTERED ([Nombre])
Go

Alter table [Dirección]
 add constraint [UQ_Dirección_Número] unique(ID_Calle,Número)
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

ALTER TABLE [FraseR] 
 ADD CONSTRAINT [CK_FraseR_Frase] check (Frase like 'R%')
 Go

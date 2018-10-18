Use [Gallo Giro]
Go
---4to Paso: Restricciones(Unique, Check)
ALTER TABLE [Producto] 
 ADD CONSTRAINT [CK_UPC] CHECK (UPC<10000000000000)
Go

Alter table [Actividad] 
	add constraint [CK_Actividad_Nombre] unique(Nombre)
Go

Alter table [TipoCliente]
	add constraint [CK_TipoCliente_Nombre] check (Tipo IN ('Domestico','Agricultor'))
Go

ALTER TABLE [Cliente] 
 ADD CONSTRAINT [UQ_RFC] UNIQUE NONCLUSTERED ([RFC])
Go
ALTER TABLE Ciudad
ADD CONSTRAINT UQ_Nombre_Ciudad unique(Nombre)

ALTER TABLE [Almacen] 
 ADD CONSTRAINT [UQ_Dirección] UNIQUE NONCLUSTERED ([id_Dirección])
Go

Alter table Colonia 
	add constraint [UQ_Colonia_Ciudad] unique(ID_Ciudad,Nombre)
Go

ALTER TABLE [Calle] 
 ADD CONSTRAINT [UQ_Calle_Ciudad] UNIQUE NONCLUSTERED (Nombre,ID_Ciudad)
Go

ALTER TABLE [Dimensión] 
 ADD CONSTRAINT [UQ_Unidad_de_Medida] UNIQUE NONCLUSTERED ([Unidad_de_Medida])
Go

ALTER TABLE [Etiqueta_Peligro] 
 ADD CONSTRAINT [UQ_Nombre_Peligro] UNIQUE NONCLUSTERED ([Nombre_Peligro])
Go

ALTER TABLE [FraseR] 
 ADD CONSTRAINT [UQ_Frase] UNIQUE NONCLUSTERED ([Frase])
Go

ALTER TABLE [Producto] 
 ADD CONSTRAINT [UQ_Nombre_Producto] UNIQUE NONCLUSTERED ([Nombre])
Go

Alter table [Dirección]
add constraint [UQ_Dirección_Número] unique(ID_Calle,Número)
Go
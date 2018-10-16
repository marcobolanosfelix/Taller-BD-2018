Use [Gallo Giro]
Go
---4to Paso: Restricciones(Unique, Check)
ALTER TABLE [Producto] 
 ADD CONSTRAINT [CK_UPC] CHECK (UPC<10000000000000)
Go

ALTER TABLE [ Cliente] 
 ADD CONSTRAINT [UQ_RFC] UNIQUE NONCLUSTERED ([RFC])
Go

ALTER TABLE [Almacen] 
 ADD CONSTRAINT [UQ_Dirección] UNIQUE NONCLUSTERED ([id_Dirección])
Go

ALTER TABLE [Calle] 
 ADD CONSTRAINT [UQ_Nombre_Calle] UNIQUE NONCLUSTERED ([Nombre])
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
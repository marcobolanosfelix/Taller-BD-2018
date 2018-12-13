use cuatro_cuadras
GO

--- 2do Paso:Creación de PK
 alter table Lugar 
  add constraint PK_Lugar 
	primary key(id) 
 GO

 alter table Categoria 
  add constraint 
	PK_Categoria primary key(id)
 GO

 Alter table Ciudad
	add constraint 
	 PK_Ciudad primary key(id)
GO  
 Alter table Checkin
 add constraint 
	PK_Checkin primary key(id)
Go
  
Alter table Etiqueta
 add constraint
	PK_Etiqueta primary key(id)
Go

Alter table Etiqueta_Lugar
	add constraint 
		PK_Etiqueta_Lugar primary key(id_lugar,id_etiqueta)
Go

 Alter table Interes
 add constraint 
	PK_Intereses primary key(id)
Go

Alter table Intereses_Usuario
 add constraint 
	PK_Intereses_Usuario primary key(id_interes, id_usuario)
Go

 alter table Usuario 
  add constraint 
	PK_Usuario primary key (id)
 GO

 alter table Solicitud 
  add constraint 
	PK_Solicitud primary key(id)
 GO

 alter table Insignia 
  add constraint 
	PK_Insignia primary key (id)
 GO

 alter table Logro 
  add constraint 
	PK_Logro primary key (id_insignia, id_usuario)
 GO

--- 3er paso: Creación de FK
alter table Lugar add constraint FK_Lugar_Categoria 
	foreign key (id_categoria) references Categoria(id)
GO

Alter table Etiqueta_Lugar add constraint FK_Lugar_Etiqueta
	foreign key (id_lugar) references Lugar(id) on delete cascade
Go

Alter table Etiqueta_Lugar add constraint FK_Etiqueta_Lugar
	foreign key (id_etiqueta) references Etiqueta(id)
Go

Alter table Intereses_Usuario add constraint Fk_Intereses_Usuario
	foreign key(id_usuario) references Usuario(id) on delete cascade
Go

Alter table Intereses_Usuario add constraint Fk_Intereses_Usuario_Intereses
	foreign key(id_interes) references Interes(id)
Go

Alter table Usuario add constraint FK_Ciudad_id
	foreign key(id_ciudad) references Ciudad(id) 
Go

alter table Checkin add constraint FK_lugar_id 
	foreign key(lugar_id) references Lugar(id) on delete cascade
GO

alter table Checkin add constraint FK_usuario_id 
	foreign key(usuario_id)references Usuario(id) on delete cascade
GO

alter table Logro add constraint FK_id_insignia 
	foreign key(id_insignia)references Insignia(id)
GO

alter table Logro add constraint FK_id_usuario 
	foreign key(id_usuario)references Usuario(id) on delete cascade
GO

alter table Logro add constraint FK_id_lugar 
	foreign key(lugar_id) references Lugar(id) on delete cascade
GO

alter table Solicitud add constraint FK_id_recibe 
	foreign key(id_recibe)references Usuario(id) on delete cascade
GO

alter table Solicitud add constraint FK_id_envia 
	foreign key(id_envio)references Usuario(id) on delete no action
 GO


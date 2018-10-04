Use Cuatro_Cuadras
Go
---4to Paso: Restricciones(Unique, Check)
Alter table Categoria add constraint CK_Categoria_Nombre
  unique(nombre)
 Go

Alter table Lugar add constraint CK_Lugar_Longitud
 check(longitud>=-180 and longitud<=180)
Go

Alter table Lugar add constraint CK_Lugar_Latitud
 check(latitud>=-90 and latitud<=90)
GO

Alter table Lugar add constraint UQ_Lugar_Nombre
	unique(nombre)
Go

Alter table Etiqueta add constraint UQ_Etiqueta_Nombre
  unique(nombre)
Go

Alter table Checkin add constraint CK_Checkin_Fecha
 check(fecha>('2015-01-01') and fecha<Getdate())
 GO

Alter table Checkin add constraint CK_Checkin_Valoración 
 check(valoracion>0 and valoracion<=5)
 Go

 Alter table Checkin add constraint UQ_Checkin_Tiempo 
 unique(lugar_id,usuario_id,fecha,hora)
 Go

 Alter table Solicitud add constraint UQ_Solicitud_Usuario_Envio
 unique(id_recibe,id_envio)
 Go

 Alter table Solicitud add constraint CK_Solicitud_Recibe_Envia
 check(estado IN('En espera','Aceptado','Rechazado'))
 GO

Alter table Solicitud add constraint CK_Solicitud_Usuarios
 check(id_recibe != id_envio)
 Go

 Alter table Solicitud add constraint CK_Solicitud_Fecha
 check(fecha>('2015-01-01') and fecha<=Getdate())
 Go

Alter table Logro add constraint CK_Logro_Fecha
 check(fecha>('2015-01-01') and fecha<=Getdate())
Go

Alter table Usuario add constraint UQ_Usuario_Nombre_de_Usuario
 unique(nombre_usuario) 
 Go

 Alter table Usuario add constraint CK_Usuario_email
 unique(email) 
 Go
  
 Alter table Insignia add constraint UQ_Insignia_Tipo
	unique(tipoinsignia)
Go

Alter table Interes add constraint Ck_Interes_Nombre
	unique(nombre)
Go
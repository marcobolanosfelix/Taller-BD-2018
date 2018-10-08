use Conquistadores;
go

-- Restricciones (Unique, Check)
alter table Director add constraint UQ_Director_Nombre unique(nombre);
go

alter table Subdirector add constraint UQ_Subdirector_Nombre unique(nombre);
go

alter table Tesorero add constraint UQ_Tesorero_Nombre unique(nombre);
go

alter table Secretario add constraint UQ_Secretario_Nombre unique(nombre);
go

alter table Club add constraint UQ_Club_Nombre unique(nombre);
go

alter table Club add constraint UQ_Club_Lema unique(lema);
go

alter table Club add constraint UQ_Club_Logo unique(logo);
go

alter table Club add constraint UQ_Club_Calle unique(calle);
go

alter table Club add constraint UQ_Club_Colonia unique(colonia);
go

alter table Niño add constraint CK_Niño_Fecha check(fecha>('2000-01-01') and fecha<Getdate());-- Validando si es menor de edad el Niño
go

alter table Niño add constraint CK_Niño_Estatura check(estaturs.len<=4);-- Formato adecuado de la estatura
go

alter table Niño add constraint CK_Niño_NumeroEmergencia check(numero_emergencia.len<=10);
go

alter table Clase add constraint UQ_Clase_Nombre unique(nombre);
go

alter table Clase add constraint UQ_Clase_Lema unique(lema);
go

alter table Padre add constraint UQ_Padre_Telefono unique(telefono);
go

alter table Padre add constraint CK_Padre_Telefono check(telefono.len<=10);-- Longitud del telefono que no exceda de 10 digitos
go

alter table Capitan add constraint UQ_Capitan_Nombre unique(nombre);
go

alter table Unidad add constraint UQ_Unidad_Nombre unique(nombre);
go

alter table Unidad add constraint UQ_Unidad_Logotipo unique(logotipo);
go

alter table Unidad add constraint UQ_Unidad_Lema unique(lema);
go

alter table Consejero add constraint UQ_Consejero_Nombre unique(nombre);
go

alter table Instructor add constraint UQ_Instructor_Nombre unique(nombre);
go

alter table Actividad add constraint UQ_Actividad_Nombre unique(nombre);
go

alter table Especialidad add constraint UQ_Especialidad_Nombre unique(nombre);
go
   

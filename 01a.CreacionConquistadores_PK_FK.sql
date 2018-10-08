use Conquistadores;
go

-- Definicion de PK, FK y  Constraints

alter table Pais add constraint PK_Pais primary key(id); 
 GO
alter table Estado add constraint PK_Estado primary key(id);
go
alter table Ciudad add constraint PK_Ciudad primary key(id);
go
alter table Club add constraint PK_Club primary key(id);
go
alter table Subdirector add constraint PK_Subdirector primary key(id);
go
alter table Secretario add constraint PK_Secretario primary key(id);
go
alter table Tesorero add constraint PK_Tesorero primary key(id);
go
alter table Director add constraint PK_Director primary key(id);
go
alter table Reunion add constraint PK_Reunion primary key(id);
go
alter table Reunion_Niño add constraint PK_Reunion_Niño primary key(reunion_id, niño_id);
go
alter table Niño add constraint PK_Niño primary key(id);
go
alter table Niño_Actividad add constraint PK_Niño_Actividad primary key(niño_id, actividad_id);
go
alter table Padre add constraint PK_Padre primary key(id);
go
alter table Clase add constraint PK_Clase primary key(id);
go
alter table Capitan add constraint PK_Capitan primary key(id);
go
alter table Unidad add constraint PK_Unidad primary key(id);
go
alter table Consejero add constraint PK_Consejero primary key(id);
go
alter table Instructor add constraint PK_Instructor primary key(id);
go
alter table Especialidad_Instructor add constraint PK_Especialidda_Instructor primary key(especialidad_id, instructor_id);
go
alter table Investidura_Niño add constraint PK_Investidura_Niño primary key(investidura_id, niño_id);
go
alter table Consejero_Especialidad add constraint PK_Consejero_Especialidad primary key(consejero_id, especialidad_id);
go
alter table Actividad add constraint PK_Actividad primary key(id);
go
alter table Investidura add constraint PK_Investidura primary key(id);
go
alter table Especialidad_Actividad add constraint PK_Especialidad_Actividad primary key(especialidad_id, actividad_id);
go
alter table Especialidad add constraint PK_Especialidad primary key(id);
go


alter table Estado add constraint FK_Estado 
	foreign key (pais_id) references Pais(id);
GO

alter table Ciudad add constraint FK_Ciudad
	foreign key(estado_id) references Ciudad(id);
GO

alter table Director add constraint FK_Director
	foreign key(especialidad_id) references Especialidad(id);
GO

alter table Reunion_Niño add constraint FK_Reunion_Niño
	foreign key(reunion_id) references Reunion(id);
GO

alter table Reunion_Niño add constraint FK_Reunion_Niño_2
	foreign key(niño_id) references Niño(id);
GO

alter table Niño add constraint FK_Niño_Club
	foreign key(club_id) references Club(id);
GO

alter table Niño add Constraint FK_Niño_Unidad
	foreign key(unidad_id) references Unidad(id);
GO

alter table Niño add constraint FK_Niño_Padre
	foreign key(padre_id) references Padre(id);
GO

alter table Niño add constraint FK_Niño_Clase
	foreign key(clase_id) references Clase(id);
GO

alter table Niño_Actividad add constraint FK_Niño_Actividad
	foreign key(niño_id) references Niño(id);
GO

alter table Niño_Actividad add constraint FK_Niño_Actividad_2
	foreign key(actividad_id) references Actividad(id);
GO

alter table Clase add constraint FK_Clase_Instructor
	foreign key(instructor_id) references Instructor(id);
GO

alter table Clase add constraint FK_Clase_Club
	foreign key(club_id) references Club(id);
GO

alter table Unidad add constraint FK_Unidad_Capitan
	foreign key(capitan_id) references Capitan(id);
GO

alter table Unidad add constraint FK_Unidad_Consejero
	foreign key(consejero_id) references Consejero(id);
GO

alter table Especialidad_Instructor add constraint FK_Especialidad_Instructor
	foreign key(instructor_id) references Instructor(id);
GO

alter table Especialidad_Instructor add constraint FK_Especialidad_Instructor_2
	foreign key(especialidad_id) references Especialidad(id);
GO

alter table Investidura_Niño add constraint FK_Investidura_Niño
	foreign key(investidura_id) references Investidura(id);
GO

alter table Investidura_Niño add constraint FK_Investidura_Niño_2
	foreign key(niño_id) references Niño(id);
GO

alter table Investidura_Niño add constraint FK_Investidura_Instructor
	foreign key(instructor_id) references Instructor(id);
GO

alter table Consejero_Especialidad add constraint FK_Consejero_Investidura
	foreign key(consejero_id) references Consejero(id);
GO

alter table Consejero_Especialidad add constraint FK_Consejero_Especialidad
	foreign key(especialidad_id) references Especialidad(id);
GO

alter table Especialidad_Actividad add constraint FK_Especialidad_Actividad
	foreign key(especialidad_id) references Especialidad(id);
GO

alter table Especialidad_Actividad add constraint FK_Especialidad_Actividad
	foreign key(actividad_id) references Actividad(id);
GO





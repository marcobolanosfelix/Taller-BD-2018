-- 01. Creacion de Tablas

create database Conquistadores;
go
use Conquistadores;
go

create table Pais (
    id int not null identity,
    nombre varchar(50) not null
);

create table Estado (
    id int not null identity,
    nombre varchar(50) not null,
    pais_id int
);

create table Ciudad (
    id int not null identity,
    nombre varchar(50) not null,
    estado_id int
);

create table Club (
    id int not null identity,
    nombre varchar(50) not null,
    lema varchar(100) not null,
    logo varchar(100) not null,
    direccion varchar(200) not null,
    ciudad_id int,
    director_id int,
    subdirector_id int,
    secretario_id int,
    tesorero_id int
);

create table Director (
    id int not null identity ,
    nombre varchar(50) not null,
    edad int not null
);

create table Subdirector (
    id int not null identity ,
    nombre varchar(50) not null,
    edad int not null
);

create table Secretario (
    id int not null identity ,
    nombre varchar(50) not null,
    edad int not null
);

create table Tesorero (
    id int not null identity ,
    nombre varchar(50) not null,
    edad int not null
);

create table Instructor (
    id int not null identity ,
    nombre varchar(50) not null,
    edad int not null,
    fecha_nacmiento date not null,
    especialidad_id int,
    clase_id int
);

create table Clase (
    id int not null identity ,
    nombre varchar(50) not null,
    logotipo varchar(50) not null,
    color varchar(30) not null,
    club_id int,
    instructor_id int
);

create table Padre (
    id int not null identity ,
    nombre varchar(50) not null,
    telefono int not null,
    ocupacion varchar(50) not null,
    niño_id int
);

create table Niño (
    id int not null identity ,
    nombre varchar(50) not null,
    fecha_nacimiento date not null,
    edad int not null,
    estura int not null,
    peso int not null,
    numero_emergencia int not null,
    enfermedades varchar(200) not null,
    alergias varchar(200) not null,
    mas_cumplido bit,
    unidad_id int,
    clase_id int
);

create table Reunion_Niño ( -- Asistencia de cada Niño
    reunion_id int,
    niño_id int,
    fecha date,
    uniforme bit,
    puntualidad bit,
    cuota bit,
    tarea bit,
    pulcritud bit
);

create table Reunion (
    id int not null identity ,
    fecha date
);

create table Unidad (
    id int not null identity ,
    nombre varchar(50) not null,
    logotipo varchar(50) not null,
    lema varchar(100) not null,
    capitan varchar(50) not null,
    consejero_id int
);

create table Consejero (
    id int not null identity ,
    nombre varchar(50) not null
);

create table Consejero_Especialidad (
    consejero_id int,
    especialidad_id int,
    fecha date
);

create table Especialidad (
    id int not null identity ,
    nombre varchar(50) not null
);

create table Especialidad_Instructor (
    especialidad_id int,
    instructor_id int,
    fecha date
);

create table Investidura (
    id int not null identity ,
    fecha date
);

create table Control (
    fecha date,
    investidura_id int,
    clase_id int,
    instructor_id int,
    especialidad int
);

create table Actividad (
    id int not null identity ,
    nombre varchar(50) not null,
    investidura_id int
);

create table Niño_Actividad (
    niño_id int,
    actividad_id int
);



-- Definicion de Constraints (Primary Keys y Foreign Keys)

alter table Director add constraint PK_Director primary key(id);
alter table Subdirector add constraint PK_Subdirector primary key(id);
alter table Tesorero add constraint PK_Tesorero primary key(id);
alter table Secretario add constraint PK_Secretario primary key(id);
alter table Pais add constraint PK_Pais primary key(id);
alter table Estado add constraint PK_Estado primary key(id);
alter table Ciudad add constraint PK_Ciudad primary key(id);
alter table Club add constraint PK_Club primary key(id);
alter table Instructor add constraint PK_Instructor primary key(id);
alter table Clase add constraint PK_Clase primary key(id);
alter table Niño add constraint PK_Niño primary key(id);
alter table Reunion_Niño add constraint PK_Reunion_Niño primary key(reunion_id);
alter table Reunion_Niño add constraint PK_Reunion_Niño primary key(niño_id);
alter table Reunion add constraint PK_Reunion primary key(id);
alter table Unidad add constraint PK_Unidad primary key(id);
alter table Consejero add constraint PK_Consejero primary key(id);
alter table Consejero_Especialidad add constraint PK_Consejero_Especialidad primary key(consejero_id);
alter table Consejero_Especialidad add constraint PK_Consejero_Especialidad primary key(especialidad_id);
alter table Especialidad add constraint PK_Especialidad primary key(id);
alter table Especialidad_Instructor add constraint PK_Especialidad_Instructor primary key(especialidad_id);
alter table Especialidad_Instructor add constraint PK_Especialidad_Instructor primary key(instructor_id);
alter table Controles add constraint PK_Controles primary key(id);
alter table Niño_Actividad add constraint PK_Niño_Actividad primary key(niño_id);
alter table Niño_Actividad add constraint PK_Niño_Actividad primary key(actividad_id);
alter table Padre add constraint PK_Padre primary key(id);
alter table Actividad add constraint PK_Actividad primary key(id);
alter table Actividad_Especialidad add constraint PK_Actividad_Especialidad primary key(actividad_id);
alter table Actividad_Especialidad add constraint PK_Actividad_Especialidad primary key(especialidad_id);
alter table Investidura add constraint PK_Investidura primary key(id);


alter table Club add constraint FK_Club_Director foreign key(director_id) references Director(id);
alter table Club add constraint FK_Club_Subdirector foreign key(subdirector_id) references Subdirector(id);
alter table Club add constraint FK_Club_Tesorero foreign key(tesorero_id) references Tesorero(id);
alter table Club add constraint FK_Club_Secretario foreign key(secretario_id) references Secretario(id);
alter table Reunion_Niño add constraint FK_Reunion_Niño foreign key(reunion_id) references Reunion(id);
alter table Reunion_Niño add constraint FK_Reunion_Niño foreign key(niño_id) references Niño(id);
alter table Niño add constraint FK_Niño_Unidad foreign key(unidad_id) references Unidad(id);
alter table Niño add constraint FK_Niño_Clase foreign key(clase_id) references Clase(id);
alter table Clase add constraint FK_Clase_Club foreign key(club_id) references Club(id);
alter table Clase add constraint FK_Clase_Instructor foreign key(instructor_id) references Instructor(id);
alter table Instructor add constraint FK_Instructor_Especialidad foreign key(especialidad_id) references Especialidad(id);
alter table Instructor add constraint FK_Instructor_Clase foreign key(clase_id) references Clase(id);
alter table Unidad add constraint FK_Unidad_Consejero foreign key(consejero_id) references Consejero(id);
alter table Consejero_Especialidad add constraint FK_Consejero_Especialidad foreign key(consejero_id) references Consejero(id);
alter table Consejero_Especialidad add constraint FK_Consejero_Especialidad foreign key(especialidad_id) references Especialidad(id);
alter table Especialidad_Instructor add constraint FK_Especialidad_Instructor foreign key(instructor_id) references Instructor(id);
alter table Especialidad_Instructor add constraint FK_Especialidad_Instructor foreign key(especialidad_id) references Especialidad(id);
alter table Padre add constraint FK_Padre_Niño foreign key(niño_id) references Niño(id);
alter table Niño_Actividad add constraint FK_Niño_Actividad foreign key(niño_id) references Niño(id);
alter table Niño_Actividad add constraint FK_Niño_Actividad foreign key(actividad_id) references Actividad(id);
alter table Controles add constraint FK_Controles_Investidura foreign key(investidura_id) references Investidura(id);
alter table Controles add constraint FK_Controles_Clase foreign key(clase_id) references Clase(id);
alter table Controles add constraint FK_Controles_Instructor foreign key(instructor_id) references Instructor(id);
alter table Controles add constraint FK_Controles_Especialidad foreign key(especialidad_id) references Especialidad(id);
alter table Actividad_Especialidad add constraint FK_Actividad_Especialidad foreign key(actividad_id) references Actividad(id);
alter table Actividad_Especialidad add constraint FK_Actividad_Especialidad foreign key(especialidad_id) references Especialidad(id);

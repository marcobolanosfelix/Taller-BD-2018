-- 01. Creacion de Tablas
drop database Conquistadores;
go

create database Conquistadores;
go
use Conquistadores;
go

create table Pais (
    id int not null identity,
    nombre varchar(50) not null
);
go
create table Estado (
    id int not null identity,
    nombre varchar(50) not null,
    pais_id int
);

go
create table Ciudad (
    id int not null identity,
    nombre varchar(50) not null,
    estado_id int
);
go

create table Club (
    id int not null identity,
    nombre varchar(50) not null,
    lema varchar(100) not null,
    logo varchar(100) not null,
    calle varchar(50) not null,
	colonia varchar(50) not null,
    ciudad_id int,
    subdirector_id int,
    secretario_id int,
    tesorero_id int
);
go

create table Director (
    id int not null identity ,
    nombre varchar(50) not null,
    edad int not null,
	especialidad_id int
);
go

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
    nombre varchar(50) not null
);
go

create table Clase (
    id int not null identity ,
    nombre varchar(50) not null,
    logotipo varchar(50) not null,
    color varchar(30) not null,
    club_id int,
    instructor_id int
);
go

create table Padre (
    id int not null identity ,
    nombre varchar(50) not null,
    telefono int not null,
    ocupacion varchar(50) not null
);
go

create table Niño (
    id int not null identity ,
    nombre varchar(50) not null,
    fecha_nacimiento date not null,
    edad int not null,
    estatura float not null,
    peso float not null,
    numero_emergencia int not null,
    enfermedades varchar(200) not null,
    alergias varchar(200) not null,
    unidad_id int,
    clase_id int,
	padre_id int
);
go

create table Reunion_Niño ( -- Asistencia de cada Niño
    reunion_id int,
    niño_id int,
    fecha date,
	asistencia bit,
    uniforme bit,
    puntualidad bit,
    cuota bit,
    tarea bit,
    pulcritud bit
);
go

create table Reunion (
    id int not null identity ,
    fecha date
);
go

create table Unidad (
    id int not null identity ,
    nombre varchar(50) not null,
    logotipo varchar(50) not null,
    lema varchar(100) not null,
    capitan_id int,
    consejero_id int
);
go

create table Consejero (
    id int not null identity ,
    nombre varchar(50) not null
);
go

create table Consejero_Especialidad (
    consejero_id int,
    especialidad_id int,
    fecha date
);
go

create table Especialidad (
    id int not null identity ,
    nombre varchar(50) not null
);
go

create table Especialidad_Instructor (
    especialidad_id int,
    instructor_id int,
    fecha date
);
go

create table Investidura (
    id int not null identity ,
    fecha date
);
go

create table Investidura_Niño (
	investidura_id int,
	niño_id int,
	fecha date
);
go

create table Actividad (
    id int not null identity ,
    nombre varchar(50) not null,
    investidura_id int
);

create table Actividad_Niño (
    actividad_id int,
    niño_id int,
	fecha date
);
go

create table Capitan (
	id int identity,
	nombre varchar(50)
);
go

create table Especialidad_Actividad (
	especialidad_id int,
	actividad_id int
);
go

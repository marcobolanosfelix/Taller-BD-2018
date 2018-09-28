create database Conquistadores;
use Conquistadores;

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

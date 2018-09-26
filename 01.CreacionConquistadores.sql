create database Conquistadores;
use Conquistadores;

create table Pais (
    id int not null auto_increment primary key,
    nombre varchar(50) not null
);

create table Estado (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    pais_id int
);

create table Ciudad (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    estado_id int
);

create table Club (
    id int not null auto_increment primary key,
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
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null
);

create table Subdirector (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null
);

create table Secretario (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null
);

create table Tesorero (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null
);

create table Instructor (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    edad int not null,
    fecha_nacmiento date not null,
    especialidad_id int,
    clase_id int
);

create table Clase (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    logotipo varchar(50) not null,
    color varchar(30) not null,
    club_id int,
    instructor_id int
);

create table Padre (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    telefono int(10) not null,
    ocupacion varchar(50) not null,
    niño_id int
);

create table Niño (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    fecha_nacimiento date not null,
    edad int not null,
    estura int not null,
    peso int not null,
    numero_emergencia int not null,
    enfermedades varchar(200) not null,
    alergias varchar(200) not null,
    mas_cumplido boolean,
    unidad_id int,
    clase_id int
);

create table Reunion_Niño ( -- Asistencia de cada Niño
    reunion_id int,
    niño_id int,
    fecha timestamp,
    uniforme boolean,
    puntualidad boolean,
    cuota boolean,
    tarea boolean,
    pulcritud boolean
);

create table Reunion (
    id int not null auto_increment primary key,
    fecha timestamp
);

create table Unidad (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    logotipo varchar(50) not null,
    lema varchar(100) not null,
    capitan varchar(50) not null,
    consejero_id int
);

create table Consejero (
    id int not null auto_increment primary key,
    nombre varchar(50) not null
);

create table Consejero_Especialidad (
    consejero_id int,
    especialidad_id int,
    fecha timestamp
);

create table Especialidad (
    id int not null auto_increment primary key,
    nombre varchar(50) not null
);

create table Especialidad_Instructor (
    especialidad_id int,
    instructor_id int,
    fecha timestamp
);

create table Investidura (
    id int not null auto_increment primary key,
    fecha timestamp
);

create table Control (
    fecha timestamp,
    investidura_id int,
    clase_id int,
    instructor_id int,
    especialidad int
);

create table Actividad (
    id int not null auto_increment primary key,
    nombre varchar(50) not null,
    investidura_id int
);

create table Niño_Actividad (
    niño_id int,
    actividad_id int
);


insert into Actividad(nombre) values("Encender fuego");
insert into Actividad(nombre) values("Escalar arbol");

insert into Ciudad(nombre) values("Culiacan");
insert into Ciudad(nombre) values("Navolato");

insert into Clase(nombre, logotipo, color) values("Clase A", "Logotipo Circulo", "Azul");
insert into Clase(nombre, logotipo, color) values("Clase B", "Logotipo Cuadrado", "Rojo");

insert into Club(nombre, lema, logo, direccion) 
    values("Las Arenas", "Sobrevivencia en todo momento", "Logo Triangulo", "Calle Los Angeles #435");
insert into Club(nombre, lema, logo, direccion) 
    values("Los del Bosque", "Cada aprendizaje es una vida salvada", "Logo Rectangulo", "Calle Hidalgo #67");
    
insert into Consejero(nombre) values("Alberto Aguilar");
insert into Consejero(nombre) values("Benito Bueno");    

insert into Director(nombre, edad) values("Carlos Carrillo", 40);
insert into Director(nombre, edad) values("Daniel Delgado", 43);

insert into Especialidad(nombre) values("Escalador Experto");
insert into Especialidad(nombre) values("Creador del Fuego Experto");

insert into Estado(nombre) values("Sinaloa");
insert into Estado(nombre) values("Durango");

insert into Instructor(nombre, edad, fecha_nacmiento) values("Esteban Estolano", 30, '10-10-1988');
insert into Instructor(nombre, edad, fecha_nacmiento) values("Fabian Felix", 32, '08-10-1986');

insert into Niño(nombre, fecha_nacimiento, edad, estura, peso, numero_emergencia, enfermedades, alergias, mas_cumplido)
    values("Gabriel Garcia", '09-05-1990', 38, 180, 75, 6721179899, "Ninguna", "Lacteos", false);
insert into Niño(nombre, fecha_nacimiento, edad, estura, peso, numero_emergencia, enfermedades, alergias, mas_cumplido)
    values("Ignacio Irizar", '09-05-1992', 36, 177, 80, 6722279899, "Ninguna", "Chocolate", true);
    
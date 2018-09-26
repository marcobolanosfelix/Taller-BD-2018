create database cuatro_cuadras
 go 
 

 use cuatro_cuadras

 create table lugar 
 (
 id int identity(1,1),
 nombre nvarchar(50) not null,
 ubicacion nvarchar(59)not null,
 descripcion nvarchar(100),
 id_categoria int not null,
 etiqueta nvarchar(20)
 ) 

 create table checkin
 (
 id int not null,
 email nvarchar(20),
 comentario nvarchar(100),
 fecha date,
 hora time,
 valoracion nvarchar(50)
 )

 create table usuario
 (
 id int not null,
 email nvarchar(20),
 nombre nvarchar(50),
 nombre_usuario nvarchar(20),
 contraseña varchar(50),
 cuidad_residencia nvarchar(50),
 intereses nvarchar(100)
 )
 
 create table solicitud
 (
 fecha date,
 id_recibe int  not null,
 id_envio int not null,
 id_solicitud int not null
 )

 create table insignia
 (
 id_insignia int not null,
 tipoinsignia int not null,
 descripcion nvarchar(100)
 )
 
 create table logros
 (
 id_logro int not null,
 tipoinsignia int not null,
 fecha date,
 hora time
 )

 create table categoria
 (
 id_categoria int identity(1,1) not null,
 nombre nvarchar(50) not null,
 descripcion nvarchar(100)
 )
 ---2do Paso:Creacion de PK
 alter table Lugar add constraint PK_Lugar primary key(id) 
 alter table 
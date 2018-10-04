Create database Cuatro_Cuadras
 GO 
 ---1er Paso: Creación de las tablas
 use cuatro_cuadras
 GO
 
 Create table Categoria
 (
 id int identity(1,1) not null,
 nombre nvarchar(50) not null,
 descripcion nvarchar(100)
 )
 GO

 Create table Lugar 
 (
 id int identity(1,1),
 nombre nvarchar(50) not null,
 longitud decimal(5,2),
 latitud decimal(5,2),
 descripcion nvarchar(100),
 id_categoria int not null,
 ) 
 GO

 Create table Etiqueta 
 (
 id int identity(1,1) not null,
 nombre varchar(40) not null,
 )
 GO
 Create table Etiqueta_Lugar
 (
 id_lugar int not null,
 id_etiqueta int not null
 )

 Create table Ciudad
 (
 nombre varchar(50),
 id int identity(1,1)
 )
 GO

 Create table Usuario
 (
 id int identity(1,1) not null,
 email nvarchar(50),
 nombre nvarchar(50),
 nombre_usuario nvarchar(30),
 contraseña varchar(50) not null,
 id_ciudad int not null,
 )
 GO

 Create table Checkin
 (
 lugar_id int not null,
 usuario_id int not null,
 comentario nvarchar(100),
 fecha date,
 hora time,
 id int identity(1,1) not null,
 valoracion decimal(2,1)
 )
 GO

 Create table Interes
 (
 id int identity(1,1) not null,
 nombre varchar(20) 
 )
 GO

 Create table Intereses_Usuario
 (
 id_interes int not null,
 id_usuario int not null
 )
 GO

 Create table Solicitud
 (
 fecha date,
 id_recibe int  not null,
 id_envio int not null,
 id int identity(1,1) not null,
 estado varchar(30) not null
 )
 GO

 Create table Insignia
 (
 id int identity (1,1) not null,
 tipoinsignia varchar(30) not null,
 descripcion nvarchar(100) not null
 )
 GO

 Create table Logro
 (
 id_insignia int not null,
 lugar_id int not null,
 id_usuario int not null,
 fecha date,
 hora time
 )
 GO

 
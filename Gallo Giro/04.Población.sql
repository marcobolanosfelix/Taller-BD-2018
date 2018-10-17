Use [Gallo Giro]
Go
---6to Paso: Cargas iniciales
select*from Ciudad
insert into Ciudad(Nombre)
values('Anáhuac'), ('CD. Obregón'),('Chihuahua'),('Culiacan'), ('Guamuchil'),('Guaymas'), ('Hermosillo'),('Mazatlán'),('CD.Cuauthemoc'),('Navojoa')

---Colonia
select ciudad.Nombre, Colonia.Nombre as NombreColonia,Colonia.ID, Calle.id as IDCalle,Calle.nombre as CalleNombre from Colonia inner join Ciudad on colonia.ID_Ciudad=Ciudad.ID 
inner join Calle on Calle.id_colonia=Colonia.id

select * from Colonia
INSERT INTO Colonia(Nombre,ID_Ciudad)
VALUES('Barranchos',4)
insert into Colonia (Nombre,ID_Ciudad)
values('Lomas del Sol',4)
insert into Colonia(Nombre,ID_Ciudad)
values('Las Quintas',4)
insert into Colonia (Nombre,ID_Ciudad)
values('Los venados',8)
insert into Colonia (Nombre,ID_Ciudad)
values('El Conchi',8)
insert into Colonia (Nombre,ID_Ciudad)
values('Cerro Gandereño',6)
insert into Colonia (Nombre,ID_Ciudad)
values('Las Plazas',6)
insert into Colonia (Nombre,ID_Ciudad)
values('Petrolera',6)
insert into Colonia (Nombre,ID_Ciudad)
values('La Matanza',7)
insert into Colonia (Nombre,ID_Ciudad)
values('Satelite',7)
insert into Colonia (Nombre,ID_Ciudad)
values('Obrera',3)
insert into Colonia (Nombre,ID_Ciudad)
values('El Pedregal',1)
insert into Colonia (Nombre,ID_Ciudad)
values('Real de Sevilla',2)
insert into Colonia (Nombre,ID_Ciudad)
values('Progreso',9)
insert into Colonia (Nombre,ID_Ciudad)
values('Francisco Villa',9)
insert into Colonia (Nombre,ID_Ciudad)
values('Morelos',5)
insert into Colonia (Nombre,ID_Ciudad)
values('Sonora Progresista',10)


---Calle
select*from Calle
insert into Calle(ID_Colonia,Nombre)
values(1,'Av. Gral. Maximiliano Gamez')
insert into Calle(ID_Colonia,Nombre)
values(2,'Profa. Emiliano Zapata')
insert into Calle(ID_Colonia,Nombre)
values(3,'Gral. Angel Flores')
insert into Calle(ID_Colonia,Nombre)
values(4,'Vison')
insert into Calle(ID_Colonia,Nombre)
values(5,'La Amapá')
insert into Calle(ID_Colonia,Nombre)
values(5,'Manuel J. Clouthier')
insert into Calle(ID_Colonia,Nombre)
values(6,'Calle Ocho')
insert into Calle(ID_Colonia,Nombre)
values(7,'Plaza del Centenario')
insert into Calle(ID_Colonia,Nombre)
values(8,'Oscar Ruiz Almeida')
insert into Calle(ID_Colonia,Nombre)
values(12,'5 de febrero')
insert into Calle(ID_Colonia,Nombre)
values(9,'Nicaragua')
insert into Calle(ID_Colonia,Nombre)
values(10,'Calle Ignacio Zaragoza')
insert into Calle(ID_Colonia,Nombre)
values(13,'Sta Matilde')
insert into Calle(ID_Colonia,Nombre)
values(,'')

---Dirección
select*from Dirección
insert into Dirección(CP,Número,ID_Calle)
values(80190,3190,1)
insert into Dirección(CP,Número,ID_Calle)
values(80016,2145,2)
insert into Dirección(CP,Número,ID_Calle)
values(80060,1112,3)
insert into Dirección(CP,Número,ID_Calle)
values(82154,84,4)
insert into Dirección(CP,Número,ID_Calle)
values(82190,313,5)
insert into Dirección(CP,Número,ID_Calle)
values(82190,null,6)
insert into Dirección(CP,Número,ID_Calle)
values(85440,124,7)
insert into Dirección(CP,Número,ID_Calle)
values(85440,13,8)
insert into Dirección(CP,Número,ID_Calle)
values(85456,205,9)
insert into Dirección(CP,Número,ID_Calle)
values(31600,202,10)
insert into Dirección(CP,Número,ID_Calle)
values(85060,null,12)
insert into Dirección(CP,Número,ID_Calle)
values(null,517,13)
insert into Dirección(CP,Número,ID_Calle)
values(,,)

---Almacen
select*from Almacen
insert into Almacen(ID_Dirección)
values(6),(2),(3),(1),(4),(5),(8)

---Tipo Clientes
select*from TipoCliente
insert into TipoCliente(ID,Tipo,Descripción)
values(1,'Domestico','Personas que compran productos para su jardín o huerto familiar.'),
(2,'Agricultor','Persona que siembra grandes cantidades de tierra.')

---Cliente
--select*from [Cliente]
--insert into [Cliente]()
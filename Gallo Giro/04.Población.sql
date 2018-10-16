Use [Gallo Giro]
Go
---6to Paso: Cargas iniciales
select*from Ciudad
insert into Ciudad(Nombre)
values('Culiacan')
insert into Ciudad(nombre)
values('Mazatlán')
insert into Ciudad(nombre)
values('Guaymas')
insert into Ciudad(nombre)
values('Hermosillo')
insert into Ciudad(nombre)
values('Chihuahua')
insert into Ciudad(nombre)
values('Anáhuac')
insert into Ciudad(nombre)
values('CD. Obregón')
insert into Ciudad(nombre)
values('Guamuchil')

---Colonia
select ciudad.Nombre, Colonia.Nombre as NombreColonia,Colonia.ID, Calle.id as IDCalle,Calle.nombre as CalleNombre from Colonia inner join Ciudad on colonia.ID_Ciudad=Ciudad.ID 
inner join Calle on Calle.id_colonia=Colonia.id
select id from Colonia
INSERT INTO Colonia(Nombre,ID_Ciudad)
VALUES('Barranchos',1)
insert into Colonia (Nombre,ID_Ciudad)
values('Lomas del Sol',1)
insert into Colonia(Nombre,ID_Ciudad)
values('Las Quintas',1)
insert into Colonia (Nombre,ID_Ciudad)
values('Los venados',2)
insert into Colonia (Nombre,ID_Ciudad)
values('El Conchi',2)
insert into Colonia (Nombre,ID_Ciudad)
values('Cerro Gandereño',3)
insert into Colonia (Nombre,ID_Ciudad)
values('Las Plazas',3)
insert into Colonia (Nombre,ID_Ciudad)
values('Petrolera',3)
insert into Colonia (Nombre,ID_Ciudad)
values('La Matanza',4)
insert into Colonia (Nombre,ID_Ciudad)
values('Satelite',7)
insert into Colonia (Nombre,ID_Ciudad)
values('Obrera',5)
insert into Colonia (Nombre,ID_Ciudad)
values('El Pedregal',6)
insert into Colonia (Nombre,ID_Ciudad)
values('Real de Sevilla',7)

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








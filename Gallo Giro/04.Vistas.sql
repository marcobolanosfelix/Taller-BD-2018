---Vistas
---#1
use [Gallo Giro]
Go
Create view Fecha
as
select DATEADD(day,(rand()*(datediff(day,'04-12-2016',getdate())-1))+1,'04-12-2016') as Fecharandom
Go

Create view Hora
as
select convert(time,DATEADD(MILLISECOND,rand()*(datediff(MILLISECOND,'00:00:00','23:59:59')+1),'00:00:00')) as Horarandom
Go

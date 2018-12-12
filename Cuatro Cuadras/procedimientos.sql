create proc ActualizaLugar @idLugar int, @nombre nvarchar(50) as
update lugar set nombre = @nombre where id = @idLugar

create proc ActualizaLugarLugar @idLugar int, @latitud decimal(5,2), @longitud decimal(5,2) as
update lugar set latitud = @latitud, longitud = @longitud where id = @idLugar


create proc ActualizarNomUsuario  @id int, @nombre_usuario nvarchar(30) as
update Usuario set nombre_usuario=@nombre_usuario where id=@id


create Procedure Alta_Medico(
@nombre varchar(100),
@apellido varchar(100),
@idespecialidad int,
@descripcion varchar(1000))
as
IF not exists (select top 1 idMedico from Medico where nombre = @nombre and @apellido = apellido)
begin

		insert into Medico(nombre, apellido, idespecialidad)
		values(@nombre, @apellido, @idespecialidad);
		
		
end;

exec Alta_Medico 'Gerardo', 'Martinez', 2, 'Viene los viernes';
create function concatenar(
@apellido varchar(50),
@nombre varchar(50))
returns varchar (100)
as
begin
	declare @resultado varchar(100);
	set @resultado = @nombre + '  ' + @apellido;
	return @resultado;
end;

select dbo.concatenar('roberto', 'Lopez')
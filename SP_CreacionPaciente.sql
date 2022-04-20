
Alter procedure Alta_Paciente(
@dni varchar(20),
@nombre varchar(20),
@apellido varchar(20),
@fnacimiento varchar(15),
@domicilio varchar(20),
@idPais char(3),
@tel varchar(20) = '',
@email varchar(30),
@obs varchar(1000) = '')

as
begin
		if not exists(select * from Paciente as P where @dni = P.dni)
		begin
				insert into Paciente(dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
				values (@dni, @nombre, @apellido, @fnacimiento, @domicilio, @idPais, @tel, @email, @obs);
				print 'Se agregó un paciente';
				return;
		end
		else
		begin
				print 'Ya existe el paciente';
				print @dni
				select * from Paciente as P where @dni = P.dni
				return;
		end;

end;



exec Alta_Paciente '34.444.333', 'Barbbara', 'Straisand',  '20200303 20:59', 'acá cerca', 'MEX', '1111 1111', 'bs@gmail.com', 'La de la esquina'


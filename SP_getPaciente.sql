CREATE PROCEDURE SP_getPaciente(
@idpaciente int)
as

select apellido, nombre, idPais, observacion, (SELECT pais FROM Pais as P WHERE P.idPais = PA.idPais) from Paciente as PA where idPaciente = @idpaciente;

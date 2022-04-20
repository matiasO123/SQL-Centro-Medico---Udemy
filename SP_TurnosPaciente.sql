create procedure TurnosPaciente(
@pacienteID int)
as
begin
	-- Trae todos los turnos, con sus pacientes, fechas y médicos
select Paciente.nombre + ',' + Paciente.apellido as 'Paciente' , Turno.fechaTurno, Medico.nombre+ ',' +Medico.apellido as 'Medico' from Paciente INNER JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente INNER JOIN Medico ON Medico.idMedico = TurnoPaciente.idMedico INNER JOIN Turno ON Turno.idTurno = TurnoPaciente.idTurno
WHERE Paciente.idPaciente = @pacienteID;
end;

exec TurnosPaciente 1

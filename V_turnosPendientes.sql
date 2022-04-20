create view PacientesTurnos as
Select Paciente.nombre + ' ' + Paciente.apellido as 'Paciente', Turno.fechaTurno from  Paciente INNER JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente
INNER JOIN Turno ON Turno.idTurno = TurnoPaciente.idTurno
Where Turno.estado = 0


select * from PacientesTurnos
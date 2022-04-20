select * from Paciente
select * from Turno
select * from TurnoPaciente
select * from medico

-- Trae los que conciden entre las dos tablas
select nombre,apellido, idTurno, idMedico from Paciente INNER JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente

-- Trae todos los Pacientes y sus turnos
select nombre,apellido, idTurno, idMedico from Paciente left JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente

-- Trae todos los turnos, con sus pacientes
select nombre,apellido, idTurno, idMedico from Paciente right JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente


-- Trae todos los turnos, con sus pacientes, fechas y médicos
select Paciente.nombre + ',' + Paciente.apellido as 'Paciente' , Turno.fechaTurno, Medico.nombre+ ',' +Medico.apellido as 'Medico' from Paciente INNER JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente INNER JOIN Medico ON Medico.idMedico = TurnoPaciente.idMedico INNER JOIN Turno ON Turno.idTurno = TurnoPaciente.idTurno


-- Une varias consultas como si fuesen una sin repetirlos
select * from Turno where estado = 2
UNION
select * from Turno where estado = 2
UNION
select * from Turno where estado = 0;

-- Une varias consultas como si fuesen una
select * from Turno where estado = 2
UNION ALL 
select * from Turno where estado = 2
UNION ALL 
select * from Turno where estado = 0;
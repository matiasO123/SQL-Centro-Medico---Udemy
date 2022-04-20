Create Procedure Alta_Turno(
@fecha dateTime,
@idpaciente paciente,
@idmedico medico,
@observacion varchar(1000))
as
IF not exists (select top 1 idTurno from Turno where fechaTurno = @fecha)
begin
		insert into Turno(fechaTurno, estado, observacion)
		values(@fecha, 0, @observacion);
		declare @auxIDTurno turno;
		set @auxIDTurno = @@IDENTITY;
		insert into TurnoPaciente(idTurno, idPaciente, idMedico)
		values (@auxIDTurno, @idpaciente, @idmedico);
end;

exec Alta_Turno '20220422 10:30',5, 1, 'Atención urgente'; 
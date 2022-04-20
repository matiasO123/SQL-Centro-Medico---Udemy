CREATE TRIGGER PacientesCreados ON Paciente
AFTER INSERT
AS
IF(SELECT idPais FROM inserted) = 'MEX'
INSERT INTO PacienteLog(idPaciente, idpais, fechaAlta)
SELECT i.idPaciente, i.idPais, GETDATE() FROM Inserted i


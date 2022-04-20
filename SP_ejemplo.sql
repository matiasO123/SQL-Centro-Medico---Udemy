USE [SQLCentroMedico]
GO

/****** Object:  StoredProcedure [dbo].[Ejemplo]    Script Date: 07-Apr-22 10:16:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Ejemplo](
@idpaciente int)
as

select * from Paciente where idPaciente = @idpaciente;
GO



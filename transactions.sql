begin transaction
		update paciente set telefono = 444 where idPaciente = 8;
		if @@ROWCOUNT = 1
				commit transaction
		else
				rollback transaction

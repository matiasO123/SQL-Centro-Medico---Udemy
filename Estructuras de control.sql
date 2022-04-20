--
-- IF
--
DECLARE @idPaciente int
DECLARE @idTurno int

set @idPaciente = 7;
if (@idPaciente = 7)
begin
		set @idTurno = 20;
		if exists(select * from Paciente where idPaciente = 1)
		begin
				print 'Existe el registro';
		end
		select * from Paciente where idPaciente = @idPaciente;
		print @idTurno;
end
else
begin
		print 25;
		print 'No se cumple la condición';
end;


--
-- WHILE
--
DECLARE @contador int = 0
while @contador < 10
begin 
		print @contador
		SET @contador = @contador + 1;
end



--
--CASE
--
DECLARE @valor int = 10
declare @resultado char(10) = ''

set @resultado = (Case when @valor = 10 then 'rojo'
when @valor = 20 then 'verde' end)

print @resultado



-- SELECT con CASE
select *, (Case when estado= 1 then 'rojo'
when estado = 0 then 'verde'
when estado = 2 then 'azul'
else 'gris' end) as 'Color_turno'
from Turno



--
-- while e if con return (sale de todo procedimiento)
--
DECLARE @contadorcito int = 0
while @contadorcito < 10
begin 
		if @contadorcito = 3
				return
		print @contadorcito
		SET @contadorcito = @contadorcito + 1;
end
print 'Sigue ejecutando' -- No se ejecuta





--
-- while e if con break (sale de la función, pero sigue ejecutando el resto)
--
DECLARE @contadorc int = 0
while @contadorc < 10
begin 
		if @contadorc = 3
				break
		print @contadorc
		SET @contadorc = @contadorc + 1;
end
print 'sigue ejecutando'




--
--TRY -CATCH
--
declare @cont int 
begin try
		set @cont = 'texto'
end try
begin catch
		print 'No se puede convertir variable int en string'
end catch

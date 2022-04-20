USE SQLCentroMedico;


-- Inserciones
INSERT INTO Turno VALUES ('20200303 13:00', 0, '');
INSERT INTO Turno VALUES ('20200303 14:00', 0, '');
INSERT INTO Turno VALUES ('20200303 15:30', 1, 'El paciente fue atendido');
INSERT INTO Turno VALUES ('20200303 18:00', 2, 'El paciente llamó para cancelar el turno');

INSERT INTO  dbo.Paciente (nombre, apellido, observacion, idPais) VALUES('Pepe', 'Argento', 'Tipo copado', 'BRA'),
('Ernesto', 'Sanchez', 'paciente de rehabilitación', 'ARG'),
('Fabricio', 'Guevara', 'rubio, alto, zapatillas negras', 'BRA'),
('Silvia', 'Rodríguez', ' Señora que llega tarde', 'ARG'),
('Pepe', 'Argento', 'Tipo copado', 'ALE'),
('Ernesto', 'Sanchez', 'paciente de rehabilitación', 'BRA'),
('Fabricio', 'Guevara', 'rubio, alto, zapatillas negras', 'ARG'),
('Silvia', 'Rodríguez', ' Señora que llega tarde', 'ALE'),
('Pepito', 'Argenti', 'Tipo copado', 'ALE'),
('Ernestino', 'Sanchezi', 'paciente de rehabilitación', 'BRA'),
('Fabriciano', 'Guevarindo', 'rubio, alto, zapatillas negras', 'ALE'),
('Silvia', 'Rodríguezinti', ' Señora que llega temprano', 'BRA');

INSERT INTO Pais (idPais, pais) VALUES('MEX', 'Mexico'), ('ARG', 'Argentina'), ('ALE', 'Alemania'), ('BRA', 'Brasil');

-- Modificando registros
Update Paciente set apellido = 'Sanguinetti' WHERE apellido = 'Sanchez';

-- Eliminando registros
delete from Paciente where apellido = 'Sanchez';

-- Devolviendo valores con limitacion
Select top 10 * from Paciente;

-- Devolviendo valores sin repetirlos
Select distinct top 10  nombre FROM Paciente;

-- Devolviendo con group by
Select nombre from Paciente Group by nombre

--
-- FUNCIONES DE AGREGADO
--
Select MIN(idPaciente) FROM Paciente
Select MAX(idPaciente) FROM Paciente
Select SUM(idPaciente) FROM Paciente -- suma los ids
Select SUM(idPaciente), nombre FROM Paciente group by nombre -- suma los ids agrupados por nombre
Select AVG(idPaciente) FROM Paciente -- promedio de ids
Select  AVG(idPaciente), nombre FROM Paciente group by nombre -- promedia los ids agrupados por nombre
Select COUNT(idPaciente) FROM Paciente -- cuenta los registros
Select SUM(idPaciente), nombre FROM Paciente group by nombre having SUM(idPaciente) > 22  -- suma los ids agrupados por nombre y los trae filtrados
Select  AVG(idPaciente), nombre FROM Paciente group by nombre having AVG(idPaciente)> 6-- promedia los ids agrupados por nombre y los trae filtrados


-- 
-- OPERADORES LÓGICOS
-- 
-- and
select idPaciente, nombre, apellido from Paciente Where nombre = 'Ernesto' AND idPaciente = 8
--or
select idPaciente, nombre, apellido from Paciente Where nombre = 'Ernesto' OR idPaciente = 4
--in
select idPaciente, nombre, apellido from Paciente Where nombre in('Ernesto', 'Silvia', 'Pepe')
-- Like
select idPaciente, nombre, apellido from Paciente Where nombre Like  'Pep%'
-- Not
select idPaciente, nombre, apellido from Paciente Where nombre not in('Ernesto', 'Silvia', 'Pepe')
-- Between
select idPaciente, nombre, apellido from Paciente Where idPaciente between 3 and 9





--
-- LLAMAR A UN PROCEDIMIENTO
--
exec Alta_Paciente '37999999', 'Juan', 'Olivos', '20200303 18:00', 'Formosa', 'ARG', '', 'juanOli@gmail.com',''


-- FUNCIÓN SOBRE TEXT
declare @var1 varchar(15) = 'Papanata';
-- toma ciertos caracteres desde la izquierda
print left(@var1, 4);
-- toma ciertos caracteres desde la derecha
print right(@var1, 4);
-- cuenta la cantidad de caracteres
print LEN(@var1);
print @var1 + '-- parada de control';
-- Pasa todo a minúsculas
print LOWER(@var1);
-- Pasa todo a mayúscula
print UPPER(@var1);
print UPPER(LEFT(@var1,1)) +  LOWER(RIGHT(@var1,Len(@var1)-1))
-- Reemplaza caracteres en una cadena de texto
select replace(@var1,'a','e');
print @var1 + '-- parada de control';
-- Rellena textos
print replicate('0',5);
-- recortar textos
set @var1 = '    ' + @var1 + '       ';
print @var1 + '-- parada de control';
select (LTRIM(rtrim(@var1)));
select concat(@var1, ' ' ,@var1);




-- FUNCIONES SOBRE FECHAS
select getdate();
-- Añadiendo diferentes tiempos a una fecha
select dateadd(day,2,getdate())
select dateadd(hour,2,getdate())
select dateadd(year,2,getdate())
-- ver diferencia entre una fecha y otra
select DATEDIFF(month, dateadd(MM,20,getdate()), getdate());
-- ver partes específicas de una fecha
select datepart(year, getdate())
select datepart(dw, getdate())
-- ver si es fecha
print isdate('ramiro');
print isdate('20281108')

-- convertir datos
declare @var2 numeric = 500.60;
select cast( @var2 as int) as numerilloCast;
select convert(int, @var2) as numerilloConvert;
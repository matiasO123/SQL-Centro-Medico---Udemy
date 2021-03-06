USE [master]
GO
/****** Object:  Database [SQLCentroMedico]    Script Date: 20-Apr-22 2:26:11 PM ******/
CREATE DATABASE [SQLCentroMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLCentroMedico', FILENAME = N'C:\SQLCentroMedico\SQLCentroMedico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQLCentroMedico_log', FILENAME = N'C:\SQLCentroMedico\SQLCentroMedico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SQLCentroMedico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLCentroMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQLCentroMedico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQLCentroMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQLCentroMedico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SQLCentroMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQLCentroMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SQLCentroMedico] SET  MULTI_USER 
GO
ALTER DATABASE [SQLCentroMedico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQLCentroMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQLCentroMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQLCentroMedico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQLCentroMedico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQLCentroMedico] SET QUERY_STORE = OFF
GO
USE [SQLCentroMedico]
GO
/****** Object:  User [matias93]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE USER [matias93] FOR LOGIN [matias93] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [loginCentroMedico]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE USER [loginCentroMedico] FOR LOGIN [LoginCentroMedico] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [centroMedicoTurnos]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE USER [centroMedicoTurnos] FOR LOGIN [centroMedicoTurnos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [adminTurnos]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE ROLE [adminTurnos]
GO
ALTER ROLE [db_owner] ADD MEMBER [loginCentroMedico]
GO
ALTER ROLE [adminTurnos] ADD MEMBER [centroMedicoTurnos]
GO
/****** Object:  UserDefinedDataType [dbo].[historia]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE TYPE [dbo].[historia] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[medico]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE TYPE [dbo].[medico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[paciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE TYPE [dbo].[paciente] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[turno]    Script Date: 20-Apr-22 2:26:12 PM ******/
CREATE TYPE [dbo].[turno] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedFunction [dbo].[concatenar]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[concatenar](
@apellido varchar(50),
@nombre varchar(50))
returns varchar (100)
as
begin
	declare @resultado varchar(100);
	set @resultado = @nombre + '  ' + @apellido;
	return @resultado;
end;
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[dni] [varchar](15) NOT NULL,
	[idPaciente] [dbo].[paciente] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[fNacimiento] [date] NULL,
	[domicilio] [nchar](50) NULL,
	[idPais] [char](3) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](30) NULL,
	[observacion] [varchar](100) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoPaciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPaciente](
	[idTurno] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
 CONSTRAINT [PK_TurnoPaciente] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [dbo].[turno] IDENTITY(1,1) NOT NULL,
	[fechaTurno] [datetime] NULL,
	[estado] [smallint] NULL,
	[observacion] [varchar](300) NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PacientesTurnos]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PacientesTurnos] as
Select Paciente.nombre + ' ' + Paciente.apellido as 'Paciente', Turno.fechaTurno from  Paciente INNER JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente
INNER JOIN Turno ON Turno.idTurno = TurnoPaciente.idTurno
Where Turno.estado = 0
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idconcepto] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[idconcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](30) NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia](
	[idHistoria] [dbo].[historia] NOT NULL,
	[fechaHistoria] [datetime] NULL,
	[observacion] [varchar](2000) NULL,
 CONSTRAINT [PK_Historia] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaPaciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaPaciente](
	[idHistoria] [dbo].[historia] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_HistoriaPaciente] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[idespecialidad] [int] NOT NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicoEspecialidad]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idMedico] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_MedicoEspecialidad] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PacienteLog]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacienteLog](
	[idpaciente] [int] NOT NULL,
	[idpais] [varchar](10) NULL,
	[fechaAlta] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[concepto] [tinyint] NULL,
	[fecha] [datetime] NULL,
	[monto] [money] NULL,
	[estado] [tinyint] NULL,
	[obs] [varchar](100) NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoPaciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoPaciente](
	[idpago] [int] NOT NULL,
	[idpaciente] [int] NOT NULL,
	[idturno] [int] NOT NULL,
 CONSTRAINT [PK_PagoPaciente] PRIMARY KEY CLUSTERED 
(
	[idpago] ASC,
	[idpaciente] ASC,
	[idturno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [char](3) NOT NULL,
	[pais] [nchar](10) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoEstado]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoEstado](
	[idestado] [smallint] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TurnoEstado] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Paciente] ADD  CONSTRAINT [DF_Paciente_dni]  DEFAULT ('-') FOR [dni]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Historia] FOREIGN KEY([idHistoria])
REFERENCES [dbo].[Historia] ([idHistoria])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Historia]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Paciente]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Especialidad]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Medico]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Concepto] FOREIGN KEY([concepto])
REFERENCES [dbo].[Concepto] ([idconcepto])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Concepto]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Paciente] FOREIGN KEY([idpaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Paciente]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Pago] FOREIGN KEY([idpago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Pago]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_TurnoEstado] FOREIGN KEY([estado])
REFERENCES [dbo].[TurnoEstado] ([idestado])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_TurnoEstado]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Medico]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Paciente]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Turno]
GO
/****** Object:  StoredProcedure [dbo].[Alta_Especialidad]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Alta_Especialidad](
@especialidad varchar(100))
as
begin
		insert into Especialidad(especialidad)
		values(@especialidad);
end;
GO
/****** Object:  StoredProcedure [dbo].[Alta_Medico]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Alta_Medico](
@nombre varchar(100),
@apellido varchar(100),
@idespecialidad int,
@descripcion varchar(1000))
as
IF not exists (select top 1 idMedico from medico where nombre = @nombre and @apellido = apellido)
begin

		insert into Medico(nombre, apellido, idespecialidad)
		values(@nombre, @apellido, @idespecialidad);
		
		
end;
GO
/****** Object:  StoredProcedure [dbo].[Alta_Paciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Alta_Paciente](
@dni varchar(20),
@nombre varchar(20),
@apellido varchar(20),
@fnacimiento varchar(15),
@domicilio varchar(20),
@idPais char(3),
@tel varchar(20) = '',
@email varchar(30),
@obs varchar(1000) = '')


as
begin
		if not exists(select * from Paciente as P where @dni = P.dni)
		begin
				insert into Paciente(dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
				values (@dni, @nombre, @apellido, @fnacimiento, @domicilio, @idPais, @tel, @email, @obs);
				print 'Se agregó un paciente';
				return;
		end
		else
		begin
				print 'Ya existe el paciente';
				print @dni
				select * from Paciente as P where @dni = P.dni
				return;
		end;

end;

GO
/****** Object:  StoredProcedure [dbo].[Alta_Turno]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Alta_Turno](
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
GO
/****** Object:  StoredProcedure [dbo].[Ejemplo]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ejemplo](
@idpaciente int)
as

select * from Paciente where idPaciente = @idpaciente;
GO
/****** Object:  StoredProcedure [dbo].[SP_getPaciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_getPaciente](
@idpaciente int)
as

select apellido, nombre, idPais, observacion, (SELECT pais FROM Pais as P WHERE P.idPais = PA.idPais) from Paciente as PA where idPaciente = @idpaciente;
GO
/****** Object:  StoredProcedure [dbo].[TurnosPaciente]    Script Date: 20-Apr-22 2:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TurnosPaciente](
@pacienteID int)
as
begin
	-- Trae todos los turnos, con sus pacientes, fechas y médicos
select Paciente.nombre + ',' + Paciente.apellido as 'Paciente' , Turno.fechaTurno, Medico.nombre+ ',' +Medico.apellido as 'Medico' from Paciente INNER JOIN TurnoPaciente ON Paciente.idPaciente = TurnoPaciente.idPaciente INNER JOIN Medico ON Medico.idMedico = TurnoPaciente.idMedico INNER JOIN Turno ON Turno.idTurno = TurnoPaciente.idTurno
WHERE Paciente.idPaciente = @pacienteID;
end;
GO
USE [master]
GO
ALTER DATABASE [SQLCentroMedico] SET  READ_WRITE 
GO

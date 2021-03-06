USE [DB_502ITLA]
GO
/****** Object:  Table [dbo].[ASIGNATURAS]    Script Date: 13/4/2022 11:55:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASIGNATURAS](
	[IdAsignatura] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Creditos] [int] NOT NULL,
	[Modalidad] [varchar](500) NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Cupos] [int] NOT NULL,
	[Hora_Inicio] [time](7) NOT NULL,
	[Hora_termina] [time](7) NOT NULL,
	[Departamento] [varchar](500) NOT NULL,
	[Matricula_Estudiante] [varchar](9) NOT NULL,
	[Matricula_Maestro] [varchar](9) NOT NULL,
 CONSTRAINT [PK__ASIGNATU__94F174B8F58C10F4] PRIMARY KEY CLUSTERED 
(
	[IdAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 13/4/2022 11:55:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarAsignatura]    Script Date: 13/4/2022 11:55:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarAsignatura](
@Descripcion varchar(100),
@Creditos int,
@Modalidad varchar(500),
@Hora date,
@Cupos int,
@Hora_Inicio date,
@Hora_termina date,
@Departamento varchar(500),
@Matricula_Estudiante varchar(9),
@Matricula_Maestro varchar(9),
@Registro bit output,
@Mensaje varchar(100) output
)
as
begin

    if(not exists(select * from ASIGNATURAS where Descripcion = @Descripcion))
	begin
	    insert into ASIGNATURAS(Descripcion,Creditos,Modalidad,Hora,Cupos,Hora_Inicio,Hora_termina,Departamento,Matricula_Estudiante,Matricula_Maestro) values(@Descripcion,@Creditos,@Modalidad,@Hora,@Cupos,@Hora_Inicio,@Hora_termina,@Departamento,@Matricula_Estudiante,@Matricula_Maestro)
		set @Registro = 1
		set @Mensaje = 'Asignatura registrada'
	end
	else
	begin
	    set @Registro = 0
		set @Mensaje = 'Asignatura ya existe'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 13/4/2022 11:55:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarUsuario](
@Correo varchar(100),
@Clave varchar(500),
@Registro bit output,
@Mensaje varchar(100) output
)
as
begin

    if(not exists(select * from USUARIO where Correo = @Correo))
	begin
	    insert into USUARIO(Correo,Clave) values(@Correo, @Clave)
		set @Registro = 1
		set @Mensaje = 'usuario registrado'
	end
	else
	begin
	    set @Registro = 0
		set @Mensaje = 'correo ya existe'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarAsignatura]    Script Date: 13/4/2022 11:55:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ValidarAsignatura](
@Descripcion varchar(100),
@Creditos int,
@Modalidad varchar(500),
@Hora date,
@Cupos int,
@Hora_Inicio date,
@Hora_termina date,
@Departamento varchar(500),
@Matricula_Estudiante varchar(9),
@Matricula_Maestro varchar(9),
@Registro bit output,
@Mensaje varchar(100) output
)
as
begin
    if(exists(select * from ASIGNATURAS where Descripcion = @Descripcion and Hora = @Hora))
	    select IdAsignatura from ASIGNATURAS where Descripcion = @Descripcion and Hora = @Hora
	else
	    select '0'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 13/4/2022 11:55:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ValidarUsuario](
@Correo varchar(100),
@Clave varchar(500)
)
as
begin
    if(exists(select * from USUARIO where Correo = @Correo and Clave = @Clave))
	    select IdUsuario from USUARIO where Correo = @Correo and Clave = @Clave
	else
	    select '0'
end
GO

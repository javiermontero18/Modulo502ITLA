create table ASIGNATURAS(
IdAsignatura int primary key identity(1,1),
Descripcion varchar(100),
Creditos int,
Modalidad varchar(500),
Hora date,
Cupos int,
Hora_Inicio date,
Hora_termina date,
Departamento varchar(500),
Matricula_Estudiante varchar(9),
Matricula_Maestro varchar(9),
)

create proc sp_RegistrarAsignatura(
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

create proc sp_ValidarAsignatura(
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

select * from ASIGNATURAS
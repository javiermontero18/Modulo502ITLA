USE DB_502ITLA


create procedure sp_Lister
as
begin
    select * from ASIGNATURAS
end


create procedure sp_Obtener(
@IdAsignatura int
)
as
begin
    select * from ASIGNATURAS where IdAsignatura = @IdAsignatura
end


create proc sp_Guardar(
@Descripcion varchar(100),
@Creditos int,
@Modalidad varchar(500),
@Hora date,
@Cupos int,
@Hora_Inicio date,
@Hora_termina date,
@Departamento varchar(500),
@Matricula_Estudiante varchar(9),
@Matricula_Maestro varchar(9)
)
as
begin
	insert into ASIGNATURAS(Descripcion,Creditos,Modalidad,Hora,Cupos,Hora_Inicio,Hora_termina,Departamento,Matricula_Estudiante,Matricula_Maestro) values(@Descripcion,@Creditos,@Modalidad,@Hora,@Cupos,@Hora_Inicio,@Hora_termina,@Departamento,@Matricula_Estudiante,@Matricula_Maestro) 
end


create procedure sp_Editar(
@IdAsignatura int,
@Descripcion varchar(100),
@Creditos int,
@Modalidad varchar(500),
@Hora date,
@Cupos int,
@Hora_Inicio date,
@Hora_termina date,
@Departamento varchar(500),
@Matricula_Estudiante varchar(9),
@Matricula_Maestro varchar(9)
)
as
begin
    update ASIGNATURAS set Descripcion = @Descripcion, Creditos = @Creditos, Modalidad = @Modalidad, Hora = @Hora, Cupos = @Cupos,Hora_Inicio = @Hora_Inicio,Hora_termina = @Hora_termina,Departamento = @Departamento,Matricula_Estudiante = @Matricula_Estudiante,Matricula_Maestro = @Matricula_Maestro where IdAsignatura = @IdAsignatura
end

create procedure sp_Eliminar(
@IdAsignatura int
)
as
begin
    delete from ASIGNATURAS where IdAsignatura = @IdAsignatura
end


DROP PROCEDURE sp_Guardar
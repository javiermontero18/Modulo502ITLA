using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using _502ITLA.Models;

namespace _502ITLA.Datos
{
    public class AsignaturaDatos
    {

        public List<Asignatura> Listar()
        {

            var oLista = new List<Asignatura>();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_Listar", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        oLista.Add(new Asignatura()
                        {
                            IdAsignatura = Convert.ToInt32(dr["IdAsignatura"]),
                            Descripcion = dr["Descripcion"].ToString(),
                            Creditos = Convert.ToInt32(dr["Creditos"]),
                            Modalidad = dr["Modalidad"].ToString(),
                            Hora = dr["Hora"].ToString(),
                            Cupos = Convert.ToInt32(dr["Cupos"]),
                            Hora_Inicio = dr["Hora_Inicio"].ToString(),
                            Hora_termina = dr["Hora_termina"].ToString(),
                            Departamento = dr["Departamento"].ToString(),
                            Matricula_Estudiante = dr["Matricula_Estudiante"].ToString(),
                            Matricula_Maestro = dr["Matricula_Maestro"].ToString()
                        });

                    }
                }
            }

            return oLista;
        }

        public Asignatura Obtener(int IdAsignatura)
        {

            var oasignatura = new Asignatura();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_Obtener", conexion);
                cmd.Parameters.AddWithValue("IdAsignatura", IdAsignatura);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        oasignatura.IdAsignatura = Convert.ToInt32(dr["IdAsignatura"]);
                        oasignatura.Descripcion = dr["Descripcion"].ToString();
                        oasignatura.Creditos = Convert.ToInt32(dr["Creditos"]);
                        oasignatura.Modalidad = dr["Modalidad"].ToString();
                        oasignatura.Hora = dr["Hora"].ToString();
                        oasignatura.Cupos = Convert.ToInt32(dr["Cupos"]);
                        oasignatura.Hora_Inicio = dr["Hora_Inicio"].ToString();
                        oasignatura.Hora_termina = dr["Hora_termina"].ToString();
                        oasignatura.Departamento = dr["Departamento"].ToString();
                        oasignatura.Matricula_Estudiante = dr["Matricula_Estudiante"].ToString();
                        oasignatura.Matricula_Maestro = dr["Matricula_Maestro"].ToString();
                    }
                }
            }

            return oasignatura;
        }

        public bool Guardar(Asignatura oasignatura)
        {
            bool rpta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Guardar", conexion);
                    cmd.Parameters.AddWithValue("Descripcion", oasignatura.Descripcion);
                    cmd.Parameters.AddWithValue("Creditos", oasignatura.Creditos);
                    cmd.Parameters.AddWithValue("Modalidad", oasignatura.Modalidad);
                    cmd.Parameters.AddWithValue("Cupos", oasignatura.Cupos);
                    cmd.Parameters.AddWithValue("Hora_Inicio", oasignatura.Hora_Inicio);
                    cmd.Parameters.AddWithValue("Hora_termina", oasignatura.Hora_termina);
                    cmd.Parameters.AddWithValue("Departamento", oasignatura.Departamento);
                    cmd.Parameters.AddWithValue("Matricula_Estudiante", oasignatura.Matricula_Estudiante);
                    cmd.Parameters.AddWithValue("Matricula_Maestro", oasignatura.Matricula_Maestro);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;


            }
            catch (Exception e)
            {

                string error = e.Message;
                rpta = false;
            }



            return rpta;
        }


        public bool Editar(Asignatura oasignatura)
        {
            bool rpta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Editar", conexion);
                    cmd.Parameters.AddWithValue("IdAsignatura", oasignatura.IdAsignatura);
                    cmd.Parameters.AddWithValue("Descripcion", oasignatura.Descripcion);
                    cmd.Parameters.AddWithValue("Creditos", oasignatura.Creditos);
                    cmd.Parameters.AddWithValue("Modalidad", oasignatura.Modalidad);
                    cmd.Parameters.AddWithValue("Cupos", oasignatura.Cupos);
                    cmd.Parameters.AddWithValue("Hora_Inicio", oasignatura.Hora_Inicio);
                    cmd.Parameters.AddWithValue("Hora_termina", oasignatura.Hora_termina);
                    cmd.Parameters.AddWithValue("Departamento", oasignatura.Departamento);
                    cmd.Parameters.AddWithValue("Matricula_Estudiante", oasignatura.Matricula_Estudiante);
                    cmd.Parameters.AddWithValue("Matricula_Maestro", oasignatura.Matricula_Maestro);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;


            }
            catch (Exception e)
            {

                string error = e.Message;
                rpta = false;
            }
            return rpta;
        }

        public bool Eliminar(int IdAsignatura)
        {
            bool rpta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Eliminar", conexion);
                    cmd.Parameters.AddWithValue("IdAsignatura", IdAsignatura);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;


            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;
            }
            return rpta;
        }
    }
}
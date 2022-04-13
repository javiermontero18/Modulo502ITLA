using Org.BouncyCastle.Asn1.Cms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _502ITLA.Models
{
    public class Asignatura
    {
        public int IdAsignatura { get; set; }
        public string Descripcion { get; set; }
        public int Creditos { get; set; }
        public string Modalidad { get; set; }
        public string Hora { get; set; }
        public int Cupos { get; set; }
        public string Hora_Inicio { get; set; }
        public string Hora_termina { get; set; }
        public string Departamento { get; set; }
        public string Matricula_Estudiante { get; set; }
        public string Matricula_Maestro { get; set; }
    }
}
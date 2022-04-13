using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace _502ITLA.Datos
{
    public class Conexion
    {
        private string cadenaSQL = string.Empty;

        public Conexion()
        {
            cadenaSQL = "Data Source=DESKTOP-PK2CBTP;Initial Catalog=DB_502ITLA;Integrated Security=True";
        }

        public string getCadenaSQL()
        {
            return cadenaSQL;
        }
    }
    }
}
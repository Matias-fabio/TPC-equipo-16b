using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioMarca
    {
        public List<Marca> listarMarcas()
        {
            List<Marca> listaMarcas = new List<Marca>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("SELECT Id, Nombre, Logo FROM MARCAS;");
                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    Marca marca = new Marca();
                    marca.Id = (int)accesoDatos.Lector["Id"];
                    marca.Nombre = (string)accesoDatos.Lector["Nombre"];
                    marca.Logo = (string)accesoDatos.Lector["Logo"];
                    listaMarcas.Add(marca);
                }
                return listaMarcas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

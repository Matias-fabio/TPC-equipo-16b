using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEnvios
    {
        public List<Envios> listarEnvios()
        {
            List<Envios> listaEnvios = new List<Envios>();  
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT idZona, Descripcion, precio FROM PRECIO_ENVIOS");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Envios aux = new Envios();
                    aux.IdEnvio = (int)datos.Lector["idZona"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    listaEnvios.Add(aux);
                }
                return listaEnvios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}

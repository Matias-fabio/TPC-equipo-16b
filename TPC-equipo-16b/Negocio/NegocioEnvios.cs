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
        public Envios ObtenerEnvioPorId(int idZonaEnvio)
        {
            AccesoDatos datos = new AccesoDatos();
            Envios envio = null;
            try
            {
                datos.setearConsulta("SELECT idZona, Descripcion, Precio FROM PRECIO_ENVIOS WHERE idZona = @idZona");
                datos.setearParametro("@idZona", idZonaEnvio); datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    envio = new Envios
                    {
                        IdEnvio = (int)datos.Lector["idZona"],
                        Descripcion = (string)datos.Lector["Descripcion"],
                        Precio = (decimal)datos.Lector["Precio"]
                    };
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return envio;
        }

        public bool IdZonaEnvioExiste(int idZonaEnvio)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM PRECIO_ENVIOS WHERE idZona = @idZona");
                datos.setearParametro("@idZona", idZonaEnvio);
                datos.ejecutarLectura();

                if (datos.Lector.Read() && (int)datos.Lector[0] > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
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

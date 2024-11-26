using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioMetodosPago
    {
        public int ObtenerIdMetodoPago(string metodoPago)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdMetodoPago FROM MetodoPago WHERE MetodoPago = @Metodo");
                datos.setearParametro("@Metodo", metodoPago);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return (int)datos.Lector["IdMetodoPago"];
                }
                else
                {
                    throw new Exception("No se encontró el método de pago.");
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
        public List<MetodoPago> ObtenerMetodosPago()
        {
            List<MetodoPago> listaMetodosPago = new List<MetodoPago>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdMetodoPago, MetodoPago FROM MetodoPago");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    MetodoPago metodo = new MetodoPago
                    {
                        IdMetodoPago = (int)datos.Lector["IdMetodoPago"],
                        MetodoNombre = (string)datos.Lector["MetodoPago"]
                    };
                    listaMetodosPago.Add(metodo);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los métodos de pago", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }

            return listaMetodosPago;
        }
    }

}







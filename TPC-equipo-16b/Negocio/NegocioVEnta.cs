using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioVEnta
    {
        public void registrarVenta(Venta venta)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {

            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Venta> listarVentas()
        {
            List<Venta> listaVenta = new List<Venta> ();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "";
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();
                    

                    listaVenta.Add(aux);
                }
                return listaVenta;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}

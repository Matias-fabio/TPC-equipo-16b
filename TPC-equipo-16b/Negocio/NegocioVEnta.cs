using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioVenta
    {
        public void registrarVenta(Venta venta)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "INSERT INTO VENTAS (IdUsuario, FechaVenta, MetodoPago, IdCostoEnvio, TotalVenta, IdEstado) " +
                                  "VALUES (@IdUsuario, @FechaVenta, @MetodoPago, @IdCostoEnvio, @TotalVenta, @IdEstado);";
                datos.setearConsulta(consulta);
                datos.setearParametro("@IdUsuario", venta.Cliente.ID);
                datos.setearParametro("@FechaVenta", venta.FechaVenta);
                datos.setearParametro("@MetodoPago", venta.MetodoPago);
                datos.setearParametro("@IdCostoEnvio", venta.Envio.Id); 
                datos.setearParametro("@TotalVenta", venta.TotalVenta);
                datos.setearParametro("@IdEstado", venta.Estado.Id); 

                datos.ejecutarAccion();
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


        public List<Venta> listarVentas()
        {
            List<Venta> listaVenta = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ListarVentas");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();
                    aux.NumVenta = (int)datos.Lector["NumVenta"];
                    aux.Cliente.Nombre = (string)datos.Lector["Cliente"];
                    aux.Cliente.Email = (string)datos.Lector["Email"];
                    aux.FechaVenta = (DateTime)datos.Lector["Fecha"];
                    aux.MetodoPago = (string)datos.Lector["MetodoPago"];
                    aux.Envio.Descripcion = (string)datos.Lector["Envio"];
                    aux.TotalVenta = (decimal)datos.Lector["ImporteTotal"];
                    aux.Estado.NombreEstado = (string)datos.Lector["Estado"];
                 
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

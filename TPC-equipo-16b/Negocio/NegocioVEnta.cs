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
    public class NegocioVenta
    {
      
            public int registrarVenta(Venta venta)
            {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    string consulta = "INSERT INTO VENTAS (IdUsuario, FechaVenta, TotalVenta, IdMetodoPago, IdCostoEnvio, IdEstado) " +
                                      "VALUES (@IdUsuario, @FechaVenta, @TotalVenta, @IdMetodoPago, @IdCostoEnvio, @IdEstado); " +
                                      "SELECT SCOPE_IDENTITY();";
                    datos.setearConsulta(consulta);
                    datos.setearParametro("@IdUsuario", venta.Cliente.ID);
                    datos.setearParametro("@FechaVenta", venta.FechaVenta);
                    datos.setearParametro("@TotalVenta", venta.TotalVenta);
                    datos.setearParametro("@IdMetodoPago", venta.MetodoPago.IdMetodoPago);
                    datos.setearParametro("@IdCostoEnvio", venta.Envio.Id);
                    datos.setearParametro("@IdEstado", venta.Estado.IdEstado);

                    return datos.ejecutarEscalar();
                }
                catch (SqlException sqlEx)
                {
                    Console.WriteLine("Error SQL: " + sqlEx.Message);
                    throw new Exception("Error al registrar la venta en la base de datos", sqlEx);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                    throw new Exception("Ocurrió un error al registrar la venta", ex);
                }
                finally
                {
                    datos.cerrarConexion();
                }
            }

            public void registrarDetalleVenta(DetalleVenta detalleVenta)
            {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    string consulta = "INSERT INTO DETALLEVENTA (NumVenta, IdArticulo, Cantidad, Precio) " +
                                      "VALUES (@NumVenta, @IdArticulo, @Cantidad, @Precio);";
                    datos.setearConsulta(consulta);
                    datos.setearParametro("@NumVenta", detalleVenta.NumVenta);
                    datos.setearParametro("@IdArticulo", detalleVenta.IdArticulo);
                    datos.setearParametro("@Cantidad", detalleVenta.Cantidad);
                    datos.setearParametro("@Precio", detalleVenta.Precio);

                    datos.ejecutarAccion();
                }
                catch (SqlException sqlEx)
                {
                    Console.WriteLine("Error SQL: " + sqlEx.Message);
                    throw new Exception("Error al registrar el detalle de la venta en la base de datos", sqlEx);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                    throw new Exception("Ocurrió un error al registrar el detalle de la venta", ex);
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
                    aux.MetodoPago.MetodoNombre = (string)datos.Lector["MetodoPago"];
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

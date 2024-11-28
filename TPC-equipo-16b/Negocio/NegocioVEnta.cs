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

        public List<DetalleVenta> ObtenerDetallesVenta(int numVenta)
        {
            List<DetalleVenta> listaDetalleVenta = new List<DetalleVenta>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("SELECT Dv.DetalleVentaID, Dv.NumVenta, A.Nombre AS Articulo, Dv.Cantidad, Dv.Precio" +
                    "FROM DetalleVenta Dv INNER JOIN ARTICULOS A ON Dv.IdArticulo = A.IdArticulo WHERE NumVenta = @NumVenta");
                accesoDatos.setearParametro("@NumVenta", numVenta);

                accesoDatos.ejecutarLectura();
                while (accesoDatos.Lector.Read())
                {
                    DetalleVenta aux = new DetalleVenta();
                    aux.IdDetalleVenta = (int)accesoDatos.Lector["DetalleVentaID"];
                    aux.NumVenta = (int)accesoDatos.Lector["NumVenta"];
                    aux.Articulo.Nombre = (string)accesoDatos.Lector["Articulo"];
                    aux.Cantidad = (int)accesoDatos.Lector["Cantidad"];
                    aux.Precio = (decimal)accesoDatos.Lector["Precio"];

                    listaDetalleVenta.Add(aux);
                }
                return listaDetalleVenta;

            }
            catch (Exception ex)
            {

                throw ex;
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
        public void ActualizarEstadoVenta(int numVenta, int idEstado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE VENTAS SET IdEstado = @IdEstado WHERE NumVenta = @NumVenta");
                datos.setearParametro("@idEstado", idEstado);
                datos.setearParametro("@NumVenta", numVenta);
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
        public List<Venta> ObtenerVentasPorCliente(int idCliente)
        {
            List<Venta> listaVentas = new List<Venta>();
            AccesoDatos datos = new AccesoDatos();
            string consulta = "SELECT V.NumVenta, V.FechaVenta, E.NombreEstado AS Estado, V.TotalVenta, M.MetodoPago AS MetodoPago FROM VENTAS V INNER JOIN EstadoPedido E ON V.IdEstado = E.IdEstado INNER JOIN MetodoPago M ON V.IdMetodoPago = M.IdMetodoPago WHERE V.IdUsuario = @IdUsuario;";
            try
            {
                datos.setearConsulta(consulta);
                datos.setearParametro("@IdUsuario", idCliente);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Venta aux = new Venta();

                    aux.NumVenta = (int)datos.Lector["NumVenta"];
                    aux.FechaVenta = (DateTime)datos.Lector["FechaVenta"];
                    aux.TotalVenta = (decimal)datos.Lector["TotalVenta"];
                    aux.MetodoPago = new MetodoPago();
                    aux.MetodoPago.MetodoNombre = (string)datos.Lector["MetodoPago"];
                    aux.Estado = new Estado();
                    aux.Estado.NombreEstado = (string)datos.Lector["Estado"];

                    listaVentas.Add(aux);
                }

                return listaVentas;
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




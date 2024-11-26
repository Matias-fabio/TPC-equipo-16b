using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioEstado
    {

        public List<Estado> ObtenerEstadosPedido()
        {
            List<Estado> listaEstados = new List<Estado>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT IdEstado, NombreEstado FROM EstadoPedido ");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Estado estado = new Estado
                    {
                        IdEstado = (int)datos.Lector["IdEstado"],
                        NombreEstado = (string)datos.Lector["NombreEstado"]
                    };
                    listaEstados.Add(estado);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los estados de pedido", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }

            return listaEstados;
        }

        public void ActualizarEstadoPedido(int numVenta, int nuevoEstado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE VENTAS SET IdEstado = @NuevoEstado WHERE NumVenta = @NumVenta");
                datos.setearParametro("@NuevoEstado", nuevoEstado);
                datos.setearParametro("@NumVenta", numVenta);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el estado del pedido", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}

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

        public bool MarcaExiste(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();
            bool existe = false;

            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM MARCAS WHERE Nombre = @nombre");
                datos.setearParametro("@nombre", nombre);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    existe = datos.Lector.GetInt32(0) > 0;
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

            return existe;
        }

        public void AgregarMarca(Marca nuevaMarca)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("INSERT INTO MARCAS (Nombre, Logo) VALUES (@nombre, @logo)");
                datos.setearParametro("@nombre", nuevaMarca.Nombre);
                datos.setearParametro("@logo", nuevaMarca.Logo);
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

        public void EliminarMarca(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("DELETE FROM MARCAS WHERE Id = @id");
                datos.setearParametro("@id", id);
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

        public Marca ObtenerMarcaPorId(string id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            Marca marca = null;

            try
            {
                accesoDatos.setearConsulta("SELECT * FROM MARCAS WHERE Id = @id");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    marca = new Marca
                    {
                        Id = (int)accesoDatos.Lector["Id"],
                        Nombre = (string)accesoDatos.Lector["Nombre"],
                        Logo = (string)accesoDatos.Lector["Logo"]
                    };
                }
            }
            catch (Exception ex)
            {
                throw ex; // Manejar el error de forma adecuada en producción
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

            return marca;
        }

        public void ModificarMarca(Marca marca)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE MARCAS SET Nombre = @nombre, Logo = @logo WHERE Id = @id");
                datos.setearParametro("@nombre", marca.Nombre);
                datos.setearParametro("@logo", marca.Logo);
                datos.setearParametro("@id", marca.Id);
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


    }
}

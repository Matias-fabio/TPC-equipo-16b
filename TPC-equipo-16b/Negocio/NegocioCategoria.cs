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
    public class NegocioCategoria
    {

        public List<Categoria> listarCategoriasTop()
        {
            List<Categoria> listaCategorias = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("SELECT TOP 5 c.Id, c.Nombre, c.UrlImagen FROM CATEGORIAS c;");

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria aux = new Categoria();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.UrlImagen = (string)datos.Lector["UrlImagen"];
                    listaCategorias.Add(aux);
                }

                return listaCategorias;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Categoria> listarCategorias()
        {
            List<Categoria> listaCategorias = new List<Categoria>();
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("SELECT  c.Id, c.Nombre as NombreCat, c.UrlImagen FROM CATEGORIAS c;");

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria aux = new Categoria();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["NombreCat"];
                    aux.UrlImagen = (string)datos.Lector["UrlImagen"];
                    listaCategorias.Add(aux);
                }

                return listaCategorias;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Categoria ObtenerCategoriaPorId(string id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            Categoria categoria = null;

            try
            {
                accesoDatos.setearConsulta("SELECT * FROM CATEGORIAS WHERE Id = @id");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    categoria = new Categoria();
                    categoria.Id = (int)accesoDatos.Lector["Id"];
                    categoria.Nombre = (string)accesoDatos.Lector["Nombre"];
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

            return categoria;
        }

    }
}

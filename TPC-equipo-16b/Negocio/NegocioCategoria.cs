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
                throw ex; // Manejar el error de forma adecuada 
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

            return categoria;
        }

        public bool CategoriaExiste(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();
            bool existe = false;

            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM CATEGORIAS WHERE Nombre = @nombre");
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

        public void AgregarCategoria(Categoria nuevaCategoria)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("INSERT INTO CATEGORIAS (Nombre, Descripcion, UrlImagen) VALUES (@nombre, @descripcion, @urlImagen)");
                datos.setearParametro("@nombre", nuevaCategoria.Nombre);
                datos.setearParametro("@descripcion", nuevaCategoria.Descripcion);
                datos.setearParametro("@urlImagen", nuevaCategoria.UrlImagen);
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

        public bool TieneArticulosAsociados(int idCategoria)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("SELECT COUNT(*) FROM ARTICULOS WHERE IdCategoria = @IdCategoria");
                accesoDatos.setearParametro("@IdCategoria", idCategoria);
                accesoDatos.ejecutarLectura();
                if (accesoDatos.Lector.Read())
                {
                    int count = (int)accesoDatos.Lector[0];
                    return count > 0;
                }
                return false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

                accesoDatos.cerrarConexion();

            }
        }


        public bool EliminarCategoria(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("DELETE FROM CATEGORIAS WHERE Id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
                return true;
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
        public void ModificarCategoria(Categoria categoria)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("UPDATE CATEGORIAS SET Nombre = @nombre, Descripcion = @descripcion, UrlImagen = @urlImagen WHERE Id = @id");
                datos.setearParametro("@nombre", categoria.Nombre);
                datos.setearParametro("@descripcion", categoria.Descripcion);
                datos.setearParametro("@urlImagen", categoria.UrlImagen);
                datos.setearParametro("@id", categoria.Id);
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

        public Categoria obtenerCategoriasPorId(int id)
        {
            Categoria categoria = null;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Id, Nombre, Descripcion, UrlImagen FROM CATEGORIAS WHERE Id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    categoria = new Categoria
                    {
                        Id = (int)datos.Lector["Id"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Descripcion = datos.Lector["Descripcion"] as string,
                        UrlImagen = datos.Lector["UrlImagen"] as string
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

            return categoria;
        }


    }
}

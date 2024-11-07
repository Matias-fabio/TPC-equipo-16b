using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NegocioArticulo
    {
        public List<Articulo> listarArticulos()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("SELECT  A.Id, A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, A.ImgUrl AS Img, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca FROM ARTICULOS A JOIN CATEGORIAS C ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id;");
                //pasar consulta a stored procedure
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["ID"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["NombreArticulo"];
                    aux.Descripcion = (string)datos.Lector["DescripcionArticulo"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.categoria = (string)datos.Lector["NombreCategoria"];
                    aux.UrlImagen = (string)datos.Lector["Img"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //metodo momentaneo listararticulos destacados
        public List<Articulo> listarArticulosDestacados()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("SELECT TOP 6 A.Id, A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, A.ImgUrl AS Img, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca FROM ARTICULOS A JOIN CATEGORIAS C ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id;");
                //pasar consulta a stored procedure
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["ID"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["NombreArticulo"];
                    aux.Descripcion = (string)datos.Lector["DescripcionArticulo"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.categoria = (string)datos.Lector["NombreCategoria"];
                    aux.UrlImagen = (string)datos.Lector["Img"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Articulo> CargarProductosPorCategoria(string categoriaID)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT A.Id, A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, A.ImgUrl AS Img, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca " +
                                  "FROM ARTICULOS A " +
                                  "JOIN CATEGORIAS C ON A.IdCategoria = C.Id " +
                                  "JOIN MARCAS M ON A.IdMarca = M.Id " +
                                  "WHERE A.IdCategoria = @CategoriaID";
                //pasar consulta a stored procedure
                datos.setearConsulta(consulta);
                datos.setearParametro("@CategoriaID", categoriaID);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["ID"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["NombreArticulo"];
                    aux.Descripcion = (string)datos.Lector["DescripcionArticulo"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.categoria = (string)datos.Lector["NombreCategoria"];
                    aux.UrlImagen = (string)datos.Lector["Img"];
                    lista.Add(aux);
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

            return lista;
        }

        public List<Articulo> BuscarArticulos(string searchTerm)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearConsulta(@"
                    SELECT a.ID, a.Codigo, a.Nombre, a.Descripcion, a.Precio, a.ImgUrl, 
                    m.Nombre AS Marca, c.Nombre AS Categoria
                    FROM ARTICULOS a
                    INNER JOIN MARCAS m ON a.IdMarca = m.Id
                    INNER JOIN CATEGORIAS c ON a.IdCategoria = c.Id
                    WHERE a.Nombre LIKE @searchTerm OR a.Descripcion LIKE @searchTerm");

                Datos.setearParametro("@searchTerm", "%" + searchTerm + "%");
                Datos.ejecutarLectura();

                while (Datos.Lector.Read())
                {
                    Articulo art = new Articulo();
                    art.Id = (int)Datos.Lector["ID"];
                    art.Codigo = (string)Datos.Lector["Codigo"];
                    art.Nombre = (string)Datos.Lector["Nombre"];
                    art.Descripcion = (string)Datos.Lector["Descripcion"];
                    art.Precio = (decimal)Datos.Lector["Precio"];
                    art.Marca = (string)Datos.Lector["Marca"];
                    art.categoria = (string)Datos.Lector["Categoria"];
                    art.UrlImagen = (string)Datos.Lector["ImgUrl"];
                    lista.Add(art);
                }
            }
            catch (Exception Ex)
            {
                throw new Exception("Error al buscar artículos: " + Ex.Message);
            }
            finally
            {
                Datos.cerrarConexion();
            }

            return lista;
        }




    }
}

using Datos;
using Dominio;
using System;
using System.Collections.Generic;

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

                datos.setearConsulta("SELECT  A.IdArticulo, A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, A.ImgUrl AS Img, A.Stock, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca FROM ARTICULOS A JOIN CATEGORIAS C ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id;");
                //pasar consulta a stored procedure
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["IdArticulo"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["NombreArticulo"];
                    aux.Descripcion = (string)datos.Lector["DescripcionArticulo"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.categoria = (string)datos.Lector["NombreCategoria"];
                    aux.UrlImagen = (string)datos.Lector["Img"];
                    aux.Cantidad = (int)datos.Lector["Stock"];
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

                datos.setearConsulta("SELECT TOP 6 A.IdArticulo, A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, A.ImgUrl AS Img, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca FROM ARTICULOS A JOIN CATEGORIAS C ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id;");
                //pasar consulta a stored procedure
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["IdArticulo"];
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
                string consulta = "SELECT A.IdArticulo, A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, A.ImgUrl AS Img, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca " +
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
                    aux.Id = (int)datos.Lector["IdArticulo"];
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


        public Articulo CargarProducto(int idProducto)
        {
            AccesoDatos datos = new AccesoDatos();
            Articulo aux = new Articulo();
            try
            {
                string consulta = @"
                SELECT A.IdArticulo, A.Codigo, A.Nombre, A.Descripcion, A.Precio, A.ImgUrl, C.Nombre AS Categoria, M.Nombre AS NombreMarca
                FROM ARTICULOS A
                INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id
                INNER JOIN MARCAS M ON A.IdMarca = M.Id
                WHERE A.IdArticulo = @IdProducto";

                //pasar consulta a stored procedure
                datos.setearConsulta(consulta);
                datos.setearParametro("@IdProducto", idProducto);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux.Id = (int)datos.Lector["IdArticulo"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.categoria = (string)datos.Lector["Categoria"];
                    aux.UrlImagen = (string)datos.Lector["ImgUrl"];
                }
                return aux;
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

        public List<Articulo> BuscarArticulos(string searchTerm)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                Datos.setearConsulta(@"
                    SELECT a.IdArticulo, a.Codigo, a.Nombre, a.Descripcion, a.Precio, a.ImgUrl, 
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
                    art.Id = (int)Datos.Lector["IdArticulo"];
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

        public List<string> ObtenerImagenes(int idArt)
        {
            List<string> imagenes = new List<string>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT UrlImagen FROM IMAGENES_ARTICULO WHERE Id_art = @idArticulo");
                datos.setearParametro("@idArticulo", idArt);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    imagenes.Add((string)datos.Lector["UrlImagen"]);
                }
            }
            catch (Exception)
            {

                throw;
            }

            finally
            {
                datos.cerrarConexion();
            }

            return imagenes;
        }

        public List<Articulo> listarArticulosPaginacion(int paginaActual, int cantidad)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_PAGINACION");
                datos.setearParametro("@Offset", (paginaActual - 1) * cantidad);
                datos.setearParametro("@cantidad", cantidad);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo
                    {
                        Id = (int)datos.Lector["IdArticulo"],
                        Codigo = (string)datos.Lector["Codigo"],
                        Nombre = (string)datos.Lector["NombreArticulo"],
                        Descripcion = (string)datos.Lector["DescripcionArticulo"],
                        Precio = (decimal)datos.Lector["Precio"],
                        categoria = (string)datos.Lector["NombreCategoria"],
                        UrlImagen = (string)datos.Lector["Img"]
                    };
                    lista.Add(aux);
                }

                return lista;
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
        public Articulo ObtenerArticuloPorNombre(string nombre)
        {
            AccesoDatos datos = new AccesoDatos();
            Articulo aux = null;
            try
            {
                string consulta = @"
                    SELECT A.IdArticulo, A.Codigo, A.Nombre, A.Descripcion, A.Precio, A.ImgUrl, C.Nombre AS Categoria, M.Nombre AS NombreMarca
                    FROM ARTICULOS A
                    INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id
                    INNER JOIN MARCAS M ON A.IdMarca = M.Id
                    WHERE A.Nombre = @Nombre";

                datos.setearConsulta(consulta);
                datos.setearParametro("@Nombre", nombre);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.categoria = (string)datos.Lector["Categoria"];
                    aux.UrlImagen = (string)datos.Lector["ImgUrl"];
                }
                return aux;
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

        public void AgregarArticulo(Articulo nuevoArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            int nextId = 1;

            try
            {
                // Obtener el próximo ID disponible
                datos.setearConsulta("SELECT ISNULL(MAX(IdArticulo), 0)+ 1 FROM ARTICULOS");
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    nextId = (int)datos.Lector[0];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion(); // Cerrar la conexión después de obtener el próximo ID
            }

            try
            {
                // Generar el código del producto
                string codigoProducto = "PROD" + nextId.ToString("D3");

                // Insertar el nuevo artículo con el código generado
                datos = new AccesoDatos(); // Crear una nueva instancia de AccesoDatos
                datos.setearConsulta("INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio, ImgUrl) VALUES (@codigo, @nombre, @descripcion, @idMarca, @idCategoria, @precio, @imgUrl)");
                datos.setearParametro("@codigo", codigoProducto);
                datos.setearParametro("@nombre", nuevoArticulo.Nombre);
                datos.setearParametro("@descripcion", nuevoArticulo.Descripcion ?? (object)DBNull.Value);
                datos.setearParametro("@idMarca", nuevoArticulo.IdMarca);
                datos.setearParametro("@idCategoria", nuevoArticulo.IdCategoria);
                datos.setearParametro("@precio", nuevoArticulo.Precio);
                datos.setearParametro("@imgUrl", nuevoArticulo.UrlImagen ?? (object)DBNull.Value);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion(); // Cerrar la conexión después de insertar el nuevo artículo
            }
        }

        public void EliminarArticulo(int IdArticulo)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("DELETE from ARTICULOS where IdArticulo = @id");
                accesoDatos.setearParametro("@id", IdArticulo);
                accesoDatos.ejecutarAccion();

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

        public Articulo obtenerArticuloPorId(int id)
        {
            Articulo articulo = null;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT a.IdArticulo, a.Codigo, a.Nombre, a.Descripcion, a.IdMarca, a.IdCategoria, a.Precio, a.ImgUrl, a.Stock ,c.Nombre AS Categoria, m.Nombre AS Marca FROM ARTICULOS a INNER JOIN CATEGORIAS c ON a.IdCategoria = c.Id INNER JOIN MARCAS m ON a.IdMarca = m.Id WHERE a.IdArticulo = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    articulo = new Articulo
                    {
                        Id = (int)datos.Lector["IdArticulo"],
                        Codigo = (string)datos.Lector["Codigo"],
                        Nombre = (string)datos.Lector["Nombre"],
                        Descripcion = datos.Lector["Descripcion"] as string,
                        IdMarca = (int)datos.Lector["IdMarca"],
                        IdCategoria = (int)datos.Lector["IdCategoria"],
                        Precio = (decimal)datos.Lector["Precio"],
                        UrlImagen = datos.Lector["ImgUrl"] as string,
                        categoria = (string)datos.Lector["Categoria"],
                        Marca = (string)datos.Lector["Marca"],
                        Cantidad = (int)datos.Lector["Stock"]
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

            return articulo;
        }

        public void ModificarArticulo(Articulo articulo)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("UPDATE ARTICULOS SET Nombre = @nombre, IdCategoria = @idCategoria, IdMarca = @idMarca, Precio = @precio WHERE IdArticulo = @id");
                accesoDatos.setearParametro("@nombre", articulo.Nombre);
                accesoDatos.setearParametro("@idCategoria", articulo.IdCategoria);
                accesoDatos.setearParametro("@idMarca", articulo.IdMarca);
                accesoDatos.setearParametro("@precio", articulo.Precio);
                accesoDatos.setearParametro("@id", articulo.Id);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex) { throw ex; }
            finally
            {
                accesoDatos.cerrarConexion();
            }

        }

        public bool ActualizarStock(int IdArticulo, int NuevoStock)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE ARTICULOS SET Stock = @NuevoStock WHERE IdArticulo = @IdArticulo");
                datos.setearParametro("@NuevoStock", NuevoStock); 
                datos.setearParametro("@IdArticulo", IdArticulo);
                datos.ejecutarAccion();
                return true;
            }
            catch (Exception ex)
            { 
              throw ex; 
            }
            finally { 
                datos.cerrarConexion(); 
            }
        }
    }
}

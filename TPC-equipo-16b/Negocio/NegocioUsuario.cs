using Datos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Negocio
{
    public class NegocioUsuario
    {
        public Cliente IngresarUsuario(string email, string contraseña)
        {
            AccesoDatos Datos = new AccesoDatos();
            Cliente cliente = null;

            try
            {
                Datos.setearConsulta("SELECT ID, Email, Contraseña, IdRol, Nombre, Apellido FROM Usuarios WHERE Email = @Email AND Contraseña = @Contraseña");

                Datos.setearParametro("@Email", email);
                Datos.setearParametro("@Contraseña", contraseña);

                Console.WriteLine($"Email: {email}, Contraseña: {contraseña}");

                Datos.ejecutarLectura();

                if (Datos.Lector.Read())
                {
                    cliente = new Cliente();
                    cliente.ID = (int)Datos.Lector["ID"];
                    cliente.Email = (string)Datos.Lector["Email"];
                    cliente.Contraseña = (string)Datos.Lector["Contraseña"];
                    cliente.IDAdmin = (int)Datos.Lector["IdRol"]; // Asignar el IDAdmin
                    cliente.Nombre = (string)Datos.Lector["Nombre"];
                    cliente.Apellido = (string)Datos.Lector["Apellido"];
                }
                else
                {
                    Console.WriteLine("No se encontró el usuario.");
                    return null;
                }
            }
            catch (Exception Ex)
            {
                Console.WriteLine("Error: " + Ex.Message);
                throw new Exception("Error al intentar iniciar sesión: " + Ex.Message);
            }
            finally
            {
                Datos.cerrarConexion();
            }
            return cliente;
        }

        public void AgregarUsuario(Cliente cliente)
        {
            AccesoDatos Datos = new AccesoDatos();
            try
            {
                // Verificar si el email ya existe
                Datos.setearConsulta("SELECT COUNT(*) FROM Usuarios WHERE Email = @Email");
                Datos.setearParametro("@Email", cliente.Email);
                Datos.ejecutarLectura();
                if (Datos.Lector.Read() && Convert.ToInt32(Datos.Lector[0]) > 0)
                {
                    throw new Exception("El email ya está registrado.");
                }
                Datos.cerrarConexion();
                Datos.limpiarParametros();

                // Insertar nuevo usuario
                Datos.setearConsulta("INSERT INTO Usuarios (IdRol, Nombre, Apellido, Direccion, Telefono, Email, Contraseña) VALUES " +
                                     "(@IdRol, @Nombre, @Apellido, @Direccion, @Telefono, @Email, @Contraseña)");
                Datos.setearParametro("@IdRol", 1); // IDAdmin predeterminado a 1 para Cliente
                Datos.setearParametro("@Nombre", cliente.Nombre);
                Datos.setearParametro("@Apellido", cliente.Apellido);
                Datos.setearParametro("@Direccion", cliente.Direccion ?? (object)DBNull.Value);
                Datos.setearParametro("@Telefono", cliente.Telefono);
                Datos.setearParametro("@Email", cliente.Email);
                Datos.setearParametro("@Contraseña", cliente.Contraseña);

                Datos.ejecutarAccion();
            }
            catch (Exception Ex)
            {
                throw new Exception("Error al intentar agregar usuario: " + Ex.Message);
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

        public bool RestablecerContraseña(string email, string newPassword)
        {
            AccesoDatos Datos = new AccesoDatos();

            try
            {
                // Verificar si el email existe
                Datos.setearConsulta("SELECT COUNT(*) FROM Usuarios WHERE Email = @Email");
                Datos.setearParametro("@Email", email);
                Datos.ejecutarLectura();

                if (Datos.Lector.Read() && Convert.ToInt32(Datos.Lector[0]) > 0)
                {
                    Datos.cerrarConexion();
                    Datos.limpiarParametros();
                    // Si el email existe, actualizar la contraseña
                    Datos.setearConsulta("UPDATE Usuarios SET Contraseña = @NuevaContraseña WHERE Email = @Email");
                    Datos.setearParametro("@NuevaContraseña", newPassword);
                    Datos.setearParametro("@Email", email);
                    Datos.ejecutarAccion();
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception Ex)
            {
                throw new Exception("Error al restablecer la contraseña: " + Ex.Message);
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

        public void ObtenerUsuarioId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT * FROM Usuarios WHERE ID = @ID");
                datos.setearParametro("@ID", id);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Cliente cliente = new Cliente();
                    cliente.ID = (int)datos.Lector["ID"];
                    cliente.Nombre = (string)datos.Lector["Nombre"];
                    cliente.Apellido = (string)datos.Lector["Apellido"];
                    cliente.Email = (string)datos.Lector["Email"];
                    cliente.Contraseña = (string)datos.Lector["Contraseña"];
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
        }

        public int ObtenerUltimoIDUsuario()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT TOP 1 ID FROM Usuarios ORDER BY ID DESC");
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    return (int)datos.Lector["ID"];
                }
                else
                {
                    throw new Exception("No se pudo obtener el último ID de usuario.");
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
        }
        public Cliente ObtenerUsuarioPorEmail(string email)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT * FROM Usuarios WHERE Email = @Email");
                datos.setearParametro("@Email", email);
                datos.ejecutarLectura();
                Cliente cliente = null;
                if (datos.Lector.Read())
                {
                    cliente = new Cliente
                    {
                        ID = Convert.ToInt32(datos.Lector["ID"]),
                        Email = datos.Lector["Email"] != DBNull.Value ? (string)datos.Lector["Email"] : string.Empty,
                        Contraseña = datos.Lector["Contraseña"] != DBNull.Value ? (string)datos.Lector["Contraseña"] : string.Empty,
                        Nombre = datos.Lector["Nombre"] != DBNull.Value ? (string)datos.Lector["Nombre"] : string.Empty,
                        Apellido = datos.Lector["Apellido"] != DBNull.Value ? (string)datos.Lector["Apellido"] : string.Empty,
                        Direccion = datos.Lector["Direccion"] != DBNull.Value ? (string)datos.Lector["Direccion"] : string.Empty,
                        Telefono = datos.Lector["Telefono"] != DBNull.Value ? (string)datos.Lector["Telefono"] : string.Empty
                    };
                }
                return cliente;
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
        public void actualizarUsuario(Cliente cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Update USUARIOS set Nombre = @nombre, Apellido = @apellido Where ID = @id");
                //datos.setearParametro("@imagen", user.ImagenPerfil != null ? user.ImagenPerfil : (object)DBNull.Value);
                datos.setearParametro("@nombre", cliente.Nombre);
                datos.setearParametro("@apellido", cliente.Apellido);
                datos.setearParametro("@id", cliente.ID);
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

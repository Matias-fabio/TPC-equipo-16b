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
    public class NegocioUsuario
    {
        public Cliente IngresarUsuario(string email, string Contraseña)
        {
            AccesoDatos Datos = new AccesoDatos();
            Cliente cliente = null;

            try
            {
                Datos.setearConsulta("SELECT ID, Email, Contraseña FROM Usuarios WHERE Email = @Email AND Contraseña = @Contraseña");

                Datos.setearParametro("@Email", email);
                Datos.setearParametro("@Contraseña", Contraseña);

                Console.WriteLine($"Email: {email}, Contraseña: {Contraseña}");

                Datos.ejecutarLectura();

                if (Datos.Lector.Read())
                {
                    cliente = new Cliente();
                    cliente.ID = (int)Datos.Lector["ID"];
                    cliente.Email = (string)Datos.Lector["Email"];
                    cliente.Contraseña = (string)Datos.Lector["Contraseña"];
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
                {
                    // Verificar si el email ya existe
                    Datos.setearConsulta("SELECT COUNT(*) FROM Usuarios WHERE Email = @Email"); 
                    Datos.setearParametro("@Email", cliente.Email); 
                    Datos.ejecutarLectura();
                    if (Datos.Lector.Read() && Convert.ToInt32(Datos.Lector[0]) > 0)
                    {
                        throw new Exception("El email ya está registrado.");
                    }


                        Datos.setearConsulta("INSERT INTO Usuarios (IDAdmin, Nombre, Apellido, Direcion, Telefono, Email, Contraseña) VALUES " +
                        "(@IDAdmin, @Nombre, @Apellido, @Direccion, @Telefono, @Email, @Contraseña)");
                    Datos.setearParametro("@IDAdmin", 1);
                    Datos.setearParametro("@Nombre", cliente.Nombre);
                    Datos.setearParametro("@Apellido", cliente.Apellido);
                    Datos.setearParametro("@Direccion", cliente.Direccion);
                    Datos.setearParametro("@Telefono", cliente.Telefono);
                    Datos.setearParametro("@Email", cliente.Email);
                    Datos.setearParametro("@Contraseña", cliente.Contraseña);

                    Datos.ejecutarLectura();
                }
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


    }
}

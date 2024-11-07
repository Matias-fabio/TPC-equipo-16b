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


        public void AgregarUsuario(Cliente Cli)
        {

        }
        public void RestablecerContraseñaUsuario(Cliente Cli)
        {

        }

    }
}

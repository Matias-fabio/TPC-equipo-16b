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
        public void IngresarUsuario(Cliente Cli)
        {
            AccesoDatos Datos = new AccesoDatos();
            try
            {
                Datos.setearConsulta("SELECT ID, Email, Contraseña FROM Usuarios WHERE email = @Email AND contraseña = @Contraseña");
                Datos.setearParametro("@Email", Cli.Email);
                Datos.setearParametro("@Contraseña",Cli.Contraseña);

                Datos.ejecutarAccion();


            }
            catch (Exception Ex){
                throw Ex;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }
        public void AgregarUsuario(Cliente Cli)
        {

        }
        public void RestablecerContraseñaUsuario(Cliente Cli)
        {

        }
    }
}

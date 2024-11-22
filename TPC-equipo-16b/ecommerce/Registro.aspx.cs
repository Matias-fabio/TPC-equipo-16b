using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class Registro1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            Cliente cliente = new Cliente();
            cliente.Nombre = txtNombre.Text;
            cliente.Apellido = txtApellido.Text;
            cliente.Direccion= txtDireccion.Text;
            cliente.Telefono= txtTelefono.Text;
            cliente.Email= txtEmail.Text;
            cliente.Contraseña= txtContraseña.Text;
            try
            {
                negocioUsuario.AgregarUsuario(cliente);

                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message; 
                lblError.Visible = true;
            }
            
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
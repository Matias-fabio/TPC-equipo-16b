using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class RestablecerContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string nuevaContraseña = txtContraseña1.Text;
            string confirmarContraseña = txtContraseña2.Text;

            NegocioUsuario negocioUsuario = new NegocioUsuario();
           
            try
            {
                if (nuevaContraseña != confirmarContraseña)
                {
                    lblError.Text = "Las contraseñas no coinciden";
                    lblError.Visible = true;
                }
                bool Resultado = negocioUsuario.RestablecerContraseña(email, nuevaContraseña);
                if (Resultado)
                {
                    lblMensaje.Text = "La contraseña se ha restablecido correctamente.";
                    lblMensaje.Visible = true; lblError.Visible = false;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblError.Text = "El email no está registrado.";
                    lblError.Visible = true; lblMensaje.Visible = false;
                }

            }
            catch (Exception ex)
            {
                lblError.Text = "Error al restablecer la contraseña"; 
                lblError.Visible = true; lblMensaje.Visible = false;
            }

            
        }

        protected void VolverLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
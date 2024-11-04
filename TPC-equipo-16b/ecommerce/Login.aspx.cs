using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void BotonContraseña_Click(object sender, EventArgs e)
        {
            Response.Redirect("RestablecerContraseña.aspx");
        }

        protected void botonNuevoUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }
    }
}
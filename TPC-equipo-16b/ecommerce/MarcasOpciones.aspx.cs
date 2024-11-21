using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class MarcasOpciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void botonvolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministradorInicio.aspx");
        }

        protected void BotonModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarMarcaAdmin.aspx");
        }

        protected void BotonEliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarMarcaAdmin.aspx");
        }

        protected void botonAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevaMarcaAdmin.aspx");
        }
    }
}
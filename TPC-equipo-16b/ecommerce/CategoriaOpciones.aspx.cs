using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }

        protected void Volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministradorInicio.aspx");
        }

        protected void botonAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevaCategoriaAdmin.aspx");
        }

        protected void BotonEliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarCategoriaAdmin.aspx");
        }

        protected void BotonModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarCategoria.aspx");
        }
    }
}
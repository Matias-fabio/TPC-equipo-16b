using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class WebForm3 : System.Web.UI.Page
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

        protected void ArticuloVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministradorInicio.aspx");
        }

        protected void botonArticulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoArticuloAdmin.aspx");
        }


        protected void ModificarArticulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarArticulo.aspx");
        }

        protected void EliminarArticulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarArticulo.aspx");
        }

        protected void btnInventario_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloStock.aspx");
        }

        protected void InventarioStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("MasStock.aspx");
        }
    }
}
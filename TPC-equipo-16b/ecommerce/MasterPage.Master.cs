using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lbCategorias_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleCategoria.aspx");
        }

        protected void lbCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }
        protected void lbLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lbProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleCategoria.aspx");
        }

        protected void lbNotebooks_Click(object sender, EventArgs e)
        {
            string categoriaId = "1";
            Response.Redirect("DetalleCategoria.aspx?categoriaID=" + categoriaId);
        }

        protected void lbAyuda_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ayuda.aspx");
        }
    }
}
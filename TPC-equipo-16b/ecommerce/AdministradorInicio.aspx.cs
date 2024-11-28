using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"])!= 2)
                {
                    Response.Redirect("Error.aspx");
                }
            }
        }

        protected void botonArticulo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }

        protected void BotonCategoria_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoriaOpciones.aspx");
        }

        protected void BotonMarcas_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasOpciones.aspx");
        }

        protected void BotonUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("usuarioOpciones.aspx");
        }

        protected void botonHistoriaVentas_Click(object sender, EventArgs e)
        {
            Response.Redirect("HistorialVentasOpciones.aspx");
        }

     

        protected void BotonUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificacionUsuario.aspx");
        }
    }
}
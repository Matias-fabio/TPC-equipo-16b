using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class MasStock : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulo();
            }
        }

        NegocioArticulo NegocioArticulo = new NegocioArticulo();
   
        private void CargarArticulo()
        {
            List<Articulo> list = NegocioArticulo.listarArticulos();
            ddlArticulos.DataSource = list;
            ddlArticulos.DataTextField = "Nombre";
            ddlArticulos.DataValueField = "Id";
            ddlArticulos.DataBind();
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }
    }
}
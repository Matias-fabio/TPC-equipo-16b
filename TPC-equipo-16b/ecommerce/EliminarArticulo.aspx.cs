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
    public partial class EliminarArticulo : System.Web.UI.Page
    {
        NegocioArticulo NegocioArticulo = new NegocioArticulo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulo();
            }

             
        }
        private void CargarArticulo()
        {
            List<Articulo> list = NegocioArticulo.listarArticulos();
            ddlArticulos.DataSource = list;
            ddlArticulos.DataTextField = "Nombre";
            ddlArticulos.DataValueField = "Id";
            ddlArticulos.DataBind();
        }

        protected void BotonEliminar_Click(object sender, EventArgs e)
        {
            int IdArticulo;
            if (int.TryParse(ddlArticulos.SelectedValue, out IdArticulo))
            {
                NegocioArticulo.EliminarArticulo(IdArticulo);
                lblMensaje.Text = "Articulo eliminado con exito";
                CargarArticulo();
            }
            else
            {
                lblMensaje.Text = "Por favor selecione un articulo";
            }
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }
    }
}
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
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
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
                lblMensaje.Text = "Artículo desactivado con éxito."; 
                lblMensaje.CssClass = "text-success";
                CargarArticulo();
            }
            else
            {
                lblMensaje.Text = "Por favor selecione un articulo";
                lblMensaje.CssClass = "text-danger";
            }
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }
    }
}
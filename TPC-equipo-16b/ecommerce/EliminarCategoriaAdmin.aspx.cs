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
    public partial class EliminarCategoriaAdmin : System.Web.UI.Page
    {
        NegocioCategoria NegocioCategoria = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategoria();
            }
        }

        private void CargarCategoria()
        {
            List<Categoria> list = NegocioCategoria.listarCategorias();
            ddlCategoria.DataSource = list;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoriaOpciones.aspx");
        }

        protected void BotonEliminar_Click(object sender, EventArgs e)
        {
            int CategoriaId = int.Parse(ddlCategoria.SelectedValue);
            NegocioCategoria.EliminarCategoria(CategoriaId);
            lblMensaje.Text = "Categoría eliminada exitosamente."; 
            lblMensaje.CssClass = "text-success"; 
            lblMensaje.Visible = true; // Recargar las categorías
        }
    }
}
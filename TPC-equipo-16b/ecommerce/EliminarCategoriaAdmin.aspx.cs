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
            if (NegocioCategoria.TieneArticulosAsociados(CategoriaId))
            {
                lblMensaje.Text = "No se puede eliminar esta categoría ya que hay artículos que la usan. Por favor, elimine los artículos o muévalos a otra categoría.";
                lblMensaje.CssClass = "text-danger";
                
            }
            else
            {
                bool Exito = NegocioCategoria.EliminarCategoria(CategoriaId);
                if (Exito)
                {
                    lblMensaje.Text = "Categoria eliminada exitosamente";
                    lblMensaje.CssClass = "text-success";
                    CargarCategoria();
                }
                else
                {
                    lblMensaje.Text = "Error al eliminar la categoría."; 
                    lblMensaje.CssClass = "text-danger";
                }
                
            }

            lblMensaje.Visible = true;

        }
    }
}
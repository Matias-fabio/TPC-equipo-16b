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
    public partial class ModificarCategoria : System.Web.UI.Page
    {
        NegocioCategoria NegocioCategoria = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
                CargarCategoria();
            }
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoriaOpciones.aspx");
        }
        private void CargarCategoria()
        {
            List<Categoria> list = NegocioCategoria.listarCategorias();
            ddlCategoria.DataSource = list;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoriaId = int.Parse(ddlCategoria.SelectedValue);

            Categoria categoria = NegocioCategoria.obtenerCategoriasPorId(categoriaId);

            NuevaCategoria.Text = categoria.Nombre; 
            Descripcionvieja.Text = categoria.Descripcion; 
            urlvieja.Text = categoria.UrlImagen;

        }

        protected void BotonModificar_Click(object sender, EventArgs e)
        {
            int categoriaId = int.Parse(ddlCategoria.SelectedValue);
            Categoria categoriaModificada = new Categoria 
            { 
                Id = categoriaId, 
                Nombre = NuevaCategoria.Text, 
                Descripcion = txtDescripcionNueva.Text, 
                UrlImagen = urlnueva.Text
            };

            NegocioCategoria.ModificarCategoria(categoriaModificada);

            lblMensaje.Text = "Categoría modificada exitosamente.";
            lblMensaje.CssClass = "text-success"; 
            lblMensaje.Visible = true;

            CargarCategoria();

        }
    }
}
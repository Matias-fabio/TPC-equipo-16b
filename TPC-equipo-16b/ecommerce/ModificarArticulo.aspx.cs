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
    public partial class ModificarArticulo : System.Web.UI.Page
    {
        NegocioArticulo NegocioArticulo = new NegocioArticulo();
        NegocioCategoria NegocioCategoria = new NegocioCategoria();
        NegocioMarca NegocioMarca = new NegocioMarca();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulo();
                CargarCategoria();
                CargarMarcas();
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

        private void CargarCategoria()
        {
            List<Categoria> list = NegocioCategoria.listarCategorias();
            ddlCategoria.DataSource = list;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
        }

        private void CargarMarcas()
        {
            List<Marca> list = NegocioMarca.listarMarcas();
            ddlMarca.DataSource = list;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }

        protected void ddlArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obtener el ID del artículo seleccionado
            int articuloId = int.Parse(ddlArticulos.SelectedValue);

            // Llamar al método que obtiene los datos del artículo desde la base de datos
            Articulo articulo = NegocioArticulo.obtenerArticuloPorId(articuloId);

            // Prellenar los campos de categoría y marca viejas
            TextCategoriaVieja.Text = articulo.categoria;
            TextMarcaVieja.Text = articulo.Marca;
            TextPrecioViejo.Text = articulo.Precio.ToString("F2");
        }

    }
}
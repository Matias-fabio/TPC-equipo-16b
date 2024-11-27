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
    public partial class NuevoArticuloAdmin : System.Web.UI.Page
    {
        NegocioCategoria NegocioCategoria = new NegocioCategoria();
        NegocioMarca NegocioMarca = new NegocioMarca();
        NegocioArticulo NegocioArticulo = new NegocioArticulo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
                CargarCategorias();
                CargarMarcas();
            }
        }

        private void CargarCategorias()
        {
            List<Categoria> listaCategorias = NegocioCategoria.listarCategorias();
            ddlCategoria.DataSource = listaCategorias;
            ddlCategoria.DataTextField = "Nombre"; // Esto muestra el nombre en el DropDownList
            ddlCategoria.DataValueField = "Id"; // Esto es el valor seleccionado, en este caso el Id
            ddlCategoria.DataBind();
        }

        private void CargarMarcas()
        {
            List<Marca> listaMarca = NegocioMarca.listarMarcas();
            ddlMarca.DataSource = listaMarca;
            ddlMarca.DataTextField = "Nombre"; // Esto muestra el nombre en el DropDownList
            ddlMarca.DataValueField = "Id"; // Esto es el valor seleccionado, en este caso el Id
            ddlMarca.DataBind();
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            string nombreArticulo = txtNombreArticulo.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();
            decimal precio;
            string urlImagen = TextBox1.Text.Trim();

            if (!decimal.TryParse(txtPrecio.Text, out precio))
            {
                lblMensaje.Text = "Por favor, ingrese un precio válido.";
                return;
            }

            if (string.IsNullOrEmpty(nombreArticulo) || ddlMarca.SelectedValue == "" || ddlCategoria.SelectedValue == "")
            {
                lblMensaje.Text = "Todos los campos son obligatorios.";
                return;
            }

            // Validar que IdCategoria e IdMarca son números válidos
            int idCategoria, idMarca;
            if (!int.TryParse(ddlCategoria.SelectedValue, out idCategoria) || !int.TryParse(ddlMarca.SelectedValue, out idMarca))
            {
                lblMensaje.Text = "Selecciona una categoría y una marca válidas.";
                return;
            }

            Articulo articuloExistente = NegocioArticulo.ObtenerArticuloPorNombre(nombreArticulo);
            if (articuloExistente != null)
            {
                lblMensaje.Text = "Este artículo ya existe.";
            }
            else
            {
                Articulo nuevoArticulo = new Articulo
                {
                    Nombre = nombreArticulo,
                    Descripcion = descripcion,
                    Precio = precio,
                    UrlImagen = urlImagen,
                    IdCategoria = idCategoria,
                    IdMarca = idMarca
                };
                NegocioArticulo.AgregarArticulo(nuevoArticulo);
                lblMensaje.Text = "Artículo agregado exitosamente.";
            }
        }
    }
}

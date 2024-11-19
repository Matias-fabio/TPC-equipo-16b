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
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
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
            ddlMarca.DataTextField = "Id";
            ddlMarca.DataTextField = "Nombre";         
            ddlMarca.DataBind();
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }
    }
}
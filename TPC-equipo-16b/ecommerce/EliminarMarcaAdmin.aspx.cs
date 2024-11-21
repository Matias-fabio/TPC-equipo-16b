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
    public partial class EliminarMarcaAdmin : System.Web.UI.Page
    {
        NegocioMarca NegocioMarca = new NegocioMarca();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMarca();
            }
        }

        protected void CargarMarca()
        {
            List<Marca> list = NegocioMarca.listarMarcas();
            ddlMarca.DataSource = list;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            int MarcaId = int.Parse(ddlMarca.SelectedValue);

            NegocioMarca.EliminarMarca(MarcaId);

            lblMensaje.Text = "Marca eliminada exitosamente."; 
            lblMensaje.CssClass = "text-success";
            lblMensaje.Visible = true;

            CargarMarca();
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasOpciones.aspx");
        }
    }
}
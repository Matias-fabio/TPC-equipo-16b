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
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
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

            if (NegocioMarca.ArticulosAsociados(MarcaId))
            {
                lblMensaje.Text = "No se puede eliminar esta marca ya que hay artículos que la usan. Por favor, elimine los artículos o muévalos a otra marca.";
                lblMensaje.CssClass = "text-danger";
            }
            else
            {
                bool Exito = NegocioMarca.EliminarMarca(MarcaId);
                if (Exito)
                {
                    lblMensaje.Text = "Marca eliminada exitosamente";
                    lblMensaje.CssClass = "text-success";
                    CargarMarca();
                }
                else
                {
                    lblMensaje.Text = "Error al eliminar la marca."; 
                    lblMensaje.CssClass = "text-danger";
                }
            }
            lblMensaje.Visible = true;
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasOpciones.aspx");
        }
    }
}
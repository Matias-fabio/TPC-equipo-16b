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
    public partial class ModificarMarcaAdmin : System.Web.UI.Page
    {

        NegocioMarca NegocioMarca = new NegocioMarca();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMarca();
            }
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {     
             int marcaId = int.Parse(ddlMarca.SelectedValue);
             Marca marca = NegocioMarca.ObtenerMarcaPorId(marcaId.ToString()); 
             NombreNuevoMarca.Text = marca.Nombre;
             urlVieja.Text = marca.Logo; 
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

            Marca ModificarMarca = new Marca();

            ModificarMarca.Nombre = NombreNuevoMarca.Text;
            ModificarMarca.Logo = UrlNueva.Text;
            NegocioMarca.ModificarMarca(ModificarMarca);

            lblMensaje.Text = "Marca modificada exitosamente."; 
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
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
    public partial class NuevaMarcaAdminaspx : System.Web.UI.Page
    {

        NegocioMarca NegocioMarca = new NegocioMarca();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MarcasOpciones.aspx");
        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            string NombreMarca = txtNombremarca.Text.Trim();
            string urlImagen = txturlImagen.Text.Trim();
            if (NegocioMarca.MarcaExiste(NombreMarca))
            {
                lblMensaje.Text = "La marca ya existe."; 
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
            else
            {
                Marca NuevaMarca = new Marca();
                NuevaMarca.Nombre=NombreMarca;
                NuevaMarca.Logo = urlImagen;

                NegocioMarca.AgregarMarca(NuevaMarca);

                lblMensaje.Text = "Marca agregada exitosamente."; 
                lblMensaje.CssClass = "text-success";
                lblMensaje.Visible = true;

                txtNombremarca.Text = string.Empty; 
                txturlImagen.Text = string.Empty;

            }
        }
    }
}
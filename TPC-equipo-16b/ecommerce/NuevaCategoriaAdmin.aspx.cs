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
    public partial class AgregarCategoria : System.Web.UI.Page
    {
        NegocioCategoria NegocioCategoria = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoriaOpciones.aspx");
        }

        protected void BotonAceptar_Click(object sender, EventArgs e)
        {
            string NombreCategoria = txtNombreCategoria.Text.Trim();
            string Descripcion = txtDescripcion.Text.Trim();
            string URLImagen = txturlImagen.Text.Trim();

            if (NegocioCategoria.CategoriaExiste(NombreCategoria))
            {
                lblMensaje.Text = "La categoría ya existe."; 
                lblMensaje.CssClass = "text-danger"; 
                lblMensaje.Visible = true;
            }
            else
            {
                Categoria NuevaCategoria = new Categoria
                {
                    Nombre = txtNombreCategoria.Text,
                    Descripcion = txtDescripcion.Text,
                    UrlImagen = txturlImagen.Text,
                };

                NegocioCategoria.AgregarCategoria(NuevaCategoria);

                lblMensaje.Text = "Categoría agregada exitosamente."; 
                lblMensaje.CssClass = "text-success"; 
                lblMensaje.Visible = true; 

                txtNombreCategoria.Text = string.Empty; 
                txtDescripcion.Text = string.Empty;
                txturlImagen.Text = string.Empty;

            }
        }
    }
}
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
    public partial class MasStock : System.Web.UI.Page
    {
        NegocioArticulo NegocioArticulo = new NegocioArticulo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArticulo();
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

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArticuloOpciones.aspx");
        }

        protected void ddlArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int articuloId = Convert.ToInt32(ddlArticulos.SelectedValue);
            Articulo articulo = NegocioArticulo.obtenerArticuloPorId(articuloId);

            if (articulo != null)
            {
                txtStockActual.Text = articulo.Cantidad.ToString(); // Muestra el stock actual en txtPrecio
            }
        }

        protected void BotonAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                int articuloId = Convert.ToInt32(ddlArticulos.SelectedValue);
                int StockActual = int.Parse(txtStockActual.Text);
                int StockAgregar = int.Parse(txtStockMas.Text);

                int NuevoStock = StockActual + StockAgregar;
                bool Exito = NegocioArticulo.ActualizarStock(articuloId, NuevoStock);
                if (Exito)
                {
                    lblMensaje.Text = "Stock actualizado correctamente."; 
                    lblMensaje.CssClass = "text-success";
                }
                else
                {
                    lblMensaje.Text = "Error al actualizar el stock."; 
                    lblMensaje.CssClass = "text-danger";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message; 
                lblMensaje.CssClass = "text-danger";
            }
        }
    }
}
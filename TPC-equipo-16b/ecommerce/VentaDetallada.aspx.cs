using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace ecommerce
{
    public partial class VentaDetallada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string numVenta = Request.QueryString["NumVenta"];
                if (!string.IsNullOrEmpty(numVenta))
                {
                    lblNumVentaValue.Text = numVenta;
                    CargarDetallesVenta(int.Parse(numVenta));
                }
            }
        }

        private void CargarDetallesVenta(int numVenta)
        {
            // Suponiendo que tienes una clase NegocioVenta con un método para obtener los detalles de la venta
            NegocioVenta negocioVenta = new NegocioVenta();
            List<DetalleVenta> detallesVenta = negocioVenta.ObtenerDetallesVenta(numVenta);

            if (detallesVenta != null && detallesVenta.Count > 0)
            {
                gvDetallesVenta.DataSource = detallesVenta;
                gvDetallesVenta.DataBind();
            }
        }
    }
}

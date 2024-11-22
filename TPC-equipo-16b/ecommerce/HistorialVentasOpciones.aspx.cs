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
    public partial class HistorialVentasOpciones : System.Web.UI.Page
    {
        public List<Venta> ListaVenta { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    NegocioVenta negocioVenta = new NegocioVenta();
                    ListaVenta = negocioVenta.listarVentas();

                    RepHistorialVentas.DataSource = ListaVenta;
                    RepHistorialVentas.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
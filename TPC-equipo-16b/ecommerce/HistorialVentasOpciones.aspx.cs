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
        public List<Estado> listaEstados { get; set; }
        public List<MetodoPago> listaMetodos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    CargarEstados();
                    CargarMetodosPago();
                    CargarVentas();
                }
                catch (Exception ex)
                {
                    // Manejo adecuado de excepciones
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        private void CargarEstados()
        {
            NegocioEstado negocioEstado = new NegocioEstado();
            listaEstados = negocioEstado.ObtenerEstadosPedido();
            ddlEstado.DataSource = listaEstados;
            ddlEstado.DataTextField = "NombreEstado";
            ddlEstado.DataValueField = "IdEstado";
            ddlEstado.DataBind();
        }

        private void CargarMetodosPago()
        {
            NegocioMetodosPago negocioMetodoPago = new NegocioMetodosPago();
            listaMetodos = negocioMetodoPago.ObtenerMetodosPago();
            ddlMedioPago.DataSource = listaMetodos;
            ddlMedioPago.DataTextField = "MetodoNombre";
            ddlMedioPago.DataValueField = "IdMetodoPago";
            ddlMedioPago.DataBind();
        }

        private void CargarVentas()
        {
            NegocioVenta negocioVenta = new NegocioVenta();
            ListaVenta = negocioVenta.listarVentas();
            RepHistorialVentas.DataSource = ListaVenta;
            RepHistorialVentas.DataBind();

            decimal totalVentas = ListaVenta.Sum(v => v.TotalVenta);
            lblFacturacion.Text = totalVentas.ToString("C");

            int cantidadVentas = ListaVenta.Count;
            lblVentas.Text = cantidadVentas.ToString();
            decimal promedioFacturacion = cantidadVentas > 0 ? totalVentas / cantidadVentas : 0;
            lblPromedio.Text = promedioFacturacion.ToString("C");

            int cantidadFinalizados = ListaVenta.Count(v => v.Estado.IdEstado == 3); // hay que arreglar esto
            lblFinalizados.Text = cantidadFinalizados.ToString();
        }

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string numVenta = ((Label)item.FindControl("lblNumVenta")).Text;
            Response.Redirect("VentaDetallada.aspx?NumVenta=" + numVenta);
        }

    }
}

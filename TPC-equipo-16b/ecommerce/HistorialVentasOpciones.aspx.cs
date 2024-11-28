using Dominio;
using Negocio;
using Servicios;
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
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
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

            // Asegurarse de que los estados estén disponibles
            if (listaEstados == null || listaEstados.Count == 0)
            {
                NegocioEstado negocioEstado = new NegocioEstado();
                listaEstados = negocioEstado.ObtenerEstadosPedido();
            }

            RepHistorialVentas.DataSource = ListaVenta;
            RepHistorialVentas.DataBind();

            decimal totalVentas = ListaVenta.Sum(v => v.TotalVenta);
            lblFacturacion.Text = totalVentas.ToString("C");

            int cantidadVentas = ListaVenta.Count;
            lblVentas.Text = cantidadVentas.ToString();
            decimal promedioFacturacion = cantidadVentas > 0 ? totalVentas / cantidadVentas : 0;
            lblPromedio.Text = promedioFacturacion.ToString("C");

            int cantidadFinalizados = ListaVenta.Count(v => v.Estado.IdEstado == 3);
            lblFinalizados.Text = cantidadFinalizados.ToString();
        }

        private void ConfigurarDropDownListEstados(DropDownList ddlCambioEstado, int idEstadoActual)
        {
            ddlCambioEstado.DataSource = listaEstados;
            ddlCambioEstado.DataTextField = "NombreEstado";
            ddlCambioEstado.DataValueField = "IdEstado";
            ddlCambioEstado.DataBind();

            // Verificar si el valor existe antes de asignar
            if (ddlCambioEstado.Items.FindByValue(idEstadoActual.ToString()) != null)
            {
                ddlCambioEstado.SelectedValue = idEstadoActual.ToString();
            }
            else
            {
                Console.WriteLine("El idEstadoActual no se encuentra en el DropDownList: " + idEstadoActual);
            }
        }

        protected void RepHistorialVentas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlCambioEstado = (DropDownList)e.Item.FindControl("ddlCambioEstado");
                var venta = (Venta)e.Item.DataItem;
                ConfigurarDropDownListEstados(ddlCambioEstado, venta.Estado.IdEstado);
            }
        }

        protected void RepHistorialVentas_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            NegocioVenta negocioVenta = new NegocioVenta();
            if (e.CommandName == "ActualizarEstado")
            {
                int numVenta = Convert.ToInt32(e.CommandArgument);
                DropDownList ddlCambioEstado = (DropDownList)e.Item.FindControl("ddlCambioEstado");
                int idEstado = Convert.ToInt32(ddlCambioEstado.SelectedValue);
                negocioVenta.ActualizarEstadoVenta(numVenta, idEstado);
                if (idEstado == 2)
                {
                    // Obtén el email del cliente asociado a la venta
                    Label lblEmail = (Label)e.Item.FindControl("lblEmail");
                    string email = lblEmail.Text;

                    // Configura y envía el correo
                    negocioHelpers negocioHelpers = new negocioHelpers();
                    string codigoSeguimiento = negocioHelpers.GenerarCodigoSeguimiento();
                    EmailService emailService = new EmailService();
                    string asunto = $"$Tu pedido #{numVenta} ha sido enviado";
                    string cuerpo = $"<h1>¡Hola!</h1><p>Tu pedido con número de venta {numVenta} ha sido enviado. Gracias por confiar en nosotros.</p>";
                    cuerpo += $"Tu código de seguimiento es: **{codigoSeguimiento}**";
                    cuerpo += "<p>Esperamos que disfrutes tu compra. Si tienes alguna pregunta, no dudes en contactarnos.</p>";
                    cuerpo += "<p>Saludos cordiales,</p>";
                    cuerpo += "<p>Equipo de E-Commerce</p>";
                    emailService.armarCorreo(email, asunto, cuerpo);

                    try
                    {
                        emailService.enviarEmail();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores al enviar el correo
                        Session.Add("error", ex.ToString());
                        Response.Redirect("Error.aspx", false);
                    }
                }


                else if (idEstado == 4)
                {
                    Label lblEmail = (Label)e.Item.FindControl("lblEmail");
                    string email = lblEmail.Text;

                    EmailService emailService = new EmailService();
                    string asunto = $"$Tu pedido #{numVenta} ha sido cancelado";
                    string cuerpo = $"<h1>¡Hola!</h1><p>Tu pedido con número de venta {numVenta} ha sido cancelado.</p>";
                    cuerpo += "<p>Tu pago no se pudo procesar correctamente. Si tienes alguna pregunta, no dudes en contactarnos.</p>";
                    cuerpo += "<p>Saludos cordiales,</p>";
                    cuerpo += "<p>Equipo de E-Commerce</p>";
                    emailService.armarCorreo(email, asunto, cuerpo);
                    try
                    {
                        emailService.enviarEmail();
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores al enviar el correo
                        Session.Add("error", ex.ToString());
                        Response.Redirect("Error.aspx", false);
                    }
                }

                CargarVentas();
                UdpVentas.Update();

            }
        }

       
        

        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            string numVenta = ((Label)item.FindControl("lblNumVenta")).Text;
            Response.Redirect("VentaDetallada.aspx?NumVenta=" + numVenta);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministradorInicio.aspx");
        }
    }
}

using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class Checkout : System.Web.UI.Page
    {
        public List<Envios> listaEnvios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Carrito"] != null)
                {
                    List<Articulo> carrito = (List<Articulo>)Session["Carrito"];
                    rptDetalleCompra.DataSource = carrito;
                    rptDetalleCompra.DataBind();


                    if (carrito != null && carrito.Count > 0)
                    {
                        decimal total = (decimal)Session["TotalCarrito"];
                        lblTotal.Text = total.ToString("C");
                    }
                }
                else
                {
                    //lblMensaje.Text = "Tu carrito está vacío.";
                }
                try
                {
                    NegocioEnvios negocioEnvios = new NegocioEnvios();
                    listaEnvios = negocioEnvios.listarEnvios();

                    ddlZonaEnvio.DataSource = listaEnvios;
                    ddlZonaEnvio.DataTextField = "Descripcion";
                    ddlZonaEnvio.DataValueField = "Precio";
                    ddlZonaEnvio.DataBind();

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void chkCrearCuenta_CheckedChanged(object sender, EventArgs e)
        {
            pnlPassword.Visible = chkCrearCuenta.Checked;
        }

        protected void btnNext1_Click(object sender, EventArgs e)
        {

        }

        protected void btnFinalizarCompra_Click(object sender, EventArgs e)
        {
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            NegocioVenta negocioVenta = new NegocioVenta();
            try
            {
                if (chkCrearCuenta.Checked)
                {
                    if (txtPassword.Text != txtPasswordRep.Text)
                    {
                        lblError.Text = "Las contraseñas no coinciden.";
                        lblError.Visible = true;
                        return;
                    }
                }
                Cliente cliente = new Cliente();
                cliente.Email = txtEmail.Text;
                cliente.Contraseña = txtPassword.Text;
                cliente.Nombre = txtNombre.Text;
                cliente.Apellido = txtApellido.Text;
                cliente.Telefono = txtTelefono.Text;
                cliente.Direccion = txtDireccion.Text;

                // Registtro de ventas
                Venta venta = new Venta();
                venta.FechaVenta = DateTime.UtcNow;
                if (rblMetodoPago.SelectedItem.Value == "tarjeta")
                    venta.MetodoPago = "tarjeta";
                else
                    venta.MetodoPago = "transferencia";
                venta.TotalVenta = decimal.Parse(Label1.Text);

                venta.Envio.Id = int.Parse(ddlZonaEnvio.SelectedValue);

                negocioVenta.registrarVenta(venta);

                negocioUsuario.AgregarUsuario(cliente);
                lblError.Visible = false;
            }
            catch (Exception ex)
            {
                lblError.Text = "Error al registrar al cliente: " + ex.Message;
                lblError.Text = "error al registrar la venta" + ex.Message;
                lblError.Visible = true;

            }
        }

        protected void ddlZonaEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlZonaEnvio.SelectedValue != "0")
            {
                string precio = ddlZonaEnvio.SelectedValue;
                lblCostoEnvio.Text = $"Costo de envío: ${precio}";
                LblST.Text = $" ${precio}";
            }
            else
            {
                lblCostoEnvio.Text = "Costo de envío: $0";
            }
        }

        protected void rptDetalleCompra_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            List<Articulo> carrito = (List<Articulo>)Session["Carrito"];
            int articuloId = Convert.ToInt32(e.CommandArgument);

            Articulo articulo = carrito.Find(a => a.Id == articuloId);

            if (articulo != null)
            {
                switch (e.CommandName)
                {
                    case "SumarCantidad":
                        articulo.Cantidad++;
                        break;
                    case "RestarCantidad":
                        if (articulo.Cantidad > 1)
                        {
                            articulo.Cantidad--;
                        }
                        break;
                    case "EliminarArticulo":
                        carrito.Remove(articulo);
                        break;
                }

                Session["Carrito"] = carrito;
                rptDetalleCompra.DataSource = carrito;
                rptDetalleCompra.DataBind();

                decimal subtotal = carrito.Sum(item => item.Precio * item.Cantidad);
                lblTotal.Text = subtotal.ToString("C");

                decimal costoEnvio = 0;
                if (ddlZonaEnvio.SelectedValue != "0")
                {
                    costoEnvio = Convert.ToDecimal(ddlZonaEnvio.SelectedValue);
                }

                LblST.Text = $"${costoEnvio}";
                decimal total = subtotal + costoEnvio;
                Label1.Text = total.ToString("C");

                if (carrito.Count == 0)
                {
                    lblTotal.Text = "$0.00";
                    Label1.Text = "$0.00";
                }
            }
        }

        protected void rblMetodoPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (rblMetodoPago.SelectedValue)
            {
                case "Tarjeta":
                    pnlTarjeta.Visible = true;
                    pnlTranferencia.Visible = false;
                    break;

                case "Transferencia":
                    pnlTarjeta.Visible = false;
                    pnlTranferencia.Visible = true;
                    break;

                default:
                    pnlTarjeta.Visible = false;
                    pnlTranferencia.Visible = false;
                    break;

            }

        }

        protected void txtNumeroTarjeta_TextChanged(object sender, EventArgs e)
        {
            lblCardNumero.Text = string.IsNullOrEmpty(txtNumeroTarjeta.Text) ? "#### #### #### ####" : txtNumeroTarjeta.Text;

            string numeroTarjeta = txtNumeroTarjeta.Text;

            string formatoTarjeta = string.Empty;
            for (int i = 0; i < numeroTarjeta.Length; i++)
            {
                if (i > 0 && i % 4 == 0)
                    formatoTarjeta += " ";

                formatoTarjeta += numeroTarjeta[i];
            }
            lblCardNumero.Text = formatoTarjeta;
            txtNumeroTarjeta.Text = formatoTarjeta;

        }

        protected void txtNombreTitular_TextChanged(object sender, EventArgs e)
        {
            lblCardTitual.Text = string.IsNullOrEmpty(txtNombreTitular.Text) ? "Nombre del titular" : txtNombreTitular.Text;
        }

        protected void txtFechaVencimiento_TextChanged(object sender, EventArgs e)
        {
            lblCardVencimiento.Text = string.IsNullOrEmpty(txtFechaVencimiento.Text) ? "MM/YY" : txtFechaVencimiento.Text;
            string fechaVencimineto = txtFechaVencimiento.Text;

            string formatoFecha = string.Empty;
            for (int i = 0; i < fechaVencimineto.Length; i++)
            {
                if (i > 0 && i % 2 == 0)
                    formatoFecha += "/";
                formatoFecha += fechaVencimineto[i];
            }

            lblCardVencimiento.Text = formatoFecha;
            txtFechaVencimiento.Text = formatoFecha;

        }

        protected void txtCVV_TextChanged(object sender, EventArgs e)
        {
            lblCardCVV.Text = string.IsNullOrEmpty(txtCVV.Text) ? "CVV" : txtCVV.Text;
        }
    }
}
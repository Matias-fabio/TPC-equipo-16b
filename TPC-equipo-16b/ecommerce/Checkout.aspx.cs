using Datos;
using Dominio;
using Negocio;
using Servicios;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
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

                    ddlZonaEnvio.Items.Clear();
                    ddlZonaEnvio.Items.Add(new ListItem("Seleccionar zona *", "0"));
                    foreach (var envio in listaEnvios)
                    {
                        string text = $"{envio.Descripcion} - ${envio.Precio}";
                        string value = envio.IdEnvio.ToString();
                        ddlZonaEnvio.Items.Add(new ListItem(text, value));
                    }

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
            string email = txtEmail.Text.Trim();
            string nombre = txtNombre.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            bool crearCuenta = chkCrearCuenta.Checked;
            string password = txtPassword.Text;
            string passwordRep = txtPasswordRep.Text;

            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, @"^[\w.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"))
            {
                lblError.Text = "Por favor, ingresa un correo válido.";
                lblError.Visible = true;
                return;
            }
            if (string.IsNullOrEmpty(nombre) || !Regex.IsMatch(nombre, @"^[A-Za-z\s]+$"))
            {
                lblError.Text = "Por favor, ingresa un nombre válido (solo letras).";
                lblError.Visible = true;
                return;
            }
            if (string.IsNullOrEmpty(apellido) || !Regex.IsMatch(apellido, @"^[A-Za-z\s]+$"))
            {
                lblError.Text = "Por favor, ingresa un apellido válido (solo letras).";
                lblError.Visible = true;
                return;
            }
            if (crearCuenta)
            {
                if (string.IsNullOrEmpty(password) || password.Length < 6)
                {
                    lblError.Text = "La contraseña debe tener al menos 6 caracteres.";
                    lblError.Visible = true;
                    return;
                }
                if (password != passwordRep)
                {
                    lblError.Text = "Las contraseñas no coinciden.";
                    lblError.Visible = true;
                    return;
                }
            }

            bool isFormValid = true;  // Este es un ejemplo; coloca tu lógica de validación aquí.

            if (isFormValid)
            {
                // Si la validación en el servidor es correcta, muestra el paso siguiente en el cliente.
                string script = "showStep(2);";  // Esto avanzará al paso 2.
                ClientScript.RegisterStartupScript(this.GetType(), "showStepScript", script, true);
            }
            else
            {
                // Si no es válido, muestra un mensaje o realiza alguna acción
                string script = "alert('Por favor, complete todos los campos correctamente.');";
                ClientScript.RegisterStartupScript(this.GetType(), "validationAlert", script, true);
            }

        }



        protected void btnFinalizarCompra_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkCrearCuenta.Checked && txtPassword.Text != txtPasswordRep.Text)
                {
                    lblError.Text = "Las contraseñas no coinciden.";
                    lblError.Visible = true;
                    return;
                }



                Cliente cliente = new Cliente
                {
                    Email = txtEmail.Text,
                    Contraseña = txtPassword.Text,
                    Nombre = txtNombre.Text,
                    Apellido = txtApellido.Text,
                    Telefono = txtTelefono.Text,
                    Direccion = txtDireccion.Text
                };

                NegocioUsuario negocioUsuario = new NegocioUsuario();
                negocioUsuario.AgregarUsuario(cliente);

                // Obtener el último ID del usuario creado
                cliente.ID = negocioUsuario.ObtenerUltimoIDUsuario();

                decimal totalVenta;
                if (!decimal.TryParse(lblTotal.Text, NumberStyles.Currency, CultureInfo.CurrentCulture, out totalVenta))
                {
                    lblError.Text = "Error al convertir el total de la venta. Verifica que el formato sea correcto.";
                    lblError.Visible = true;
                    return;
                }
                NegocioEnvios negocioEnvios = new NegocioEnvios();
                int idZonaEnvio;
                if (!int.TryParse(ddlZonaEnvio.SelectedValue, out idZonaEnvio) || !negocioEnvios.IdZonaEnvioExiste(idZonaEnvio))
                {
                    lblError.Text = "El valor de la zona de envío no es válido. Verifica que el formato sea correcto.";
                    lblError.Visible = true;
                    return;
                }

                // Obtener el Id del método de pago
                NegocioMetodosPago negocioMetodosPago = new NegocioMetodosPago();
                int idMetodoPago = negocioMetodosPago.ObtenerIdMetodoPago(rblMetodoPago.SelectedItem.Value);

                Venta venta = new Venta
                {
                    FechaVenta = DateTime.UtcNow,
                    MetodoPago = new MetodoPago { IdMetodoPago = idMetodoPago },
                    TotalVenta = totalVenta,
                    Envio = new Envio { Id = idZonaEnvio },
                    Estado = new Estado { IdEstado = 1 },
                    Cliente = cliente // Asignar el cliente con su ID
                };

                NegocioVenta negocioVenta = new NegocioVenta();
                int numVenta = negocioVenta.registrarVenta(venta);

                // Registrar detalles de la venta
                List<Articulo> carrito = (List<Articulo>)Session["Carrito"];
                foreach (var articulo in carrito)
                {
                    DetalleVenta detalleVenta = new DetalleVenta
                    {

                        NumVenta = numVenta,
                        IdArticulo = articulo.Id,
                        Cantidad = articulo.Cantidad,
                        Precio = articulo.Precio
                    };
                    negocioVenta.registrarDetalleVenta(detalleVenta);
                }
                EmailService emailService = new EmailService();
                string cuerpo = ObtenerCuerpoCorreo(cliente.Nombre, carrito);
                emailService.armarCorreo(cliente.Email, "Confirmación de compra", cuerpo);
                emailService.enviarEmail();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "MostrarModal", "$('#modalAgradecimiento').modal('show');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Redirigir", "setTimeout(function(){ window.location.href = 'Default.aspx'; }, 2000);", true);

                lblError.Visible = false;
            }
            catch (Exception ex)
            {
                lblError.Text = "Ocurrió un error: " + ex.Message;
                lblError.Visible = true;
            }
        }
        private string ObtenerCuerpoCorreo(string nombreCliente, List<Articulo> carrito)
        {
            string body = "<h2> Tu compra ha sido confirmada correctamente</h2><br>";
            body += $"<p>Estimado/a {nombreCliente},</p>";
            body += "<p>Gracias por tu compra en nuestra tienda. Aquí tienes los detalles de tu pedido:</p>";
            body += "<ul>";
            foreach (var articulo in carrito)
            {
                body += $"<li><b>Producto:</b> {articulo.Nombre}</li>";
                body += $"<li><b>Cantidad:</b> {articulo.Cantidad}</li>";
                body += $"<li><b>Precio:</b> {articulo.Precio:C}</li>";
            }
            body += "</ul>";
            body += "<p>Esperamos que disfrutes tu compra. Si tienes alguna pregunta, no dudes en contactarnos.</p>";
            body += "<p>Saludos cordiales,</p>";
            body += "<p>Equipo de [Nombre de la Empresa]</p>";
            return body;

        }

        protected void ddlZonaEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlZonaEnvio.SelectedIndex > 0)
            {
                int idZonaEnvio;
                if (int.TryParse(ddlZonaEnvio.SelectedValue, out idZonaEnvio))
                {

                    NegocioEnvios negocioEnvio = new NegocioEnvios();
                    Envios envioSeleccionado = negocioEnvio.ObtenerEnvioPorId(idZonaEnvio);
                    lblCostoEnvio.Text = $"Costo de envío: ${envioSeleccionado.Precio}";
                }
                else
                {
                    lblCostoEnvio.Text = "Costo de envío: $0";
                }
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
                if (ddlZonaEnvio.SelectedIndex > 0)
                {
                    string selectedText = ddlZonaEnvio.SelectedItem.Text;
                    string[] parts = selectedText.Split('-');
                    if (parts.Length == 2)
                    {
                        decimal.TryParse(parts[1].Trim().Replace("$", ""), out costoEnvio);
                    }
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
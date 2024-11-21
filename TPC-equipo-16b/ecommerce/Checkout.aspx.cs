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
                try
                {
                    NegocioEnvios negocioEnvios = new NegocioEnvios();
                    listaEnvios = negocioEnvios.listarEnvios();

                    ddlZonaEnvio.DataSource = listaEnvios;
                    ddlZonaEnvio.DataTextField = "Descripcion";
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


                negocioUsuario.AgregarUsuario(cliente);
                lblError.Visible = false;
            }
            catch (Exception ex)
            {
                lblError.Text = "Error al registrar al cliente: " + ex.Message;
                lblError.Visible = true;
            }
        }


    }
}
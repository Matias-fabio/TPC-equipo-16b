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
    public partial class usuarioOpciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sessionActiva(Session["cliente"]))
                Response.Redirect("Login.aspx", false);
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sessionActiva(Session["cliente"]))
                    {
                        Cliente user = (Cliente)Session["cliente"];
                        txtEmail.Text = user.Email;
                        txtEmail.ReadOnly = true;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;
                        CargarCompras();
                    }
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }

        }
        protected void CargarCompras()
        {
            try
            {
                Cliente cliente = (Cliente)Session["cliente"];
                NegocioVenta negocio = new NegocioVenta(); // Clase que gestiona VENTAS
                gvCompras.DataSource = negocio.ObtenerVentasPorCliente(cliente.ID); // Método para obtener datos
                gvCompras.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {

                Page.Validate();
                if (!Page.IsValid)
                    return;

                NegocioUsuario negocio = new NegocioUsuario();
                Cliente cliente = (Cliente)Session["cliente"];
                cliente.Nombre = txtNombre.Text;
                cliente.Apellido = txtApellido.Text;

                //guardar datos perfil
                negocio.actualizarUsuario(cliente);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}
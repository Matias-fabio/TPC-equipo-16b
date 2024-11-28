using System;
using Dominio;
using Negocio;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class ModificacionUsuario : System.Web.UI.Page
    {
        NegocioUsuario negocioUsuario = new NegocioUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
                {
                    Response.Redirect("Error.aspx");
                }
                CargarUsuarios();
            }
        }

        protected void CargarUsuarios()
        {
            List<Cliente> lista = negocioUsuario.ListarUsuarios();
            ddlGmailUsuarios.DataSource = lista;
            ddlGmailUsuarios.DataTextField = "Email"; 
            ddlGmailUsuarios.DataValueField = "ID"; 
            ddlGmailUsuarios.DataBind();
        }

        protected void BotonConfirmar_Click(object sender, EventArgs e)
        {
            int selectedUserId = int.Parse(ddlGmailUsuarios.SelectedValue);
            int nuevoRol = rbtnAdmin.Checked ? 2 : 1;
            try
            {
                negocioUsuario.ActualizarRolUsuario(selectedUserId, nuevoRol);
                lblMensaje.Text = "Rol del usuario actualizado correctamente.";
                lblMensaje.CssClass = "text-success"; lblMensaje.Visible = true;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al actualizar el rol del usuario: " + ex.Message;
                lblMensaje.CssClass = "text-danger"; lblMensaje.Visible = true;
            }
        }

        protected void BotonVolver_Click(object sender, EventArgs e)
        {
            
        }
    }

}
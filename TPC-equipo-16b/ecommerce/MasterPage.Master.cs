using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lógica para actualizar cantidad de productos en carrito
                if (Session["Carrito"] != null)
                {
                    List<Articulo> carrito = (List<Articulo>)Session["Carrito"];
                    int cantidadProductos = carrito.Sum(item => item.Cantidad);
                    lblCantidadCarrito.Text = cantidadProductos.ToString();
                }
                else
                {
                    lblCantidadCarrito.Text = "";
                }

                // Lógica para mostrar/ocultar el botón de administrador
                if (Session["IDAdmin"] != null)
                {

                    int idAdmin = Convert.ToInt32(Session["IDAdmin"]);
                    System.Diagnostics.Debug.WriteLine("IDAdmin en la Master Page: " + idAdmin);
                    BotonAdmin.Visible = (idAdmin == 2);



                }
                else
                {
                    BotonAdmin.Visible = false; // Ocultar botón si el usuario no está autenticado
                }

                // Lógica para mostrar/ocultar el botón de ingresar y desloguear
                if (Session["UsuarioLogueado"] != null)
                {

                    btnIngresar.Visible = false; // Ocultar botón de ingresar si el usuario está logueado
                    btnDesloguear.Visible = true; // Mostrar botón de desloguear si el usuario está logueado
                    LnBPerfil.Visible = true;
                }
                else
                {
                    btnIngresar.Visible = true; // Mostrar botón de ingresar si el usuario no está logueado
                    btnDesloguear.Visible = false; // Ocultar botón de desloguear si el usuario no está logueado
                }
            }
        }


        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lbCategorias_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleCategoria.aspx");
        }

        protected void lbCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void lbLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lbProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetalleCategoria.aspx");
        }

        protected void lbNotebooks_Click(object sender, EventArgs e)
        {
            string categoriaId = "1";
            Response.Redirect("DetalleCategoria.aspx?categoriaID=" + categoriaId);
        }

        protected void lbAyuda_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ayuda.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string buscarproducto = txtBuscarProductos.Text;
            Response.Redirect("BuscarProducto.aspx?query=" + buscarproducto);
        }

        protected void BotonAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministradorInicio.aspx");
        }

        protected void btnDesloguear_Click(object sender, EventArgs e)
        {
            Session["IDAdmin"] = null;
            Session["UsuarioLogueado"] = null;
            Response.Redirect("Default.aspx");
        }

        protected void LnBPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("usuarioOpciones.aspx");
        }
    }
}

using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Carrito"] != null)
                {
                    List<Articulo> carrito = (List<Articulo>)Session["Carrito"];
                    rptCarrito.DataSource = carrito;
                    rptCarrito.DataBind();


                    if (carrito != null && carrito.Count > 0)
                    {
                        decimal total = (decimal)Session["TotalCarrito"];
                        lblTotal.Text = total.ToString("C");
                    }
                }
                else
                {
                    lblMensaje.Text = "Tu carrito está vacío.";
                }
            }


        }

        protected void rptCarrito_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                rptCarrito.DataSource = carrito;
                rptCarrito.DataBind();

                decimal total = carrito.Sum(item => item.Precio * item.Cantidad);
                lblTotal.Text = total.ToString("C");

                if (carrito.Count == 0)
                {
                    lblMensaje.Text = "Tu carrito está vacío.";
                    lblTotal.Text = "$0.00";
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button btnEliminar = (Button)sender;
            int idArticulo = Convert.ToInt32(btnEliminar.CommandArgument);

            if (Session["Carrito"] != null)
            {
                List<Articulo> carrito = (List<Articulo>)Session["Carrito"];


                Articulo articuloAEliminar = carrito.FirstOrDefault(a => a.Id == idArticulo);

                if (articuloAEliminar != null)
                {

                    carrito.Remove(articuloAEliminar);

                    Session["Carrito"] = carrito;
                    rptCarrito.DataSource = carrito;
                    rptCarrito.DataBind();

                    if (carrito != null && carrito.Count > 0)
                    {
                        decimal total = carrito.Sum(item => item.Precio * item.Cantidad);
                        lblTotal.Text = total.ToString("C");
                    }
                    else
                    {
                        lblMensaje.Text = "Tu carrito está vacío.";
                        lblTotal.Text = "$0.00";
                    }
                }

            }
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            if (Session["Carrito"] != null)
            {
                List<Articulo> carrito = (List<Articulo>)Session["Carrito"];

                if (carrito.Count > 0)
                {
                    Response.Redirect("Checkout.aspx");
                }
                else
                {
                    lblVacio.Text = "El carrito está vacío, cargue productos.";
                    lblVacio.Visible = true;
                }
            }
            else
            {
                lblVacio.Text = "El carrito está vacío, cargue productos.";
                lblVacio.Visible = true;
            }
        }


    }
}
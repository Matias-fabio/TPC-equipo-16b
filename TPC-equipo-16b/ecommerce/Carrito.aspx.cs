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
                        // Calcular el total 
                        decimal total = carrito.Sum(item => item.Precio);
                        lblTotal.Text = total.ToString("C");
                    }
                }
                else
                {
                    
                    lblMensaje.Text = "Tu carrito está vacío.";
                }
            }


        }
    }
}
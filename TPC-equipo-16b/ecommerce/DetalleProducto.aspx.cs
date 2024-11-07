using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
namespace ecommerce
{
    public partial class DetalleProducto : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            if (!IsPostBack)
            {
                string idProducto = Request.QueryString["Id"];
                if (!string.IsNullOrEmpty(idProducto))
                {
                    List<Articulo> producto = new List<Articulo>();
                    producto.Add(negocio.CargarProducto(int.Parse(idProducto)));
                    rptProducto.DataSource = producto;
                    rptProducto.DataBind();
                }
            }
        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            string idProducto = Request.QueryString["Id"];
            if (!string.IsNullOrEmpty(idProducto))
            {
                NegocioArticulo negocio = new NegocioArticulo();
                Articulo producto = negocio.CargarProducto(int.Parse(idProducto));

                // Verifica si ya existe un carrito en la sesión, si no, lo crea
                List<Articulo> carrito;
                if (Session["Carrito"] == null)
                {
                    carrito = new List<Articulo>();
                }
                else
                {
                    carrito = (List<Articulo>)Session["Carrito"];
                }
                // Añade el producto al carrito
                carrito.Add(producto);
                Session["Carrito"] = carrito;

            }
        }
    }

}
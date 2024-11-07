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
        public Articulo producto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            if (!IsPostBack)
            {
                // Obtén el ID del producto desde la URL
                string idProducto = Request.QueryString["Id"];

                if (!string.IsNullOrEmpty(idProducto))
                {
                    // Llamamos al método que carga los detalles del producto en la vista
                    producto = negocio.CargarProducto(int.Parse(idProducto));
                }
            }
        }
    }

}
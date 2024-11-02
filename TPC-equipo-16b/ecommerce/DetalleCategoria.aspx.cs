using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class DetalleCategoria : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string categoriaID = Request.QueryString["categoriaID"];

                if (!string.IsNullOrEmpty(categoriaID))
                {
                    NegocioArticulo negocio = new NegocioArticulo();
                    try
                    {
                        ListaArticulos = negocio.CargarProductosPorCategoria(categoriaID);

                        if (ListaArticulos != null && ListaArticulos.Count > 0)
                        {
                            repCardArt.DataSource = ListaArticulos;
                            repCardArt.DataBind();
                        }

                    }
                    catch (Exception ex)
                    {
                        // Manejar los errores

                        throw ex;
                    }
                }
            }
        }

    }

}
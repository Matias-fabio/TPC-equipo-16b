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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string searchTerm = Request.QueryString["query"];
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    BuscarArticulos(searchTerm);
                }
            }
        }
        private void BuscarArticulos(string searchTerm)
        {
            NegocioArticulo negocioArticulo = new NegocioArticulo();
            List<Articulo> resultados = negocioArticulo.BuscarArticulos(searchTerm);
            if (resultados.Count > 0)
            {
                repCardArt.DataSource = resultados;
                repCardArt.DataBind();
            }
            else { 
                lblNoResults.Visible = true; 
            }
        }

    }
}
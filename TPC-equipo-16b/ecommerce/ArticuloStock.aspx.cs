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
    public partial class ArticuloStock : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    NegocioArticulo negocio = new NegocioArticulo();
                    ListaArticulo = negocio.listarArticulos();

                    RepStock.DataSource = ListaArticulo;
                    RepStock.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            if (Session["IDAdmin"] == null || Convert.ToInt32(Session["IDAdmin"]) != 2)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}
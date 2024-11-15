using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class DetalleCategoria : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }

        public Categoria categoria { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string categoriaID = Request.QueryString["categoriaID"];
                NegocioArticulo negocioArticulo = new NegocioArticulo();
                NegocioCategoria negocioCategoria = new NegocioCategoria();

                try
                {
                    if (string.IsNullOrEmpty(categoriaID))
                    {
                        ListaArticulos = negocioArticulo.listarArticulos();
                        lblCategoria.Text = "Todos los productos";
                        Session["ListaArticulos"] = ListaArticulos;
                    }
                    else
                    {
                        categoria = negocioCategoria.ObtenerCategoriaPorId(categoriaID);
                        lblCategoria.Text = categoria.Nombre;
                        ListaArticulos = negocioArticulo.CargarProductosPorCategoria(categoriaID); 
                        Session["ListaArticulos"] = ListaArticulos;
                    }
                    if (ListaArticulos != null && ListaArticulos.Count > 0)
                    {
                        repCardArt.DataSource = ListaArticulos;
                        repCardArt.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                ListaArticulos = Session["ListaArticulos"] as List<Articulo>;

                if (ListaArticulos != null)
                {
                    repCardArt.DataSource = ListaArticulos;
                    repCardArt.DataBind();
                }
            }
        }

        protected void VerDetalles_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "VerDetalles")
            {
                string idProducto = e.CommandArgument.ToString();
                Response.Redirect("DetalleProducto.aspx?Id=" + idProducto);
            }
        }
    }

}
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;


namespace ecommerce
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public List<Categoria> ListaCategorias { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioCategoria negocioCategoria = new NegocioCategoria();
            ListaCategorias = negocioCategoria.listarCategorias();
            repCategorias.DataSource = ListaCategorias;
            repCategorias.DataBind();


            NegocioArticulo negocio = new NegocioArticulo();
            ListaArticulos = negocio.listarArticulos();
            repCardArt.DataSource = ListaArticulos;
            repCardArt.DataBind();
        }

        protected void repCategorias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Obtener el ID de la categoría desde CommandArgument
                string categoriaID = e.CommandArgument.ToString();

                // Redirigir a una página diferente según el ID de la categoría
                // Aquí puedes cambiar la URL a la página que quieras redirigir
                Response.Redirect($"DetalleCategoria.aspx?categoriaID={categoriaID}");
            }
        }
    }
}
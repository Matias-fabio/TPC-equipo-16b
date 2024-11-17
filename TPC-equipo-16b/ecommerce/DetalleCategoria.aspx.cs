using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ecommerce
{
    public partial class DetalleCategoria : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public List<Categoria> ListaCategorias { get; set; }
        public Categoria CategoriaSeleccionada { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarArticulos();
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

        private void CargarCategorias()
        {
            try
            {
                NegocioCategoria negocioCategoria = new NegocioCategoria();
                ListaCategorias = negocioCategoria.listarCategorias();

                repCategorias.DataSource = ListaCategorias;
                repCategorias.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void CargarArticulos()
        {
            string categoriaID = Request.QueryString["categoriaID"];
            NegocioArticulo negocioArticulo = new NegocioArticulo();

            try
            {
                if (string.IsNullOrEmpty(categoriaID))
                {
                    ListaArticulos = negocioArticulo.listarArticulosPaginacion(1, 15);
                    lblCategoria.Text = "Todos los productos";
                }
                else
                {
                    NegocioCategoria negocioCategoria = new NegocioCategoria();
                    CategoriaSeleccionada = negocioCategoria.ObtenerCategoriaPorId(categoriaID);

                    if (CategoriaSeleccionada != null)
                    {
                        lblCategoria.Text = CategoriaSeleccionada.Nombre;
                        ListaArticulos = negocioArticulo.CargarProductosPorCategoria(categoriaID);
                    }
                }


                Session["ListaArticulos"] = ListaArticulos;
                repCardArt.DataSource = ListaArticulos;
                repCardArt.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
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

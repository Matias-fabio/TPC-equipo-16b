using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
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

                if (!string.IsNullOrEmpty(categoriaID))
                {
                    NegocioArticulo negocio = new NegocioArticulo();

                    NegocioCategoria negocioCategoria = new NegocioCategoria();
                    try
                    {
                        //trae el nombre de la categoria y lo seatea en la lbl
                        categoria = negocioCategoria.ObtenerCategoriaPorId(categoriaID);

                        if (categoria != null)
                        {    
                            lblCategoria.Text = categoria.Nombre;
                            
                        }

                        //lista todos los articulos correspondientes al id de la categoria
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
﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
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
                    
                    ListaArticulos = negocioArticulo.listarArticulosPaginacion(1, 26);
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

        protected void repCategorias_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "FiltrarCategoria")
            {
                string categoriaID = e.CommandArgument.ToString();
                NegocioArticulo negocioArticulo = new NegocioArticulo();

                try
                {
                    if (string.IsNullOrEmpty(categoriaID))
                    {
                        // Si no se pasa un ID de categoría, se cargan todos los productos
                        ListaArticulos = negocioArticulo.listarArticulosPaginacion(1, 15); 
                        lblCategoria.Text = "Todos los productos";
                    }
                    else
                    {
                        // Si hay una categoría seleccionada, se filtran los productos
                        ListaArticulos = negocioArticulo.CargarProductosPorCategoria(categoriaID);
                        NegocioCategoria negocioCategoria = new NegocioCategoria();
                        CategoriaSeleccionada = negocioCategoria.ObtenerCategoriaPorId(categoriaID);

                        if (CategoriaSeleccionada != null)
                        {
                            lblCategoria.Text = CategoriaSeleccionada.Nombre;
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
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ordenSeleccionado = ddlOrdenar.SelectedValue;

            if (string.IsNullOrEmpty(ordenSeleccionado))
            {
                CargarArticulos();
            }
            else
            {
                OrdenarArticulosPorPrecio(ordenSeleccionado);
            }
        }

        private void OrdenarArticulosPorPrecio(string orden)
        {
            if (ListaArticulos != null)
            {
                if (orden == "Asc")
                {
                    ListaArticulos.Sort((a, b) => a.Precio.CompareTo(b.Precio));
                }
                else if (orden == "Desc")
                {
                    ListaArticulos.Sort((a, b) => b.Precio.CompareTo(a.Precio));
                }
                repCardArt.DataSource = ListaArticulos;
                repCardArt.DataBind();
            }
        }
    }
}

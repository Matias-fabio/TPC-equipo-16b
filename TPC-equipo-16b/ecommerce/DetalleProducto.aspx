<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="ecommerce.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Detalle por producto</h3>
    <div class="container mt-5 cont-detalle">
        <asp:Repeater ID="rptProducto" runat="server">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <img id="imgPrincipal" src='<%# Eval("UrlImagen") %>' class="img-fluid rounded-start" alt="Imagen del producto" />
                    </div>
                    <div class="col-md-6">
                        <h2 class="display-4"><%# Eval("Nombre") %></h2>
                        <p class="text-muted">Categoría: <strong><%# Eval("Categoria") %></strong></p>
                        <p class="lead"><%# Eval("Descripcion") %></p>
                        <h4><%# Eval("Precio", "$ {0:N2}") %></h4>
                        <asp:LinkButton runat="server" ID="btnAgregarCarrito" CssClass="btn btn-warning" OnClick="btnAgregarCarrito_Click">
                             <i class="fa-solid fa-cart-shopping"></i> Agregar al carrito
                        </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="imgAd-cont">
            <asp:Repeater ID="rptImagenes" runat="server">
                <ItemTemplate>
                    <div class=" ">
                        <img src='<%# Container.DataItem %>' class="img-thumbnail img-small" alt="Imagen adicional del producto"
                            onclick="cambiarImagenPrincipal(this.src)" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <script>
        const cambiarImagenPrincipal = (imagenUrl) => {
            document.getElementById('imgPrincipal').src = imagenUrl
        }
    </script>
</asp:Content>

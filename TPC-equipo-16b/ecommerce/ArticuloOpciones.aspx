<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArticuloOpciones.aspx.cs" Inherits="ecommerce.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Articulos</h1>

    <div class="d-grid gap-4 col-6 mx-auto" id="OpcionesArticulo">
        <asp:LinkButton ID="btnInventario" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnInventario_Click">
            <h5>Inventario</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="InventarioStock" runat="server" CssClass="btn btn-primary btn-lg" OnClick="InventarioStock_Click">
            <h5>Agregar stock</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="botonArticulo" runat="server" CssClass="btn btn-primary btn-lg" OnClick="botonArticulo_Click">
            <h5>Agregar articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="EliminarArticulo" runat="server" CssClass="btn btn-primary btn-lg" OnClick="EliminarArticulo_Click">
            <h5>Eliminar Articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="ModificarArticulo" runat="server" CssClass="btn btn-primary btn-lg" OnClick="ModificarArticulo_Click">
            <h5>Modificar articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="ArticuloVolver" runat="server" CssClass="btn btn-primary btn-lg" OnClick="ArticuloVolver_Click">
            <h5>Volver</h5> 
        </asp:LinkButton>
    </div>

</asp:Content>

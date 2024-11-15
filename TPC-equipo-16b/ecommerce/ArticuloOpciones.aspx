<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArticuloOpciones.aspx.cs" Inherits="ecommerce.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Articulos</h1>

    <div class="d-grid gap-5 col-6 mx-auto" id="OpcionesArticulo">
        <asp:LinkButton ID="botonArticulo" runat="server" CssClass="btn btn-primary btn-lg" OnClick="botonArticulo_Click">
            <h5>Agregar articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn-lg">
            <h5>Eliminar Articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary btn-lg">
            <h5>Modificar articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="ArticuloVolver" runat="server" CssClass="btn btn-primary btn-lg" OnClick="ArticuloVolver_Click">
            <h5>Volver</h5> 
        </asp:LinkButton>
    </div>

</asp:Content>

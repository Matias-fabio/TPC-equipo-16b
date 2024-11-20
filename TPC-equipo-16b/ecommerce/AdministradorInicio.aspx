<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdministradorInicio.aspx.cs" Inherits="ecommerce.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="TituloAdmin">Administrador</h1>
    <div class="d-grid gap-4 col-6 mx-auto" id="CajaOpcionesAdmin">
        <asp:LinkButton ID="botonArticulo" runat="server" CssClass="btn btn-primary btn-lg" OnClick="botonArticulo_Click">
            <h5>Articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="BotonCategoria" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonCategoria_Click">
             <h5>Categoria</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="BotonMarcas" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonMarcas_Click">
            <h5>Marcas</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="botonHistoriaVentas" runat="server" CssClass="btn btn-primary btn-lg" OnClick="botonHistoriaVentas_Click">
            <h5>Historial ventas</h5> 
        </asp:LinkButton>
    </div>

   
</asp:Content>

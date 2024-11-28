<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdministradorInicio.aspx.cs" Inherits="ecommerce.WebForm2" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <div id="formulario" runat="server">
    <div class="min-vh-100 d-flex align-items-center justify-content-center bg-light p-4 flex-column">
        <h2 class="titulo-admin">Administrador Inicio Opciones</h2>
        <div class="button-container d-flex flex-column gap-4 mt-4">
            <asp:LinkButton ID="botonArticulo" runat="server" CssClass="custom-button" OnClick="botonArticulo_Click">
                <h6 class="titulo-admin">Articulo</h6> 
            </asp:LinkButton>
            <asp:LinkButton ID="BotonCategoria" runat="server" CssClass="custom-button" OnClick="BotonCategoria_Click">
                <h6 class="titulo-admin">Categoria</h6> 
            </asp:LinkButton>
            <asp:LinkButton ID="BotonMarcas" runat="server" CssClass="custom-button" OnClick="BotonMarcas_Click">
                <h6 class="titulo-admin">Marcas</h6> 
            </asp:LinkButton>
            <asp:LinkButton ID="BotonUsuarios" runat="server" CssClass="custom-button" OnClick="BotonUsuarios_Click">
                <h6 class="titulo-admin">Usuario</h6> 
            </asp:LinkButton>
            <asp:LinkButton ID="botonHistoriaVentas" runat="server" CssClass="custom-button" OnClick="botonHistoriaVentas_Click">
                <h6 class="titulo-admin">Historial ventas</h6> 
            </asp:LinkButton>
        </div>
    </div>
</div>


   
</asp:Content>

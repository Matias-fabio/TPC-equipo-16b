<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategoriaOpciones.aspx.cs" Inherits="ecommerce.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="min-vh-100 d-flex align-items-center justify-content-center bg-light p-4 flex-column">
    <h2 class="titulo-admin">Opciones categoría</h2>
    <div class="d-grid gap-4 col-6 mx-auto" id="CajaOpcionesAdmin">
        <asp:LinkButton ID="botonAgregar" runat="server" CssClass="custom-button" OnClick="botonAgregar_Click">
            <h5 class="Titulo">Agregar categoría</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="BotonEliminar" runat="server" CssClass="custom-button" OnClick="BotonEliminar_Click">
            <h5 class="Titulo">Eliminar categoría</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="BotonModificar" runat="server" CssClass="custom-button" OnClick="BotonModificar_Click">
            <h5 class="Titulo">Modificar categoría</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="Volver" runat="server" CssClass="custom-button" OnClick="Volver_Click">
            <h5 class="Titulo">Volver</h5> 
        </asp:LinkButton>
    </div>
</div>

</asp:Content>

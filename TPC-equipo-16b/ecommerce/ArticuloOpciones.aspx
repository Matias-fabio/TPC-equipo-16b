﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArticuloOpciones.aspx.cs" Inherits="ecommerce.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="min-vh-100 d-flex align-items-center justify-content-center bg-light p-4 flex-column">
    <h2 class="titulo-admin">Articulo opciones</h2>
    <div class="d-grid gap-4 col-6 mx-auto" id="OpcionesArticulo">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="custom-button" OnClick="btnInventario_Click">
            <h5 class="Titulo">Inventario</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="custom-button" OnClick="InventarioStock_Click">
            <h5 class="Titulo">Agregar stock</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="custom-button" OnClick="botonArticulo_Click">
            <h5 class="Titulo">Agregar articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="custom-button" OnClick="EliminarArticulo_Click">
            <h5 class="Titulo">Eliminar Articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="custom-button" OnClick="ModificarArticulo_Click">
            <h5 class="Titulo">Modificar articulo</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="LinkButton6" runat="server" CssClass="custom-button" OnClick="ArticuloVolver_Click">
            <h5 class="Titulo">Volver</h5> 
        </asp:LinkButton>
    </div>
</div>


</asp:Content>

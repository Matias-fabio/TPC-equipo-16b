﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DarDeAltaArticulo.aspx.cs" Inherits="ecommerce.DarDeAltaArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Dar alta artículo</h1>
<div class="DarAltaAritulo">
    <div class="col-md-12">
        <label for="ddlArticulos" class="form-label">Nombre del artículo</label>
        <div class="input-group has-validation">
            <asp:DropDownList ID="ddlArticulos" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
    </div>
    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto extra-padding">
                <asp:LinkButton ID="BotonDarDeAlta" runat="server" CssClass="custom-button" OnClick="BotonDarDeAlta_Click">
                <h5 class="Titulo">Dar de alta artículo</h5>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" CssClass="custom-button" OnClick="BotonVolver_Click">
                <h5 class="Titulo">Volver</h5>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</div>
</asp:Content>
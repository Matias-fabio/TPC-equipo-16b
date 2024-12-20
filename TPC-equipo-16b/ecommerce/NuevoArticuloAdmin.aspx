﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevoArticuloAdmin.aspx.cs" Inherits="ecommerce.NuevoArticuloAdmin" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Nuevo Articulo</h1>
    <div class="ContenedorArticuloNuevo">
        <div class="col-md-12">
            <label for="validationCustomUsername" class="form-label">Nombre del nuevo articulo</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="txtNombreArticulo" runat="server" CssClass="form-control" Text="" type=""
                    title="Ingrese nombre del producto">
                </asp:TextBox>

            </div>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreArticulo"
                ErrorMessage="El campo de nombre del articulo es obligatorio." CssClass="text-danger" Display="Dynamic" />
        </div>

        <div class="row">
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Marca</label>
                <div class="input-group has-validation">
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

            </div>
            <asp:RequiredFieldValidator ID="rfvMarca" runat="server" ControlToValidate="ddlMarca"
                ErrorMessage="El campo de marca es obligatorio." CssClass="text-danger" Display="Dynamic" />
            <div class="col-md-6">
                <label for="ddlCategoria" class="form-label">Categoría</label>
                <div class="input-group has-validation">
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

            </div>
            <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="ddlCategoria"
                ErrorMessage="El campo de categoria es obligatorio." CssClass="text-danger" Display="Dynamic" />
            <div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">Precio</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Text="" TextMode="Number"></asp:TextBox>

                </div>
                <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
                    ErrorMessage="El campo de precio es obligatorio." CssClass="text-danger" Display="Dynamic" />
                <div class="col-md-12">
                    <label for="validationCustomUsername" class="form-label">Descripcion</label>
                    <div class="input-group has-validation">
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
                        ErrorMessage="El campo de descripcion es obligatorio." CssClass="text-danger" Display="Dynamic" />
                </div>
            </div>
            <div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">URL de la imagen del nuevo producto</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="" type=""
                    title="Ingrese URL de la imagen">
                </asp:TextBox>
            </div>
            <div class="col-md-12">
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                <div class="col-12" id="BotonNuevoArticulo">
                    <div class="d-grid gap-2 col-8 mx-auto extra-padding">
                        <asp:LinkButton ID="BotonAceptar" runat="server" class="custom-button" type="button" OnClick="BotonAceptar_Click">
                <h5 class="Titulo">Aceptar nuevo artículo</h5>
                        </asp:LinkButton>
                        <asp:LinkButton ID="BotonVolver" runat="server" class="custom-button" type="button" OnClick="BotonVolver_Click" CausesValidation="false">
                <h5 class="Titulo">Volver</h5>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>




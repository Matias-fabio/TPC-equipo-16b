<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevoArticuloAdmin.aspx.cs" Inherits="ecommerce.NuevoArticuloAdmin" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="validationCustomUsername" class="form-label">Marca</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" Text="" type="text"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="validationCustomUsername" class="form-label">Categoria</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control" Text="" type="text"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">Precio</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Text="" TextMode="Number"></asp:TextBox>
                </div>
            <div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">Descripcion</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto">
                <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary" type="button">
                    <h3>Aceptar</h3>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>




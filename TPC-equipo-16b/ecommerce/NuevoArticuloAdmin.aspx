<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevoArticuloAdmin.aspx.cs" Inherits="ecommerce.NuevoArticuloAdmin" %>
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
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="" type="number"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-12">
                <label for="validationCustomUsername" class="form-label">Descripcion</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text="" type=""></asp:TextBox>
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

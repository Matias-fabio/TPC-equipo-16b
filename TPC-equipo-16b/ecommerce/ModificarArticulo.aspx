<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarArticulo.aspx.cs" Inherits="ecommerce.ModificarArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Modificar articulo
    </h1>
    <div>
        <div class="col-md-12">
            <asp:DropDownList ID="ddlArticulos" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlArticulos_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-12">
            <label for="validationCustomUsername" class="form-label">Nombre que quieras cambiar al articulo</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="txtNombreArticulo" runat="server" CssClass="form-control" Text="" type=""
                    title="Ingrese nuevo nombre que le quieras poner al producto">
                </asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Categoria</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextCategoriaVieja" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Marca</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextMarcaVieja" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Nueva categoria</label>
                <div class="input-group has-validation">
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Nueva marca</label>
                <div class="input-group has-validation">
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Precio</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextPrecioViejo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Precio modificado</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextPrecioNuevo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto">
                <asp:LinkButton ID="BotonModificar" runat="server" class="btn btn-primary" type="button">
                    <h3>Modificar articulo</h3>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button" OnClick="BotonVolver_Click">
                    <h3>Volver</h3>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

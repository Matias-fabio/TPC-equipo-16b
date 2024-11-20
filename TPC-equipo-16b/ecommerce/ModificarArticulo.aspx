<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarArticulo.aspx.cs" Inherits="ecommerce.ModificarArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Modificar articulo
    </h1>
    <div>
        <div class="col-md-12">
            <label for="ddlArticulos" class="form-label">Nombre del artículo</label>
            <div class="input-group has-validation">
                <asp:DropDownList ID="ddlArticulos" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
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
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Marca</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextMarca" runat="server" CssClass="form-control"></asp:TextBox>
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
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="ddlMarca" class="form-label">Precio modificado</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto">
                <asp:LinkButton ID="BotonModificar" runat="server" class="btn btn-primary" type="button">
                    <h3>Modificar articulo</h3>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button">
                    <h3>Volver</h3>
                </asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>

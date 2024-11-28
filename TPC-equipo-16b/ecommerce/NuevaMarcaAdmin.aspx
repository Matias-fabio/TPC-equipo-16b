<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevaMarcaAdmin.aspx.cs" Inherits="ecommerce.NuevaMarcaAdminaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Nueva marca</h1>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">Nombre de la nueva Marca</label>
        <div class="input-group has-validation">
            <asp:TextBox ID="txtNombremarca" runat="server" CssClass="form-control" Text="" title="Ingrese nombre de la categoría"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvNombreMarca" runat="server" ControlToValidate="txtNombremarca"
            ErrorMessage="El campo de nombre marca es obligatorio." CssClass="text-danger" Display="Dynamic" />
    </div>

    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">URL del logo</label>
        <asp:TextBox ID="txturlImagen" runat="server" CssClass="form-control" Text="" type=""
            title="Ingrese URL de la imagen">
        </asp:TextBox>
    </div>
    <asp:RequiredFieldValidator ID="rfvurlimagen" runat="server" ControlToValidate="txturlImagen"
        ErrorMessage="El campo de url imagen es obligatorio." CssClass="text-danger" Display="Dynamic" />

    <asp:Label ID="Label1" runat="server" CssClass="text-success" Visible="False"></asp:Label>
    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonNuevaMarca">
            <div class="d-grid gap-2 col-8 mx-auto extra-paddingM">
                <asp:LinkButton ID="BotonAceptar" runat="server" class="custom-button" type="button" OnClick="BotonAceptar_Click">
            <h5 class="Titulo">Aceptar nueva marca</h5>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="custom-button" type="button" OnClick="BotonVolver_Click" CausesValidation="false">
            <h5 class="Titulo">Volver</h5>
                </asp:LinkButton>
            </div>
        </div>

    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevaCategoriaAdmin.aspx.cs" Inherits="ecommerce.AgregarCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Agregar categoria</h1>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">Nombre de la nueva categoria</label>
        <div class="input-group has-validation">
            <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" Text="" title="Ingrese nombre de la categoría"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="txtNombreCategoria"
            ErrorMessage="El campo de nombre categoria es obligatorio." CssClass="text-danger" Display="Dynamic" />
    </div>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">Descripcion</label>
        <div class="input-group has-validation">
            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
            ErrorMessage="El campo de descripcion es obligatorio." CssClass="text-danger" Display="Dynamic" />
        <div>
            <label for="validationCustomUsername" class="form-label">URL de la imagen de la categoria</label>
            <asp:TextBox ID="txturlImagen" runat="server" CssClass="form-control" Text="" type=""
                title="Ingrese URL de la imagen">
            </asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvurlImagens" runat="server" ControlToValidate="txturlImagen"
            ErrorMessage="El campo de URL imagen es obligatorio." CssClass="text-danger" Display="Dynamic" />
    </div>
    <asp:Label ID="Label1" runat="server" CssClass="text-success" Visible="False"></asp:Label>
    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto extra-padding">
                <asp:LinkButton ID="BotonAceptar" runat="server" class="custom-button" type="button" OnClick="BotonAceptar_Click">
            <h5 class="Titulo">Aceptar nueva categoría</h5>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="custom-button" type="button" OnClick="BotonVolver_Click" CausesValidation="false">
            <h5 class="Titulo">Volver</h5>
                </asp:LinkButton>
            </div>
        </div>

    </div>
</asp:Content>

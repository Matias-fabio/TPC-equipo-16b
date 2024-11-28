<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EliminarMarcaAdmin.aspx.cs" Inherits="ecommerce.EliminarMarcaAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
    <h1>Eliminar marca</h1>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">Seleccione una Marca</label>
        <div class="input-group has-validation">
            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
    </div>

    <asp:Label ID="Label1" runat="server" CssClass="text-success" Visible="False"></asp:Label>
    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonEliminar">
            <div class="d-grid gap-2 col-8 mx-auto extra-paddingM">
                <asp:LinkButton ID="BotonAceptar" runat="server" CssClass="custom-button" type="button" OnClick="BotonAceptar_Click">
                <h5 class="Titulo">Eliminar marca</h5>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" CssClass="custom-button" type="button" OnClick="BotonVolver_Click">
                <h5 class="Titulo">Volver</h5>
                </asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>

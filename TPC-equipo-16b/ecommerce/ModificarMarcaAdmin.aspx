<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarMarcaAdmin.aspx.cs" Inherits="ecommerce.ModificarMarcaAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Modificar marca</h1>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">Seleccione una marca</label>
        <div class="input-group has-validation">
            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div>
            <label for="validationCustomUsername" class="form-label">Nombre de la nueva Marca</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="NombreNuevoMarca" runat="server" CssClass="form-control" Text="" title="Ingrese nombre de la marca"></asp:TextBox>
            </div>
        </div>
           <asp:RequiredFieldValidator ID="rfvNuevoNombremarca" runat="server" ControlToValidate="NombreNuevoMarca"
       ErrorMessage="El campo de nuevo nombre marca es obligatorio." CssClass="text-danger" Display="Dynamic" />
    </div>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">URL del logo actual</label>
        <asp:TextBox ID="urlVieja" runat="server" CssClass="form-control" Text="" type="" title="Ingrese URL del logo actual" ReadOnly="True"></asp:TextBox>
    </div>
    <div>
        <label for="validationCustomUsername" class="form-label">URL del nuevo logo</label>
        <asp:TextBox ID="UrlNueva" runat="server" CssClass="form-control" Text="" type="" title="Ingrese URL del nuevo logo"></asp:TextBox>
    </div>
        <asp:RequiredFieldValidator ID="rfvulrnueva" runat="server" ControlToValidate="UrlNueva"
    ErrorMessage="El campo de nuevo url marca es obligatorio." CssClass="text-danger" Display="Dynamic" />

    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonNuevaMarca">
            <div class="d-grid gap-2 col-8 mx-auto">
                <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary" type="button" OnClick="BotonAceptar_Click">
                <h3>Modificar marca</h3>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button" OnClick="BotonVolver_Click" CausesValidation="false">
                <h3>Volver</h3>
                </asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarCategoria.aspx.cs" Inherits="ecommerce.ModificarCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Modificar Categoría</h1>
    <div class="ModificarCategoria">
        <div class="col-md-12">
            <label for="ddlArticulos" class="form-label">Seleccione categoría</label>
            <div class="input-group has-validation">
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
        <div class="col-md-12">
            <label for="ddlArticulos" class="form-label">Nombre de la categoría modificada</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="NuevaCategoria" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="rfvModCategoria" runat="server" ControlToValidate="NuevaCategoria"
                ErrorMessage="El campo de nombre categoria modificado es obligatorio." CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="col-md-12">
            <label for="validationCustomUsername" class="form-label">Descripción vieja</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="Descripcionvieja" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <label for="validationCustomUsername" class="form-label">Descripción nueva</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="txtDescripcionNueva" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <asp:RequiredFieldValidator ID="rfvDescripcionNueva" runat="server" ControlToValidate="txtDescripcionNueva"
                ErrorMessage="El campo de descripcion modificado es obligatorio." CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="col-md-12">
            <label for="validationCustomUsername" class="form-label">URL de la imagen de la categoría vieja</label>
            <asp:TextBox ID="urlvieja" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
        </div>
        <div>
            <label for="validationCustomUsername" class="form-label">URL de la imagen de la categoría nueva</label>
            <asp:TextBox ID="urlnueva" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvurlImagen" runat="server" ControlToValidate="urlnueva"
            ErrorMessage="El campo de url imagen es obligatorio." CssClass="text-danger" Display="Dynamic" />
    </div>

    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto extra-padding">
                <asp:LinkButton ID="BotonModificar" runat="server" class="custom-button" type="button" OnClick="BotonModificar_Click">
                <h5 class="Titulo">Modificar categoría</h5>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="custom-button" type="button" OnClick="BotonVolver_Click" CausesValidation="false">
                <h5 class="Titulo">Volver</h5>
                </asp:LinkButton>
            </div>
        </div>
    </div>



</asp:Content>

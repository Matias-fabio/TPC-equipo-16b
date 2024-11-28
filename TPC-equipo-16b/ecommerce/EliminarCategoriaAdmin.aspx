<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EliminarCategoriaAdmin.aspx.cs" Inherits="ecommerce.EliminarCategoriaAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Eliminar Categoria</h1>
    <div class="EliminarArticulo">
        <div class="col-md-12">
            <label for="ddlArticulos" class="form-label">Seleccione categoría a eliminar</label>
            <div class="input-group has-validation">
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
            <div class="col-12" id="BotonNuevoArticulo">
                <div class="d-grid gap-2 col-8 mx-auto extra-padding">
                    <asp:LinkButton ID="BotonEliminar" runat="server" CssClass="custom-button" OnClick="BotonEliminar_Click">
                    <h5 class="Titulo">Eliminar categoría</h5>
                    </asp:LinkButton>
                    <asp:LinkButton ID="BotonVolver" runat="server" CssClass="custom-button " OnClick="BotonVolver_Click">
                    <h5 class="Titulo">Volver</h5>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

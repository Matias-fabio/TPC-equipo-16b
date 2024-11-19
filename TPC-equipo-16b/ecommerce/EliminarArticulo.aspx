<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EliminarArticulo.aspx.cs" Inherits="ecommerce.EliminarArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Eliminar artículo</h1>
    <div class="EliminarArticulo">
        <div class="col-md-12">
            <label for="ddlArticulos" class="form-label">Nombre del artículo</label>
            <div class="input-group has-validation">
                <asp:DropDownList ID="ddlArticulos" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
            <div class="col-12" id="BotonNuevoArticulo">
                <div class="d-grid gap-2 col-8 mx-auto">
                    <asp:LinkButton ID="BotonEliminar" runat="server" class="btn btn-primary" type="button" OnClick="BotonEliminar_Click">
                        <h3>Eliminar artículo</h3>
                    </asp:LinkButton>
                    <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button" OnClick="BotonVolver_Click">
                        <h3>Volver</h3>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


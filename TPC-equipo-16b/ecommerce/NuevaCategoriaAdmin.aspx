<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NuevaCategoriaAdmin.aspx.cs" Inherits="ecommerce.AgregarCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Agregar categoria
    </h1>
    <div class="col-md-12">
        <label for="validationCustomUsername" class="form-label">Nombre de la nueva categoria</label>
        <div class="input-group has-validation">
            <asp:TextBox ID="txtNombreArticulo" runat="server" CssClass="form-control" Text="" type=""
                title="Ingrese nombre de la categoria">
            </asp:TextBox>
        </div>
    </div>
    <div class="col-md-12">
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
        <div class="col-12" id="BotonNuevoArticulo">
            <div class="d-grid gap-2 col-8 mx-auto">
                <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary" type="button" >
                    <h3>Aceptar nueva categoria!!</h3>
                </asp:LinkButton>
                <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button" OnClick="BotonVolver_Click">
                    <h3>Volver</h3>
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

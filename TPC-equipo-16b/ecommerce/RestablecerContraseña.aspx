<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RestablecerContraseña.aspx.cs" Inherits="ecommerce.RestablecerContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Restablecer Contraseña</h1>

    <div class="col-md-6">
        <label for="validationCustomUsername" class="form-label">Email</label>
        <div class="input-group has-validation">
            <span class="input-group-text" id="inputGroupPrepend">@</span>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text="" type="email"
                title="Ingrese una dirección de correo válida"></asp:TextBox>
        </div>
    </div>

    <div class="col-md-6">
        <label for="validationCustomUsername" class="form-label">Contraseña</label>
        <div class="input-group has-validation">
            <asp:TextBox ID="txtContraseña1" runat="server" CssClass="form-control" Text="" type="password"></asp:TextBox>
        </div>
    </div>

    <div class="col-md-6">
        <label for="validationCustomUsername" class="form-label">Confirme contraseña</label>
        <div class="input-group has-validation">
            <asp:TextBox ID="txtContraseña2" runat="server" CssClass="form-control" Text="" type="password"></asp:TextBox>
        </div>
    </div>
    <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" Visible="False"></asp:Label>
    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>

    <div class="col-12" id="BotonIngresarNuevoUsuario">
        <div class="d-grid gap-2 col-8 mx-auto">
            <asp:LinkButton ID="BotonAceptar" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonAceptar_Click">
                <h5>Aceptar</h5> 
            </asp:LinkButton>
        </div>
        <div class="d-grid gap-2 col-8 mx-auto">
            <asp:LinkButton ID="VolverLogin" runat="server" CssClass="btn btn-primary btn-lg" OnClick="VolverLogin_Click">
                <h5>Volver</h5> 
            </asp:LinkButton>
        </div>

    </div>

   

</asp:Content>

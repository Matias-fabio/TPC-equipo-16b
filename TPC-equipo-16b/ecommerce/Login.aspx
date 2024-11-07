<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ecommerce.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login</h1>
    <div class="InicioSeccion">
        <div class="col-md-4">
            <label for="validationCustomUsername" class="form-label">Email</label>
            <div class="input-group has-validation">
                <span class="input-group-text" id="inputGroupPrepend">@</span>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text="" type="email"
                    title="Ingrese una dirección de correo válida" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-4">
            <label for="validationCustomUsername" class="form-label">Contraseña</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Text="" type="password"></asp:TextBox>
            </div>
        </div>
        <asp:Label ID="labelError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        <div class="col-12" id="BotonIngresar">
            <asp:LinkButton ID="BotonAceptar" runat="server" CssClass="btn btn-primary btn-lg" onClick="BotonAceptar_Click">
                <h5>Aceptar</h5> 
            </asp:LinkButton>
        </div>
       
        <div class="row BotonesLogin">
            <div class="col-6" id="BotonIngresarConstraseña">
                <asp:LinkButton ID="BotonContraseña" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonContraseña_Click">
                    <h5>Olvide mi contraseña</h5> 
                </asp:LinkButton>
            </div>
            <div class="col-6" id="NuevoUsuario">
                <asp:LinkButton ID="botonNuevoUsuario" runat="server" CssClass="btn btn-primary btn-lg" OnClick="botonNuevoUsuario_Click">
                    <h5>Nuevo usuario</h5> 
                </asp:LinkButton>
            </div>
        </div>
        
    </div>
       
   
</asp:Content>

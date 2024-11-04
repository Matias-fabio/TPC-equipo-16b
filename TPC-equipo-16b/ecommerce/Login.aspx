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

                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="" type="password"></asp:TextBox>
                
            </div>
        </div>
        <div class="col-12" id="BotonIngresar">
            <asp:Button ID="btnForm" runat="server" CssClass="btn btn-primary"  Text="Aceptar" />
        </div>
        <div class="col-12" id="BotonIngresarConstraseña">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Olvide mi contraseña" />
        </div>
        <div class="col-12" id="NuevoUsuario">
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Nuevo usuario" />
        </div>
    </div>
       
   
</asp:Content>

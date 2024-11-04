<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ecommerce.Registro1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registro</h1>
    <div class="NuevoUsuario">
        <div class="col-md-12">
            <label for="validationCustomUsername" class="form-label">Email</label>
            <div class="input-group has-validation">
                <span class="input-group-text" id="inputGroupPrepend">@</span>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text="" type="email"
                    title="Ingrese una dirección de correo válida"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="validationCustomUsername" class="form-label">Nombre</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text="" type="text"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="validationCustomUsername" class="form-label">Apellido</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text="" type="text"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="validationCustomUsername" class="form-label">Direccion</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text="" type="text"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <label for="validationCustomUsername" class="form-label">Telefono</label>
                <div class="input-group has-validation">
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text="" type="text"></asp:TextBox>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <label for="validationCustomUsername" class="form-label">Contraseña</label>
            <div class="input-group has-validation">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="" type="password"></asp:TextBox>
            </div>
        </div>
        <div class="col-12" id="BotonIngresarNuevoUsuario">
            <asp:LinkButton ID="BotonAceptar" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonAceptar_Click">
                <h3>Aceptar!!</h3> 
            </asp:LinkButton>
</div>
    </div>
</asp:Content>

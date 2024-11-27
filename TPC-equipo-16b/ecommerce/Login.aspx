<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ecommerce.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mt-5" id="ContenedorLogin">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow-lg" id="CartaInicio">
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <div class="bg-primary p-3 d-inline-block rounded-circle mb-3">
                                <i class="fas fa-lock fa-2x text-white"></i>
                            </div>
                            <h2 class="fw-bold">Login</h2>
                        </div>

                        <form asp-action="Login" asp-controller="Account" method="post">
                            <div class="mb-3">
                                <label asp-for="Email" class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="fas fa-envelope"></i>
                                    </span>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text="" type="email"
                                        title="Ingrese una dirección de correo válida" required="required"></asp:TextBox>

                                </div>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="El campo de email es obligatorio." CssClass="text-danger" />
                                <span asp-validation-for="Email" class="text-danger"></span>
                            </div>
                            <div class="mb-3">
                                <label asp-for="Password" class="form-label">Contraseña</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="fas fa-key"></i>
                                    </span>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Text="" type="password"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="El campo de contraseña es obligatorio." CssClass="text-danger" />
                                <span asp-validation-for="Password" class="text-danger"></span>
                            </div>
                            <asp:Label ID="labelError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                            <div class="d-grid gap-2">
                                <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary" OnClick="BotonAceptar_Click">
                                <h5>Aceptar</h5>
                                </asp:LinkButton>

                            </div>

                            <div class="d-grid gap-2 mt-3">
                                <asp:LinkButton ID="botonNuevoUsuario" runat="server" class="btn btn-info" OnClick="botonNuevoUsuario_Click" CausesValidation="false">
                                <h5>Nuevo usuario</h5>
                                </asp:LinkButton>

                                <asp:LinkButton ID="BotonContraseña" runat="server" class="btn btn-secondary" OnClick="BotonContraseña_Click" CausesValidation="false">
                                <h5>Olvide mi contraseña</h5>
                                </asp:LinkButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

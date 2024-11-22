<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RestablecerContraseña.aspx.cs" Inherits="ecommerce.RestablecerContraseña" %>

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
                        <h2 class="fw-bold">Restablecer Contraseña</h2>
                    </div>

                    <form asp-action="Restablecer" asp-controller="Account" method="post">
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-envelope"></i>
                                </span>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text="" type="email"
                                    title="Ingrese una dirección de correo válida" required="required"></asp:TextBox>
                            </div>
                            <span asp-validation-for="Email" class="text-danger"></span>
                        </div>

                        <div class="mb-3">
                            <label for="txtContraseña1" class="form-label">Contraseña</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-key"></i>
                                </span>
                                <asp:TextBox ID="txtContraseña1" runat="server" CssClass="form-control" Text="" type="password" required="required"></asp:TextBox>
                            </div>
                            <span asp-validation-for="Contraseña1" class="text-danger"></span>
                        </div>

                        <div class="mb-3">
                            <label for="txtContraseña2" class="form-label">Confirme Contraseña</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="fas fa-key"></i>
                                </span>
                                <asp:TextBox ID="txtContraseña2" runat="server" CssClass="form-control" Text="" type="password" required="required"></asp:TextBox>
                            </div>
                            <span asp-validation-for="Contraseña2" class="text-danger"></span>
                        </div>
                         <asp:Label ID="lblMensaje" runat="server" CssClass="text-success" Visible="False"></asp:Label>
                         <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>

                        <div class="d-grid gap-2">
                            <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary" OnClick="BotonAceptar_Click">
                                <h5>Confirmar</h5>
                            </asp:LinkButton>
                        </div>

                        <div class="d-grid gap-2 mt-3">
                            <asp:LinkButton ID="VolverLogin" runat="server" class="btn btn-secondary" OnClick="VolverLogin_Click">
                                <h5>Volver</h5>
                            </asp:LinkButton>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


   

</asp:Content>

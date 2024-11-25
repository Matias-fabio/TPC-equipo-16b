<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ecommerce.Registro1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-body p-4">
                    <h2 class="text-center mb-4">Nuevo Usuario</h2>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-envelope"></i>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" title="Ingrese una dirección de correo válida"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-person"></i>Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-person"></i>Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-telephone"></i>Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                        </div>

                        <div class="col-12">
                            <label class="form-label"><i class="bi bi-geo-alt"></i>Dirección</label>
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-key"></i>Contraseña</label>
                            <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="col-12 mt-4">
                            <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary w-100 mb-2" OnClick="BotonAceptar_Click">
                                <h3>Aceptar!!</h3>
                            </asp:LinkButton>
                            <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-secondary w-100"  OnClick="BotonVolver_Click">
                                <h3>Volver</h3>
                            </asp:LinkButton>
                        </div>
                    </div>

                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</div>


</asp:Content>

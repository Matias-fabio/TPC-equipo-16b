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
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                ErrorMessage="El campo de email es obligatorio." CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                                ErrorMessage="Por favor, ingrese un email válido." ValidationExpression="\w+([-+.'']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-person"></i>Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" 
                            ErrorMessage="El campo de nombre es obligatorio." CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" 
                                ErrorMessage="El nombre no debe contener caracteres especiales ni números." ValidationExpression="^[a-zA-Z]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-person"></i>Apellido</label>
                            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvApellido" runat ="server" ControlToValidate="txtApellido"
                              ErrorMessage="El campo de apellido es obligatorio." CssClass="text-danger" Display="Dynamic" /> 
                            <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" 
                                ErrorMessage="El apellido no debe contener caracteres especiales ni números." ValidationExpression="^[a-zA-Z]+$" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-telephone"></i>Teléfono</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTelefono" runat ="server" ControlToValidate="txtTelefono"
                            ErrorMessage="El campo de telefono es obligatorio." CssClass="text-danger" Display="Dynamic" /> 
                            <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" 
                                ErrorMessage="El teléfono debe tener un máximo de 13 caracteres." ValidationExpression="^\d{1,13}$" CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="col-12">
                            <label class="form-label"><i class="bi bi-geo-alt"></i>Dirección</label>
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" type="text"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion"
                                ErrorMessage="El campo de direccion es obligatorio." CssClass="text-danger" Display="Dynamic" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label"><i class="bi bi-key"></i>Contraseña(Entre 8-16 caracteres)</label>
                            <asp:TextBox ID="txtContraseña" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtContraseña"
                                ErrorMessage="El campo de contraseña es obligatorio." CssClass="text-danger" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revContraseña" runat="server" ControlToValidate="txtContraseña" 
                                ErrorMessage="La contraseña debe tener entre 8 y 16 caracteres." ValidationExpression="^.{8,16}$" CssClass="text-danger" Display="Dynamic" /> </div>
                        </div>

                        <div class="col-12 mt-4">
                            <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary w-100 mb-2" OnClick="BotonAceptar_Click">
                                <h3>Aceptar!!</h3>
                            </asp:LinkButton>
                            <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-secondary w-100"  OnClick="BotonVolver_Click" CausesValidation="false">
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

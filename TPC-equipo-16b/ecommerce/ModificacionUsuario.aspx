<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificacionUsuario.aspx.cs" Inherits="ecommerce.ModificacionUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="estilos/LadoAdmin.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-vh-100 d-flex align-items-center justify-content-center bg-light p-4 flex-column">
        <div class="col-md-12 mb-3">
            <h1>Opciones Usuario</h1>
            <label for="ddlGmailUsuarios" class="form-label">Gmail de usuarios</label>
            <asp:DropDownList ID="ddlGmailUsuarios" runat="server" CssClass="form-control" AppendDataBoundItems="true">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvGmailUsuarios" runat="server" ControlToValidate="ddlGmailUsuarios"
                InitialValue="" ErrorMessage="Debe seleccionar un correo electrónico" CssClass="text-danger" Display="Dynamic" />
        </div>
        <div class="col-md-12 mb-3 text-center">
            <label class="form-label d-block">Rol del usuario</label>
            <div class="form-check form-check-inline">
                <asp:RadioButton ID="rbtnAdmin" runat="server" GroupName="RolUsuario" CssClass="form-check-input" />
                <label class="form-check-label" for="rbtnAdmin">Administrador</label>
            </div>
            <div class="form-check form-check-inline">
                <asp:RadioButton ID="rbtnCliente" runat="server" GroupName="RolUsuario" CssClass="form-check-input" />
                <label class="form-check-label" for="rbtnCliente">Cliente</label>
            </div>
            <asp:CustomValidator ID="cvRolUsuario" runat="server" ErrorMessage="Debe seleccionar un rol"
                ClientValidationFunction="validateRadioButton" CssClass="text-danger" Display="Dynamic" />
        </div>
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="false"></asp:Label>
        <div class="d-grid gap-2 col-8 mx-auto extra-padding">
            <asp:LinkButton ID="BotonConfirmar" runat="server" CssClass="custom-button" type="button" OnClick="BotonConfirmar_Click">
            <h5 class="Titulo">Confirmar</h5>
            </asp:LinkButton>
            <asp:LinkButton ID="BotonVolver" runat="server" CssClass="custom-button" type="button">
            <h5 class="Titulo">Volver</h5>
            </asp:LinkButton>
        </div>
    </div>

    <script type="text/javascript">
        function validateRadioButton(sender, args) {
            var rbtnAdmin = document.getElementById('<%= rbtnAdmin.ClientID %>');
        var rbtnCliente = document.getElementById('<%= rbtnCliente.ClientID %>');
        args.IsValid = rbtnAdmin.checked || rbtnCliente.checked;
    }
    </script>
</asp:Content>

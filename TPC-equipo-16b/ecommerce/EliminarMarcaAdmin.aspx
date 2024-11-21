<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EliminarMarcaAdmin.aspx.cs" Inherits="ecommerce.EliminarMarcaAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Eliminar marca</h1>
 <div class="col-md-12">
     <label for="validationCustomUsername" class="form-label">Selecione una Marca</label>
     <div class="input-group has-validation">
         <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-control"></asp:DropDownList>
     </div>
 </div>

 <asp:Label ID="Label1" runat="server" CssClass="text-success" Visible="False"></asp:Label>
 <div class="col-md-12">
     <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
     <div class="col-12" id="BotonEliminar">
         <div class="d-grid gap-2 col-8 mx-auto">
             <asp:LinkButton ID="BotonAceptar" runat="server" class="btn btn-primary" type="button" OnClick="BotonAceptar_Click">
                 <h3>Eliminar marca</h3>
             </asp:LinkButton>
             <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button" OnClick="BotonVolver_Click">
                 <h3>Volver</h3>
             </asp:LinkButton>
         </div>
     </div>
 </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdministradorInicio.aspx.cs" Inherits="ecommerce.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="TituloAdmin">Administrador</h1>
    <div class="d-grid gap-4 col-6 mx-auto" id="CajaOpcionesAdmin">
        <button  class="btn btn-primary" type="button">Articulo</button>
        <button  class="btn btn-primary" type="button">Marcas</button>
        <button  class="btn btn-primary" type="button">Categoria</button>
        <button  class="btn btn-primary" type="button">Historial ventas</button>
        <button  class="btn btn-primary" type="button">Usuarios</button>
        <button  class="btn btn-primary" type="button">Button</button>
        <button  class="btn btn-primary" type="button">Button</button>
    </div>

   
</asp:Content>

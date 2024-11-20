<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategoriaOpciones.aspx.cs" Inherits="ecommerce.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Opciones categoria
    </h1>
    <div class="d-grid gap-4 col-6 mx-auto" id="CajaOpcionesAdmin">
        <asp:LinkButton ID="botonAgregar" runat="server" CssClass="btn btn-primary btn-lg"  OnClick="botonAgregar_Click">
         <h5>Agregar categoria</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="BotonEliminar" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonEliminar_Click">
          <h5>Eliminar categoria</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="BotonModificar" runat="server" CssClass="btn btn-primary btn-lg" OnClick="BotonModificar_Click">
         <h5>Modificar categoria</h5> 
        </asp:LinkButton>
        <asp:LinkButton ID="Volver" runat="server" CssClass="btn btn-primary btn-lg" OnClick="Volver_Click">
         <h5>Volver</h5> 
        </asp:LinkButton>
    </div>
</asp:Content>

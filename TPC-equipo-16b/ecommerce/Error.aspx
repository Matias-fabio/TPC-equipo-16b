<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ecommerce.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">Acceso Denegado</h4>
            <p>No tienes permisos para acceder a esta página porque no eres administrador.</p>
            <hr>
            <p class="mb-0">Por favor, contacta al administrador del sistema si crees que esto es un error.</p>
            <br />
            <div class="d-grid gap-2 col-6 mx-auto">
                <asp:Button ID="Volver" runat="server" Text="Volver" class="btn btn-primary btn-danger" OnClick="Volver_Click"/>
            </div>
        </div>
    </div>
</asp:Content>

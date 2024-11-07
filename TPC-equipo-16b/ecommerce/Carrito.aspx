<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="ecommerce.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Carrito</h2>
    <asp:Label Text="" runat="server" ID="lblMensaje" />
    <asp:Repeater ID="rptCarrito" runat="server">
        <HeaderTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th>Producto</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <div class="col-5">
                        <img src="<%#Eval("UrlImagen") %>" class="img-fluid rounded-start" alt="...">
                    </div>
                </td>
                <td><%# Eval("Nombre") %></td>
                <td><%# Eval("Precio", "{0:C}") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <h4>Total: <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></h4>
</asp:Content>

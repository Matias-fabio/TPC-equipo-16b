<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArticuloStock.aspx.cs" Inherits="ecommerce.ArticuloStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container mt-5">
        <h2>Inventario</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Articulo</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RepStock" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("codigo") %></td>
                            <td><%# Eval("Nombre") %></td>
                            <td><%# Eval("Precio") %></td>
                            <td><%# Eval("Cantidad") %></td>
                            <td><%# Eval("Estado", "{0:Activo;Inactivo}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </tbody>

        </table>
    </div>
</asp:Content>

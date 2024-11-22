<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HistorialVentasOpciones.aspx.cs" Inherits="ecommerce.HistorialVentasOpciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2>Historial de Ventas</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>NumVenta</th>
                    <th>Cliente</th>
                    <th>Email</th>
                    <th>Fecha</th>
                    <th>Metodo de Pago</th>
                    <th>Envio</th>
                    <th>Importe Total</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RepHistorialVentas" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("NumVenta") %></td>
                            <td><%# Eval("Cliente.Nombre") %></td>
                            <td><%# Eval("Cliente.Email") %></td>
                            <td><%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %></td>
                            <td><%# Eval("MetodoPago") %></td>
                            <td><%# Eval("Envio.Descripcion") %></td>
                            <td><%# Eval("TotalVenta", "{0:C}") %></td>
                            <td><%# Eval("Estado.NombreEstado") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HistorialVentasOpciones.aspx.cs" Inherits="ecommerce.HistorialVentasOpciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        /*        .sidebar {
            height: 100%;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #f8f9fa;
            padding-top: 20px;
        }

            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: #333;
                display: block;
            }

                .sidebar a:hover {
                    background-color: #ddd;
                }*/

        .main-content {
            margin-left: 260px;
            padding: 20px;
        }

        .filter-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .order-status {
            display: flex;
            justify-content: space-between;
        }

            .order-status > div {
                width: 24%;
                border: 1px solid #ddd;
                padding: 10px;
                border-radius: 5px;
                background-color: #f8f9fa;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <div class="sidebar">
        <a href="#">Inicio</a>
        <a href="#">Menú</a>
        <a href="#">Configuración</a>
        <a href="#">Pedidos</a>
        <a href="#">Envíos</a>
        <a href="#">Marketing</a>
        <a href="#">Administración</a>
        <a href="#">Centro de Ayuda</a>
    </div>--%>
    <div class="main-content">

        <div class="order-status">
            <div>
                <h5>Facturacion Total</h5>
                <asp:Label ID="lblFacturacion" Text=" " runat="server"></asp:Label>
            </div>
            <div>
                <h5>Ventas Totales</h5>
                <asp:Label ID="lblVentas" Text="" runat="server"></asp:Label>
            </div>
            <div>
                <h5>Promedio venta </h5>
                <asp:Label runat="server" ID="lblPromedio" Text=""></asp:Label>
            </div>
            <div>
                <h5>Finalizados</h5>
                <asp:Label runat="server" ID="lblFinalizados" Text=""></asp:Label>
            </div>
        </div>

        <div class="container mt-5">
            <h2>Historial de Ventas</h2>
            <div class="filter-section">

                <div>
                    <label for="medioPago">Medio de Pago</label>
                    <asp:DropDownList ID="ddlMedioPago" runat="server" CssClass="form-control" />
                </div>
                <div>
                    <label for="estado">Estado</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-control" />
                </div>
                <div>
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-primary" />
                </div>
            </div>
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
                        <th>Estado Actual</th>
                        <th>Ver Detalle</th>
                        <%-- <th>Cambiar Estado</th>--%>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RepHistorialVentas" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblNumVenta" Text='<%# Eval("NumVenta") %>' /></td>
                                <td><%# Eval("Cliente.Nombre") %></td>
                                <td><%# Eval("Cliente.Email") %></td>
                                <td><%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %></td>
                                <td><%# Eval("MetodoPago.MetodoNombre") %></td>
                                <td><%# Eval("Envio.Descripcion") %></td>
                                <td><%# Eval("TotalVenta", "{0:C}") %></td>
                                <td><%# Eval("Estado.NombreEstado") %></td>
                                <td>
                                    <asp:LinkButton runat="server" ID="btnDetalle" OnClick="btnDetalle_Click">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </asp:LinkButton>
                                </td>
                                <%--<td>
                                    <asp:LinkButton runat="server" ID="btnCambiarEstado">
                                        <i class="fa-solid fa-rotate-right"></i>
                                    </asp:LinkButton>
                                </td--%>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>

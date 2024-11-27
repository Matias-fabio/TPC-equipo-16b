<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HistorialVentasOpciones.aspx.cs" Inherits="ecommerce.HistorialVentasOpciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="estilos/historialVentas.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <h1 class="mb-4">Historial de Ventas</h1>

        <div class="order-status">
            <div class="status-card">
                <h5>Facturación Total</h5>
                <asp:Label ID="lblFacturacion" CssClass="h3" Text=" " runat="server"></asp:Label>
            </div>
            <div class="status-card">
                <h5>Ventas Totales</h5>
                <asp:Label ID="lblVentas" CssClass="h3" Text="" runat="server"></asp:Label>
            </div>
            <div class="status-card">
                <h5>Promedio Venta</h5>
                <asp:Label runat="server" ID="lblPromedio" CssClass="h3" Text=""></asp:Label>
            </div>
            <div class="status-card">
                <h5>Finalizados</h5>
                <asp:Label runat="server" ID="lblFinalizados" CssClass="h3" Text=""></asp:Label>
            </div>
        </div>

        <div class="filter-section">
            <div class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label for="medioPago" class="form-label">Medio de Pago</label>
                    <asp:DropDownList ID="ddlMedioPago" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-4">
                    <label for="estado" class="form-label">Estado</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select" />
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-warning w-100" />
                </div>
            </div>
        </div>

        <asp:UpdatePanel ID="UdpVentas" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>NumVenta</th>
                                <th>Cliente</th>
                                <th>Email</th>
                                <th>Fecha</th>
                                <th>Método de Pago</th>
                                <th>Envío</th>
                                <th>Estado Actual</th>
                                <th>Importe Total</th>
                                <th>Estado</th>
                                <th>Actualizar</th>
                                <th>Detalle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepHistorialVentas" runat="server" OnItemCommand="RepHistorialVentas_ItemCommand" OnItemDataBound="RepHistorialVentas_ItemDataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" ID="lblNumVenta" Text='<%# Eval("NumVenta") %>' /></td>
                                        <td><%# Eval("Cliente.Nombre") %></td>
                                        <td><%# Eval("Cliente.Email") %></td>
                                        <td><%# Eval("FechaVenta", "{0:dd/MM/yyyy}") %></td>
                                        <td><%# Eval("MetodoPago.MetodoNombre") %></td>
                                        <td><%# Eval("Envio.Descripcion") %></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Estado.NombreEstado") %>' runat="server" ID="lblEstadoActual" CssClass="EstadoActual" data-estado='<%# Eval("Estado.NombreEstado") %>'></asp:Label>
                                        </td>
                                        <td><%# Eval("TotalVenta", "{0:C}") %></td>
                                        <td>
                                            <asp:DropDownList runat="server" ID="ddlCambioEstado" DataTextField="NombreEstado" DataValueField="IdEstado" CssClass="form-select form-select-sm">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="btnActualizarEstado" CommandName="ActualizarEstado" CommandArgument='<%# Eval("NumVenta") %>' CssClass="btn btn-sm btn-outline-warning">
                                                <i class="fas fa-sync-alt"></i>
                                            </asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="btnDetalle" OnClick="btnDetalle_Click" CssClass="btn btn-sm ">
                                                <i class="fas fa-search"></i>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

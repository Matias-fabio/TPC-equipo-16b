<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VentaDetallada.aspx.cs" Inherits="ecommerce.VentaDetallada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="estilos/ventaDetallada.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Detalle de la Venta</h2>
        <div class="card mb-4">
            <div class="row g-3 align-items-center">
                <div class="col-md-4">
                    <label for="lblNumVentaValue" class="form-label">Número de Venta:</label>
                </div>
                <div class="col-md-8">
                    <asp:Label ID="lblNumVentaValue" runat="server" CssClass="form-control-static" />
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="gvDetallesVenta" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover" DataKeyNames="IdDetalleVenta">
                <Columns>
                    <asp:BoundField DataField="NumVenta" HeaderText="Número de Venta" />
                    <asp:BoundField DataField="Articulo.Nombre" HeaderText="Nombre Artículo" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="mt-4">
            <asp:Button ID="btnVolver" runat="server" Text="Volver " CssClass="btn btn-warning" OnClick="btnVolver_Click" />
        </div>
    </div>
</asp:Content>


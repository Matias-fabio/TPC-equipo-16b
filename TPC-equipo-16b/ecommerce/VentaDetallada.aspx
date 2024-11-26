<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VentaDetallada.aspx.cs" Inherits="ecommerce.VentaDetallada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4">Detalle de la Venta</h2>
        <div class="row mb-4">
            <div class="col">
                <label for="lblNumVentaValue" class="form-label">Número de Venta:</label>
                <asp:Label ID="lblNumVentaValue" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="gvDetallesVenta" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataKeyNames="IdDetalleVenta">
                <Columns>

                    <asp:BoundField DataField="NumVenta" HeaderText="Número de Venta" />
                    <asp:BoundField DataField="Articulo.Nombre" HeaderText="Nombre Artículo" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

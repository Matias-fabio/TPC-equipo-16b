<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="ecommerce.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h2>Productos</h2>
    <asp:Label Text="" runat="server" ID="lblMensaje" />
    <asp:Repeater ID="rptCarrito" runat="server" OnItemCommand="rptCarrito_ItemCommand">
        <ItemTemplate>
            <div class="carrito-item">
                <div class="col-3">
                    <img src="<%#Eval("UrlImagen") %>" alt="...">
                </div>
                <div class="producto-info">
                    <p><strong><%# Eval("Nombre") %></strong></p>
                </div>
                <div class="precio">
                    <p><%# Eval("Precio", "{0:C}") %></p>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="acciones">
                            <asp:Button ID="btnRestar" runat="server" CommandName="RestarCantidad" CommandArgument='<%# Eval("Id") %>' Text="-" CssClass="btn btn-outline-secondary btn-cantidad" />
                            <span class="cantidad"><%# Eval("Cantidad") %></span>
                            <asp:Button ID="btnSumar" runat="server" CommandName="SumarCantidad" CommandArgument='<%# Eval("Id") %>' Text="+" CssClass="btn btn-outline-secondary btn-cantidad" />

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div>
                    <asp:Button ID="btnEliminar" runat="server" CommandName="EliminarProducto" CommandArgument='<%# Eval("Id") %>' OnClick="btnEliminar_Click" Text="Eliminar" CssClass="btn btn-warning" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="lbl-total">
                <h4>Total:
                    <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></h4>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblVacio" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <div class="btnFinalizar">
        <asp:Button ID="btnFinalizar" Text="Finalizar Compra" runat="server" CssClass="btn btn-warning" OnClick="btnFinalizar_Click" />
    </div>

</asp:Content>

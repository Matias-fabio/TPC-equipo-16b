<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="usuarioOpciones.aspx.cs" Inherits="ecommerce.usuarioOpciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="profile-header">
            <h2 class="mb-4">Mi Perfil</h2>
        </div>

        <ul class="nav nav-tabs mb-4" id="profileTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="datos-tab" data-bs-toggle="tab" data-bs-target="#datos" type="button" role="tab" aria-controls="datos" aria-selected="true">Mis Datos</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="compras-tab" data-bs-toggle="tab" data-bs-target="#compras" type="button" role="tab" aria-controls="compras" aria-selected="false">Mis Compras</button>
            </li>
        </ul>

        <div class="tab-content" id="profileTabsContent">
            <div class="tab-pane fade show active" id="datos" role="tabpanel" aria-labelledby="datos-tab">
                <div class="form-container">
                    <div class="mb-3">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                    </div>
                    <div class="mb-3">
                        <label for="txtNombre" class="form-label">Nombre</label>
                        <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtNombre" />
                    </div>
                    <div class="mb-3">
                        <label for="txtApellido" class="form-label">Apellido</label>
                        <asp:TextBox ID="txtApellido" ClientIDMode="Static" runat="server" CssClass="form-control" MaxLength="50" />
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <asp:Button Text="Guardar" CssClass="btn btn-warning" OnClientClick="return validar()" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" />
                        <a href="/" class="btn btn-secondary">Regresar</a>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="compras" role="tabpanel" aria-labelledby="compras-tab">
                <h3 class="mb-3">Mis Compras</h3>
                <asp:GridView ID="gvCompras" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="NumVenta" HeaderText="N° Pedido" />
                        <asp:BoundField DataField="FechaVenta" HeaderText="Fecha" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="MetodoPago.MetodoNombre" HeaderText="MetodoPago" />
                        <asp:BoundField DataField="TotalVenta" HeaderText="Total" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Estado.NombreEstado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ecommerce.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <h2 class="text-center mb-4">Checkout</h2>
        <div class="row">
            <div class="steps mb-4 ">
                <span class="step" id="step1">1. Datos Personales</span>
                <span class="step" id="step2">2. Datos de Envío</span>
                <span class="step" id="step3">3. Datos de Pago</span>
            </div>
            <div class="col-md-8">
                <section class="card">
                    <div class="card-body">
                        <article id="checkoutSteps">
                            <%//Datos personales %>
                            <div class="step-content" id="step1Content">
                                <h4>Datos Personales</h4>
                                <div class="card-dp mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <label for="inputEmail" class="form-label">Email</label>
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="Email *"></asp:TextBox>
                                        </div>
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chkCrearCuenta" runat="server" CssClass="" type="checkbox" OnCheckedChanged="chkCrearCuenta_CheckedChanged" AutoPostBack="true" />
                                                    <label class="form-check-label" for="chkCrearCuenta">
                                                        Crear una cuenta?
                                                    </label>
                                                </div>
                                                <asp:Panel ID="pnlPassword" runat="server" Visible="false">
                                                    <div class="row">
                                                        <div class="col">
                                                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" Placeholder="Contraseña *"></asp:TextBox>
                                                        </div>
                                                        <div class="col">
                                                            <asp:TextBox ID="txtPasswordRep" CssClass="form-control" runat="server" TextMode="Password" Placeholder="Repetir contraseña *"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblError" CssClass="text-danger" runat="server" Visible="false"></asp:Label>
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="row g-3">
                                            <div class="col">
                                                <label for="inputNombre" class="form-label">Nombre</label>
                                                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" Placeholder="Nombre *"></asp:TextBox>
                                            </div>
                                            <div class="col">
                                                <label for="inputApellido" class="form-label">Apellido</label>
                                                <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" Placeholder="Apellido *"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label for="inputAddress2" class="form-label">Telefono:</label>
                                            <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" Placeholder="Telefono(opcional)"></asp:TextBox>
                                        </div>
                                        <div class="text-end">
                                            <asp:Button ID="btnNext1" CssClass="btn btn-warning" runat="server" Text="Siguiente" OnClientClick="showStep(2); return false;" OnClick="btnNext1_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%//Datos Envio %>
                            <div class="step-content d-none" id="step2Content">
                                <h4>Datos de Envío</h4>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" Placeholder="Dirección *"></asp:TextBox>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col">
                                                <label for="inputNombre" class="form-label">Ciudad</label>
                                                <asp:TextBox ID="txtCiudad" CssClass="form-control" runat="server" Placeholder="Ciudad"></asp:TextBox>
                                            </div>
                                            <div class="col">
                                                <label for="inputApellido" class="form-label">Provincia</label>
                                                <asp:TextBox ID="txtProv" CssClass="form-control" runat="server" Placeholder="Provincia"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="mb-3 col">
                                            <label for="inputNombre" class="form-label">Zona de envio: </label>
                                            <asp:DropDownList ID="ddlZonaEnvio" CssClass="form-select" runat="server" AutoPostBack="true">
                                                <asp:ListItem Text="Seleccionar zona *" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblCostoEnvio" CssClass="form-text" runat="server" Text="Costo de envío: $0"></asp:Label>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:Button ID="btnBack1" CssClass="btn btn-secondary" runat="server" Text="Volver" OnClientClick="showStep(1); return false;" />
                                            <asp:Button ID="btnNext2" CssClass="btn btn-primary" runat="server" Text="Siguiente" OnClientClick="showStep(3); return false;" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%//Datos pago %>
                            <div class="step-content d-none" id="step3Content">
                                <h4>Datos de Pago</h4>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <asp:RadioButtonList ID="rblMetodoPago" CssClass="form-check" RepeatDirection="Horizontal" runat="server" AutoPostBack="true">
                                            <asp:ListItem Text="Tarjeta de crédito" Value="Tarjeta"></asp:ListItem>
                                            <asp:ListItem Text="Transferencia/Mercado Pago" Value="Transferencia"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:Panel ID="pnlTarjeta" runat="server" Visible="true">
                                            <div class="mb-3">
                                                <asp:TextBox ID="txtNumeroTarjeta" CssClass="form-control" runat="server" Placeholder="Número de tarjeta"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <asp:TextBox ID="txtNombreTitular" CssClass="form-control" runat="server" Placeholder="Nombre del titular"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <asp:TextBox ID="txtFechaVencimiento" CssClass="form-control" runat="server" Placeholder="Fecha de vencimiento (MM/YY)"></asp:TextBox>
                                            </div>
                                            <div class="mb-3">
                                                <asp:TextBox ID="txtCVV" CssClass="form-control" runat="server" Placeholder="CVV"></asp:TextBox>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlTranferencia" runat="server" Visible="false">
                                        </asp:Panel>
                                        <div class="d-flex justify-content-between">
                                            <asp:Button ID="btnBack2" CssClass="btn btn-secondary" runat="server" Text="Volver" OnClientClick="showStep(2); return false;" />
                                            <asp:Button ID="btnFinalizarCompra" CssClass="btn btn-success" runat="server" Text="Finalizar Compra" OnClick="btnFinalizarCompra_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
            </div>

            <article class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4>Detalle de la Compra</h4>
                        <ul class="list-group mb-3">
                            <asp:Repeater ID="rptDetalleCompra" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <span><%# Eval("NombreProducto") %></span>
                                        <span>$<%# Eval("Precio") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <div class="d-flex justify-content-between">
                            <strong>Total:</strong>
                            <asp:Label ID="lblTotal" CssClass="fw-bold" runat="server" Text="$0"></asp:Label>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>
    <script>
        function showStep(step) {
            // Ocultar todos los pasos
            document.querySelectorAll('.step-content').forEach(function (content) {
                content.classList.add('d-none');
            });

            // Mostrar el paso actual
            document.getElementById(`step${step}Content`).classList.remove('d-none');

            // Actualizar visualmente los pasos
            document.querySelectorAll('.step').forEach(function (stepElement, index) {
                if (index + 1 <= step) {
                    stepElement.classList.add('text-primary', 'fw-bold');
                } else {
                    stepElement.classList.remove('text-primary', 'fw-bold');
                }
            });
        }


    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ecommerce.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="estilos/checkout.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <h2 class="text-center mb-4">Checkout</h2>
        <div class="row">

            <div class="col-md-8">
                <div class="steps mb-4 " style="display: flex; justify-content: space-between;">
                    <h5 class="step text-muted" id="step1">1. Datos Personales</h5>
                    <h5 class="step text-muted" id="step2">2. Datos de Envío</h5>
                    <h5 class="step text-muted" id="step3">3. Datos de Pago</h5>
                </div>
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
                            <%-- Datos Envío --%>
                            <div class="step-content d-none" id="step2Content">
                                <h4>Datos de Envío</h4>
                                <div class="card-de mb-3">
                                    <div class="card-body">
                                        <div class="mb-3">
                                            <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" Placeholder="Dirección *"></asp:TextBox>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col">
                                                <label for="inputCiudad" class="form-label">Ciudad</label>
                                                <asp:TextBox ID="txtCiudad" CssClass="form-control" runat="server" Placeholder="Ciudad"></asp:TextBox>
                                            </div>
                                            <div class="col">
                                                <label for="inputProvincia" class="form-label">Provincia</label>
                                                <asp:TextBox ID="txtProv" CssClass="form-control" runat="server" Placeholder="Provincia"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <div class="mb-3 col">
                                                    <label for="inputZonaEnvio" class="form-label">Zona de envío:</label>
                                                    <asp:DropDownList ID="ddlZonaEnvio" CssClass="form-select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlZonaEnvio_SelectedIndexChanged">
                                                        <asp:ListItem Text="Seleccionar zona *" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <div class="image-container d-flex justify-content-center align-items-center" style="width: 640px; height: 490px; overflow: hidden; object-fit: cover;">
                                                        <img src="https://droppers.com.ar/media/wysiwyg/newsletter/tarifario_envios_octubre.png" alt="Información de envíos" class="img-fluid" style="max-width: 100%; max-height: 100%;" />
                                                    </div>
                                                    <asp:Label ID="lblCostoEnvio" CssClass="form-text" runat="server" Text="Costo de envío: $0"></asp:Label>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="d-flex justify-content-between">
                                            <asp:Button ID="btnBack1" CssClass="btn btn-secondary" runat="server" Text="Volver" OnClientClick="showStep(1); return false;" />
                                            <asp:Button ID="btnNext2" CssClass="btn btn-warning" runat="server" Text="Siguiente" OnClientClick="showStep(3); return false;" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%//Datos pago %>
                            <div class="step-content d-none" id="step3Content">
                                <h4>Datos de Pago</h4>
                                <div class="card-dp mb-3">
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div class="card-body">
                                                <asp:RadioButtonList ID="rblMetodoPago" CssClass="form-check" RepeatDirection="Horizontal" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblMetodoPago_SelectedIndexChanged">
                                                    <asp:ListItem Text="Tarjeta de crédito" Value="Tarjeta"></asp:ListItem>
                                                    <asp:ListItem Text="Transferencia/Mercado Pago" Value="Transferencia"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:Panel ID="pnlTarjeta" runat="server" Visible="false">
                                                    <asp:UpdatePanel ID="updCard" runat="server">
                                                        <ContentTemplate>
                                                            <div class="card-tarjeta">
                                                                <div class="numero">
                                                                    <asp:Label ID="lblCardNumero" runat="server" Text="#### #### #### ####"></asp:Label>
                                                                </div>
                                                                <div class="titular">
                                                                    <asp:Label ID="lblCardTitual" runat="server" Text="Nombre del titular"></asp:Label>
                                                                </div>
                                                                <div class="vencimineto">
                                                                    <label>Vencimiento:</label>
                                                                    <asp:Label ID="lblCardVencimiento" runat="server" Text="MM/YY"></asp:Label>
                                                                </div>
                                                                <div class="cvv">
                                                                    <asp:Label ID="lblCardCVV" runat="server" Text="CVV"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <div class="mb-3">
                                                        <asp:TextBox ID="txtNumeroTarjeta" CssClass="form-control" runat="server" Placeholder="Número de tarjeta" AutoPostBack="true" OnTextChanged="txtNumeroTarjeta_TextChanged"></asp:TextBox>
                                                    </div>
                                                    <div class="mb-3">
                                                        <asp:TextBox ID="txtNombreTitular" CssClass="form-control" runat="server" Placeholder="Nombre del titular" AutoPostBack="true" OnTextChanged="txtNombreTitular_TextChanged"></asp:TextBox>
                                                    </div>
                                                    <div class="mb-3">
                                                        <asp:TextBox ID="txtFechaVencimiento" CssClass="form-control" runat="server" Placeholder="Fecha de vencimiento (MM/YY)" AutoPostBack="true" OnTextChanged="txtFechaVencimiento_TextChanged"></asp:TextBox>
                                                    </div>
                                                    <div class="mb-3">
                                                        <asp:TextBox ID="txtCVV" CssClass="form-control" runat="server" Placeholder="CVV" AutoPostBack="true" OnTextChanged="txtCVV_TextChanged"></asp:TextBox>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlTranferencia" runat="server" Visible="false">
                                                    <h3>Pasos para realizar tu transferencia</h3>
                                                    <p>Por favor, sigue los pasos detallados a continuación para completar tu compra:</p>
                                                    <ul class="card-body">
                                                        <li>Realiza una transferencia bancaria o envio dinero a través de Mercado Pago.</li>
                                                        <li>Utiliza los siguientes datos para completar la operación:</li>
                                                        <li>
                                                            <p class="card-text"><strong>Banco:</strong> Banco Santander Rio.</p>
                                                            <p class="card-text"><strong>CBU:</strong> 1234567890123456789012</p>
                                                            <p class="card-text"><strong>Alias:</strong> Alias.Transferencia</p>
                                                            <p class="card-text"><strong>Cuenta a nombre de:</strong> Empresa E-Commerce S.A.</p>
                                                        </li>
                                                        <li>Una vez finalizada la transferencia, adjunta el comprobante  a continuación y haz clic en "Finalizar compra".</li>
                                                        <li>Al procesar correctamente el pago de notificara en el mail registrado(revisar SPAM).</li>
                                                    </ul>
                                                    <asp:FileUpload ID="fUComprobante" runat="server" CssClass="form-control" />
                                                </asp:Panel>
                                                <div class="d-flex justify-content-between">
                                                    <asp:Button ID="btnBack2" CssClass="btn btn-secondary" runat="server" Text="Volver" OnClientClick="showStep(2); return false;" />
                                                    <asp:Button ID="btnFinalizarCompra" CssClass="btn btn-success" runat="server" Text="Finalizar Compra" OnClick="btnFinalizarCompra_Click" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </article>
                    </div>
                </section>
            </div>

            <article class="col-md-4">
                <asp:UpdatePanel ID="updDetalle" runat="server">
                    <ContentTemplate>
                        <div class="card" style="border: none;">
                            <div class="card-body" style="margin: 20px;">
                                <h4>Detalle de la Compra</h4>
                                <ul class="list-group mb-3">
                                    <asp:Repeater ID="rptDetalleCompra" runat="server" OnItemCommand="rptDetalleCompra_ItemCommand">
                                        <ItemTemplate>
                                            <li class="list-group-item d-flex justify-content-between" style="border: none; margin-bottom: 30px;">
                                                <div class=" d-flex" style="flex-direction: column; gap: 20px;">
                                                    <div class="image-container d-flex justify-content-center "
                                                        style="width: 100px; height: 60px; overflow: hidden;">
                                                        <img src="<%# Eval("UrlImagen") %>" alt="..." class="img-fluid">
                                                    </div>
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <div class="acciones d-flex  align-items-center" style="width: 50px;">
                                                                <asp:Button ID="btnRestar" runat="server" CommandName="RestarCantidad" CommandArgument='<%# Eval("Id") %>' Text="-" CssClass="btn btn-outline-secondary btn-cantidad" BorderStyle="None" />
                                                                <span class=""><%# Eval("Cantidad") %></span>
                                                                <asp:Button ID="btnSumar" runat="server" CommandName="SumarCantidad" CommandArgument='<%# Eval("Id") %>' Text="+" CssClass="btn btn-outline-secondary btn-cantidad" BorderStyle="None" />

                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>

                                                <span><%# Eval("Nombre") %></span>
                                                <span>$<%# Eval("Precio") %></span>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <p class="card-text mb-0">Tenes un cupon? Ingresa tu Codigo.</p>
                                    <asp:TextBox ID="txtbCupon" runat="server" CssClass="form-control underline-textbox"></asp:TextBox>
                                </div>
                                <hr class="w-100 mb-3 text-muted">
                                <div class="row" style="gap: 14px">
                                    <div class="d-flex justify-content-between">
                                        <span>Subtotal:</span>
                                        <asp:Label ID="lblTotal" CssClass="" runat="server" Text="$0"></asp:Label>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <span class="form-text">Cupon:</span>
                                        <asp:Label ID="LblCupon" CssClass="form-text" runat="server" Text="Descuento"></asp:Label>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <asp:Label ID="LblCT" CssClass="form-text" runat="server" Text="Costo de envío: "></asp:Label>
                                        <asp:Label ID="LblST" CssClass="form-text" runat="server" Text="$0"></asp:Label>
                                    </div>
                                </div>
                                <hr class="w-100 mb-3 text-muted">
                                <div class="d-flex justify-content-between">
                                    <h4>Total</h4>
                                    <asp:Label ID="Label1" CssClass="form-text" runat="server" Text="$0"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </article>
        </div>
    </div>
    <!-- Modal de Agradecimiento -->
    <!-- Modal de Agradecimiento -->
    <div class="modal fade" id="modalAgradecimiento" tabindex="-1" role="dialog" aria-labelledby="modalAgradecimientoLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content bg-white">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgradecimientoLabel">¡Gracias por tu compra!</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <i class="fa-regular fa-circle-check"></i>
                    <h5 class="modal-title">Gracias por tu compra</h5>
                    <p>Tu compra ha sido registrada correctamente.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showStep(step) {

            document.querySelectorAll('.step-content').forEach(function (content) {
                content.classList.add('d-none');
            });

            document.getElementById(`step${step}Content`).classList.remove('d-none');

            document.querySelectorAll('.step').forEach(function (stepElement, index) {
                if (index + 1 <= step) {
                    stepElement.classList.add('text-primary', 'fw-bold');
                } else {
                    stepElement.classList.remove('text-primary', 'fw-bold');
                }
            });
        }

    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>

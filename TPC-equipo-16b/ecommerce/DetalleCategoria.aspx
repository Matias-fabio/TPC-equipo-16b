<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleCategoria.aspx.cs" Inherits="ecommerce.DetalleCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container-md container-tendencias">
        <div class="row grid gap-4">
            <h3>
                <asp:Label runat="server" CssClass="text-body-secondary opacity-75" ID="lblCategoria" Text=" "></asp:Label></h3>

            <div class="row">
 
                <aside class="col-md-2">
                    <h5 class="text-body-secondary opacity-75 mb-3">Categorías</h5>
                    <ul class="list-group">
                        <asp:Repeater ID="repCategorias" runat="server" OnItemCommand="repCategorias_ItemCommand">
                            <ItemTemplate>
                                <li class="list-group-item">
                                    <asp:LinkButton
                                        runat="server"
                                        CssClass="text-decoration-none text-body-secondary"
                                        CommandName="FiltrarCategoria"
                                        CommandArgument='<%# Eval("ID") %>'>
                                    <%# Eval("Nombre") %>
                                    </asp:LinkButton>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </aside>
                <div class="col-md-10">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3>
                            <asp:Label runat="server" CssClass="text-body-secondary opacity-75" ID="Label1" Text=" "></asp:Label>
                        </h3>
                        <div>
                            <asp:DropDownList ID="ddlOrdenar" runat="server" CssClass="form-select " AutoPostBack="true">
                                <asp:ListItem Text="Destacados" Value="" />
                                <asp:ListItem Text="Precio: Menor a Mayor" Value="Asc" />
                                <asp:ListItem Text="Precio: Mayor a Menor" Value="Desc" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row g-4">
                        <asp:Repeater runat="server" ID="repCardArt">
                            <ItemTemplate>
                                <div class="col-md-4 d-flex">
                                    <asp:LinkButton runat="server" CommandName="VerDetalles" ID="VerDetalles" CommandArgument='<%# Eval("ID") %>' OnCommand="VerDetalles_Command" CssClass="link-button text-decoration-none text-body-secondary">
                                        <div class="card-tendencias mb-3 mx-2">
                                            <div class="row g-0 align-items-center" style="flex: 1;">
                                                <div class="col-5">
                                                    <img src="<%#Eval("UrlImagen") %>" class="img-fluid rounded-start" alt="...">
                                                </div>
                                                <div class="col-7">
                                                    <div class="card-body">
                                                        <p class="card-text">
                                                            <small class="text-body-secondary opacity-50"><%#Eval("Categoria") %></small>
                                                        </p>
                                                        <h5 class="card-title fs-6"><%#Eval("Nombre") %></h5>
                                                        <h6 class="card-text fs-5">$ <%#Eval("Precio") %></h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

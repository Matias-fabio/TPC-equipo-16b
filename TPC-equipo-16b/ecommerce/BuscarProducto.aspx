﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BuscarProducto.aspx.cs" Inherits="ecommerce.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Productos</h1>
    <section class="container-md container-tendencias">
        <div class="row grid gap-4">
            <h3>
                <asp:Label runat="server" CssClass="text-body-secondary opacity-75" ID="lblCategoria" Text=" "></asp:Label></h3>
            <div class="d-flex flex-wrap justify-content-center">
                <asp:Repeater runat="server" ID="repCardArt">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CommandName="VerDetalles" ID="VerDetalles" CommandArgument='<%# Eval("ID") %>' OnCommand="VerDetalles_Command" CssClass="link-button text-decoration-none text-body-secondary  ">
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
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label ID="lblNoResults" runat="server" Text="No se encontraron resultados." Visible="False"></asp:Label>
            </div>
        </div>

    </section>
</asp:Content>

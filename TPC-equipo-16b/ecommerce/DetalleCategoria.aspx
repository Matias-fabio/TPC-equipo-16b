<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleCategoria.aspx.cs" Inherits="ecommerce.DetalleCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <section class="container-md container-tendencias">
        <div class="row grid gap-4">
            <h3><asp:Label runat="server" CssClass="text-body-secondary opacity-75" ID="lblCategoria" Text=" "></asp:Label></h3>
            <div class="d-flex flex-wrap justify-content-center">
                <asp:Repeater runat="server" ID="repCardArt">
                    <ItemTemplate>
                        <div class="card-tendencias mb-3 mx-2">
                            <div class="row g-0 align-items-center" style="flex: 1;">
                                <div class="col-5">
                                    <img src="<%#Eval("UrlImagen") %>" class="img-fluid rounded-start" alt="...">
                                </div>
                                <div class="col-7">
                                    <div class="card-body">
                                        <p class="card-text">
                                            <small class="text-body-secondary opacity-50"><%#Eval("categoria") %></small>
                                        </p>
                                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                        <h5 class="card-text">$ <%#Eval("Precio") %></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

</asp:Content>

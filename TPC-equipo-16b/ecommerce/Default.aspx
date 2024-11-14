       <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ecommerce.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="carousel-container">
        <div class="row row-cols-auto">
            <div class="col ">
                <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="2000">
                            <img src="https://d2r9epyceweg5n.cloudfront.net/stores/102/392/rte/PORTADA%20CYBER-05.jpg" class="d-block w-100 h-auto " alt="...">

                        </div><div class="carousel-item" data-bs-interval="2000">
                            <img src="https://www.asrock.com/images/index_AMD24Q3.jpg" class="d-block w-100 h-auto " alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="https://dlcdnwebimgs.asus.com/gain/045A87EA-7742-4E19-831D-241AD480C9AA/fwebp" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="https://i0.wp.com/uranostream.com/wp-content/uploads/2024/08/ASUS-A21-BLACK-WHITE-1350x600-URANO-STREAM.jpg?w=1350&ssl=1" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="https://www.asrock.com/images/index_MonitorF.jpg" class="d-block w-100" alt="...">
                        </div>

                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <section class="container-md">
        <div class="row">
            <h3>CATEGORÍAS DESTACADAS </h3>
            <div class="container-md">
                <div class="card-categorias ">
                    <asp:Repeater runat="server" ID="repCategorias" OnItemCommand="repCategorias_ItemCommand">
                        <ItemTemplate>
                            <div class="row ">
                                <div class="col">
                                    <div class="card card-content" style="cursor: pointer; aspect-ratio: 1/1; border: none;">
                                        <asp:LinkButton runat="server" CommandName="Select" CommandArgument='<%#Eval("Id") %>' CssClass="card-link">
                                           <img src="<%#Eval("UrlImagen") %>" class="card-img" alt="..." " >
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    <section class=" container-banner">
        <div class="row row-cols-auto">
            <div class="col">
            </div>
        </div>
    </section>

    <section class="container-md container-tendencias">
        <div class="row grid gap-4">
            <h3>PRODUCTOS EN TENDENCIA</h3>
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
                <asp:Label ID="lblTotal" runat="server" Text="Total: $0.00"></asp:Label>
            </div>
        </div>
    </section>
</asp:Content>




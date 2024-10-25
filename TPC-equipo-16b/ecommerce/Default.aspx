<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ecommerce.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-md">
        <h1>default page</h1>
        <asp:Repeater runat="server" ID="repCardArt">
            <ItemTemplate>

                <div class="card" style="width: 20rem;">
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                        <p class="card-text"><%#Eval("Descripcion") %></p>
                        <h3 class="card-text"><%#Eval("Precio") %></h3>
                    </div>
                </div>


            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

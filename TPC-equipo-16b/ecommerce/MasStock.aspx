﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MasStock.aspx.cs" Inherits="ecommerce.MasStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <h1>Aumentar stock</h1>
   <div class="MasStock">
       <div class="col-md-12">
           <label for="ddlArticulos" class="form-label">Selecione categoria a agregar sotck</label>
           <div class="input-group has-validation">
               <asp:DropDownList ID="ddlArticulos" runat="server" CssClass="form-control"></asp:DropDownList>
           </div>
       </div>
       <div class="col-md-12">
           <label for="validationCustomUsername" class="form-label">Stock ahora</label>
           <div class="input-group has-validation">
               <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Text="" TextMode="Number">1</asp:TextBox>
           </div>
       </div>
       <div class="col-md-12">
           <label for="validationCustomUsername" class="form-label">Cantidad stock que quieras agregar</label>
           <div class="input-group has-validation">
               <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text="" TextMode="Number"></asp:TextBox>
           </div>
       </div>
     
       <div class="col-md-12">
           <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
           <div class="col-12" id="BotonNuevoArticulo">
               <div class="d-grid gap-2 col-8 mx-auto">
                   <asp:LinkButton ID="BotonAgregar" runat="server" class="btn btn-primary" type="button" >
                     <h3>Subir Stock</h3>
                   </asp:LinkButton>
                   <asp:LinkButton ID="BotonVolver" runat="server" class="btn btn-primary" type="button" OnClick="BotonVolver_Click">
                     <h3>Volver</h3>
                   </asp:LinkButton>
               </div>
           </div>
       </div>
   </div>
</asp:Content>
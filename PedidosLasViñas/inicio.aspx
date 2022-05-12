<%@ Page Title="" Language="C#" MasterPageFile="~/paginaMaestra.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="PedidosLasViñas.inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navActive" runat="server">
    <ul class="nav">
        <li class="active ">
            <a href="inicio.aspx">
                <i class="fas fa-home"></i>
                <p>Inicio</p>
            </a>
        </li>
        <li id="liUsuarios" runat="server">
            <a href="usuarios.aspx">
                <i class="nc-icon nc-single-02"></i>
                <p>Usuarios</p>
            </a>
        </li>
        <li>
            <a href="pedidos.aspx">
                <i class="nc-icon nc-calendar-60"></i>
                <p>Pedidos</p>
            </a>
        </li>
        <li>
            <a href="productos.aspx">
                <i class="fas fa-bread-slice"></i>
                <p>Productos</p>
            </a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mt-4 text-center">INICIO</h1>
</asp:Content>

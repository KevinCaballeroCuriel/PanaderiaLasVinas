<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/paginaMaestra.Master" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="PedidosLasViñas.productos" MaintainScrollPositionOnPostback="true" %>
<%@ import Namespace="MODELO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="include/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.min.css"/>
  
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.min.js"></script>
    <script>
        $(document).ready( function () {
            $('#ContentPlaceHolder1_gvBuscarPedidos').DataTable(
                {
                    language: {
                        search: "Buscar:",
                        lengthMenu: "Mostrando _MENU_ entradas",
                        info: "Mostrando _START_ - _END_ de _TOTAL_ elementos",
                        paginate: {
                            previous: "Anterior",
                            next: "Siguiente",
                        },
                    }
                });
        } );
    </script>
    <script src="include/js/modal.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navActive" runat="server">
    <ul class="nav">
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
        <li class="active ">
            <a href="productos.aspx">
                <i class="fas fa-bread-slice"></i>
                <p>Productos</p>
            </a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="mt-4 text-center">PRODUCTOS</h1>
        <%--<div class="input-group input-group-sm mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-sm">Buscar</span>
          </div>
            <asp:TextBox runat="server" ID="txtCriterios" CssClass="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
        </div>--%>
        
        <div class="form-group">
             <label>Categoria:</label>
             <asp:DropDownList CssClass="custom-select" ID="ddlCategoria" runat="server">
                <asp:ListItem Value="0" Enabled="true" Selected="True" Text="Selecciona">Selecciona</asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:CheckBoxList ID="chbxEstado" RepeatDirection="Horizontal" CellSpacing="20" runat="server">
            <asp:ListItem Selected="True" Value="1">&nbsp;&nbsp; Disponibles &nbsp;&nbsp;</asp:ListItem>
            <asp:ListItem Value="0">&nbsp;&nbsp; No disponibles</asp:ListItem>
        </asp:CheckBoxList>

        <div class="mb-1">
            <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnBuscar_Click" />
            <asp:Button ID="btnAgregar" Text="Agregar" CssClass="btn btn-success float-right mt-1" runat="server" OnClick="btnAgregar_Click" />
        </div>
         
        <asp:GridView ID="gvBuscarPedidos" CssClass="table table-bordered table-striped table-hover DataTable" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="ID">   
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>   
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="idProducto" HeaderText="Folio" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                <asp:BoundField DataField="precio" HeaderText="Precio" />
                <asp:TemplateField HeaderText="Categoría">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<% #GetLabelTextCategoria(Eval("idCategoria")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Disponibilidad">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<% #GetLabelTextDisponibilidad(Eval("disponibilidad")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <!--<asp:LinkButton ID="linkVerProducto" OnClick="linkVerPedido_Click" obj=''  runat="server"><i class="fas fa-eye"></i></asp:LinkButton>-->
                        <asp:LinkButton ID="linkModificar" OnClick="linkModificar_Click" obj='<%# Eval("idProducto") %>' runat="server"><i class="fas fa-pencil-alt"></i></asp:LinkButton>
                        <asp:LinkButton ID="linkEliminar" OnClick="linkEliminar_Click" obj='<%# Eval("idProducto") %>'  runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Agregar Modal-->
    <div class="modal fade" id="agregarModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Agregar Producto</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Nombre:</label>
                            <asp:TextBox ID="txtNombreAgregar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-8">
                            <label>Descripción:</label>
                            <asp:TextBox ID="txtDescripcionAgregar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Precio:</label>
                            <asp:TextBox ID="txtPrecioAgregar" class="form-control" type="number" step="0.01" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Disponibilidad</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlDisponibilidadAgregar" runat="server">
                                <asp:ListItem Value="1" Text="Disponible">Disponible</asp:ListItem>
                                <asp:ListItem Value="0" Text="No disponible">No disponible</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Categoria:</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlCategoriaAgregar" runat="server">
                                <asp:ListItem Value="0" Enabled="true" Selected="True" Text="Selecciona">Selecciona</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnGuardarAgregar" Text="Agregar" CssClass="btn btn-primary" runat="server" OnClick="btnGuardarAgregar_Click" />
                </div>
            </div>
        </div>
    </div>

       <!-- Modificar Modal-->
    <div class="modal fade" id="modificarModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar Producto</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-4" hidden="hidden">
                            <label>ID</label>
                            <asp:TextBox ID="txtIdProduct" class="form-control" placeholder="ID" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Nombre:</label>
                            <asp:TextBox ID="txtNombreModificar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-8">
                            <label>Descripción:</label>
                            <asp:TextBox ID="txtDescripcionModificar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Precio:</label>
                            <asp:TextBox ID="txtPrecioModificar" class="form-control" type="number" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Disponibilidad</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlDisponibilidadModificar" runat="server">
                                <asp:ListItem Value="1" Text="Disponible">Disponible</asp:ListItem>
                                <asp:ListItem Value="0" Text="No disponible">No disponible</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Categoria:</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlCategoriaModificar" runat="server">
                                <asp:ListItem Value="0" Enabled="true" Selected="True" Text="Selecciona">Selecciona</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnGuardarModificar" Text="Guardar" CssClass="btn btn-primary" runat="server" OnClick="btnGuardarModificar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

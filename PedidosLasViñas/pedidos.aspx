<%@ Page Title="" Language="C#" MasterPageFile="~/paginaMaestra.Master" AutoEventWireup="true" CodeBehind="pedidos.aspx.cs" Inherits="PedidosLasViñas.pedidos" %>
<%@ import Namespace="MODELO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="include/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.min.css"/>
    <link href="../include/css/sweetalert.css" rel="stylesheet" />
    <script src="../include/js/sweetalert.js"></script>
    <script src="../include/js/sweetalert.min.js"></script>
    <script src="../include/js/sweetalerts.js"></script>  
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
        <li class="active ">
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
    <h1 class="mt-4 text-center">PEDIDOS</h1>
        <%--<div class="input-group input-group-sm mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-sm">Buscar</span>
          </div>
            <asp:TextBox runat="server" ID="txtCriterios" CssClass="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm"/>
        </div>--%>
        
        <div class="form-group">
             <label>Estatus:</label>
             <asp:DropDownList CssClass="custom-select" ID="ddlEstatus" runat="server">
                 <asp:ListItem Value="0" Enabled="true" Selected="True" Text="TODOS">TODOS</asp:ListItem>
                 <asp:ListItem Value="PENDIENTE DE PAGO" Enabled="true">PENDIENTES DE PAGO</asp:ListItem>
                 <asp:ListItem Value="PAGADO" Enabled="true">PAGADOS</asp:ListItem>
                 <asp:ListItem Value="ENTREGADO" Enabled="true">ENTREGADOS</asp:ListItem>
             </asp:DropDownList>
        </div>

        <div class="mb-1">
            <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnBuscar_Click" />
        </div>
    <div class="table-responsive-sm">
        <asp:GridView ID="gvBuscarPedidos" CssClass="table table-bordered table-striped table-hover DataTable" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="ID">   
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>   
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="idPedido" HeaderText="Folio" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                <asp:TemplateField HeaderText="Fecha" >          
                <ItemTemplate>
                  <asp:Label ID="lblFechaGV" runat="server"  Text='<%# Convert.ToDateTime(Eval("fechaDePedido")).ToString("dd/MM/yyyy HH:mm:ss") %>'></asp:Label>
                </ItemTemplate>
              </asp:TemplateField>
                <asp:BoundField DataField="CARRITO.precioDelCarrito" HeaderText="Precio" />
                <asp:BoundField DataField="estatus" HeaderText="Estatus" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkVerProducto" OnClick="linkVerPedido_Click" obj='<%# Eval("idPedido") %>'  runat="server"><i class="fas fa-eye"></i></asp:LinkButton>
                        <asp:LinkButton ID="linkModificar" OnClick="linkModificar_Click" obj='<%# Eval("idPedido") %>' runat="server"><i class="fas fa-pencil-alt"></i></asp:LinkButton>
                        <asp:LinkButton ID="linkEliminar" OnClick="linkEliminar_Click" obj='<%# Eval("idPedido") %>'  runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
        <!-- Ver Modal-->
    <div class="modal fade" id="verModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><strong>Ver Pedido</strong></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <strong>A nombre de:</strong>&nbsp<asp:Label ID="lblNombrePedido" Text="" runat="server" /><br/>
                    <strong>Dirección:</strong>&nbsp<asp:Label ID="lblDireccionPedido" Text="" runat="server" /><br/>
                    <strong>Teléfono:</strong>&nbsp<asp:Label ID="lblTelefonoPedido" Text="" runat="server" /><br/>
                    <strong>Fecha:</strong>&nbsp<asp:Label ID="lblFechaPedido" Text="" runat="server" /><br/>
                    <div class="table-responsive-sm">
                    <asp:GridView ID="gvCarritoPedido" CssClass="table table-bordered mt-3" AutoGenerateColumns="False" runat="server">
                        <Columns>
                            <asp:BoundField DataField="PRODUCTO.nombre" HeaderText="Producto" />
                            <asp:BoundField DataField="PRODUCTO.precio" HeaderText="Precio Unitario" />
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                            <asp:BoundField DataField="precioDelElemento" HeaderText="Precio Total" />
                        </Columns>
                    </asp:GridView></div>
                    <strong>Total:</strong>&nbsp$<asp:Label ID="lblTotalPedido" Text="" runat="server" /><br/>
                    <strong>Estatus:</strong>&nbsp<asp:Label ID="lblEstatusPedido" Text="" runat="server" /><br/>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

       <!-- Modificar Modal-->
    <div class="modal fade" id="modificarModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar estatus de pedido</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-1" hidden="hidden">
                            <label>ID Pedido</label>
                            <asp:TextBox ID="txtIdPedido" Enabled="false" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-1" hidden="hidden">
                            <label>ID Carrito</label>
                            <asp:TextBox ID="txtIdCarritoPedido" Enabled="false" CssClass="form-control" placeholder="ID" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Nombre:</label>
                            <asp:TextBox ID="txtNombreModificar" Enabled="false" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Fecha:</label>
                            <asp:TextBox ID="txtFechaModificar" Enabled="false" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Precio:</label>
                            <asp:TextBox ID="txtPrecioModificar" Enabled="false" CssClass="form-control" type="number" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Teléfono:</label>
                            <asp:TextBox ID="txtTelefonoModificar" Enabled="false" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-8">
                            <label>Dirección:</label>
                            <asp:TextBox ID="txtDireccionModificar" Enabled="false" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label>Estatus:</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlEstatusModificar" runat="server">
                                <asp:ListItem Value="PENDIENTE DE PAGO" Enabled="true">PENDIENTE DE PAGO</asp:ListItem>
                                <asp:ListItem Value="PAGADO" Enabled="true">PAGADO</asp:ListItem>
                                <asp:ListItem Value="ENTREGADO" Enabled="true">ENTREGADO</asp:ListItem>
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

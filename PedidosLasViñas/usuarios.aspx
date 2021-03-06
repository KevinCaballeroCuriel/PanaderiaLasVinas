<%@ Page Title="" Language="C#" MasterPageFile="~/paginaMaestra.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="PedidosLasViñas.usuarios" MaintainScrollPositionOnPostback="true" %>
<%@ import Namespace="MODELO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="include/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.min.css"/>
  
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.min.js"></script>
    <script>
        $(document).ready( function () {
            $('#ContentPlaceHolder1_gvBuscarAdmins').DataTable(
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
        <li class="active ">
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
    <h1 class="mt-4 text-center">USUARIOS</h1>
    <div>
        <!--<div class="input-group input-group-md mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-xsm">Buscar</span>
            </div>
            <asp:TextBox runat="server" ID="txtCriterios" CssClass="form-control mx-1" aria-label="Medium" aria-describedby="inputGroup-sizing-md"/>
        </div>-->
         <asp:CheckBoxList ID="chbxEstado" RepeatDirection="Horizontal" runat="server">
            <asp:ListItem Selected="True" Value="1">&nbsp;&nbsp; Activos &nbsp;&nbsp;</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">&nbsp;&nbsp; Inactivos</asp:ListItem>
        </asp:CheckBoxList>
        <div class="mb-1">
            <asp:Button ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary mt-1" runat="server" OnClick="btnBuscar_Click" />
            <asp:Button ID="btnAgregar" Text="Agregar" CssClass="btn btn-success float-right mt-1" runat="server" OnClick="btnAgregar_Click" />
        </div>
        <div class="m-3"></div>
        <asp:GridView ID="gvBuscarAdmins" CssClass="table table-bordered table-striped table-hover DataTable" AutoGenerateColumns="False" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="Nombre Completo">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("nombre") + " " + Eval("primerApellido") + " " + Eval("segundoApellido") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="correo" NullDisplayText="No proporcionado" HeaderText="Correo Electronico" />
                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<% #GetLabelText(Eval("activo")) %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rol" >          
                <ItemTemplate>
                  <asp:Label ID="lblRol" runat="server"  Text='<%# string.Format("{0}", Eval("tipoDeUsuario").ToString() == "1" ? "Administrador" : "Empleado") %>'></asp:Label>
                </ItemTemplate>
              </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkModificar" OnClick="linkModificar_Click" obj='<%# Eval("idUsuario") %>' runat="server"><i class="fas fa-pencil-alt"></i></asp:LinkButton>
                        <asp:LinkButton ID="linkEliminar" OnClick="linkEliminar_Click" obj='<%# Eval("idUsuario") %>'  runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
    </div>
    <!-- Modificar Modal-->
    <div class="modal fade" id="modificarModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar Usuario</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-4" hidden="hidden">
                            <label>ID</label>
                            <asp:TextBox ID="txtIdAdmin" class="form-control" placeholder="ID" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Nombre</label>
                            <asp:TextBox ID="txtNombre" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Primer Apellido</label>
                            <asp:TextBox ID="txtPrimerApellido" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Segundo Apellido</label>
                            <asp:TextBox ID="txtSegundoApellido" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Correo</label>
                            <asp:TextBox ID="txtCorreo" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Contraseña</label>
                            <asp:TextBox ID="txtContrasena" class="form-control" name="txtContrasena" runat="server" type="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label>Rol</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlRolModificar" runat="server">
                                <asp:ListItem Value="1" Text="Administrador">Administrador</asp:ListItem>
                                <asp:ListItem Value="2" Text="Empleado">Empleado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnGuardar" Text="Guardar" CssClass="btn btn-primary" runat="server" OnClick="btnGuardar_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Agregar Modal-->
    <div class="modal fade" id="agregarModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Agregar Usuario</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Nombre</label>
                            <asp:TextBox ID="txtNombreAgragar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Primer Apellido</label>
                            <asp:TextBox ID="txtPrimerApellidoAgregar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Segundo Apellido</label>
                            <asp:TextBox ID="txtSegundoApellidoAgregar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Correo</label>
                            <asp:TextBox ID="txtCorreoAgregar" class="form-control" placeholder="" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Contraseña</label>
                            <asp:TextBox ID="txtContrasenaAgregar" class="form-control" type="password" placeholder="" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label>Rol</label>
                            <asp:DropDownList CssClass="custom-select" ID="ddlRol" runat="server">
                                <asp:ListItem Value="2" Enabled="true" Selected="True" Text="Selecciona">Selecciona</asp:ListItem>
                                <asp:ListItem Value="1" Text="Administrador">Administrador</asp:ListItem>
                                <asp:ListItem Value="2" Text="Empleado">Empleado</asp:ListItem>
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
</asp:Content>
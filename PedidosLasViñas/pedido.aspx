<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="pedido.aspx.cs" Inherits="PedidosLasViñas.pedido" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Panadería Las Viñas</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="include/img/logo.png" rel="icon">
    <link href="include/img/logo.png" rel="apple-touch-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Dosis:300,400,500,,600,700,700i|Lato:300,300i,400,400i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../include/assetsIndex/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../include/css/estilosLasVinas.css" rel="stylesheet">
    <link href="../include/css/sweetalert.css" rel="stylesheet" />
    <!-- Template Main CSS File -->
    <link href="../include/assetsIndex/css/style.css" rel="stylesheet">
    <script src="include/js/jquery-3.4.1.min.js"></script>
    <script src="include/js/modal.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>   
    <script src="../include/js/sweetalert.js"></script>
    <script src="../include/js/sweetalert.min.js"></script>
    <script src="../include/js/sweetalerts.js"></script>
    <script src="include/js/scripts.js"></script>
    <!-- =======================================================
  * Template Name: Butterfly - v4.2.0
  * Template URL: https://bootstrapmade.com/butterfly-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>


<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top"  style="background-color:#e4c3c1">
    <div class="container d-flex align-items-center justify-content-between">

      <a href="index.aspx" class="logo"><h3>Panadería Las Viñas</h3></a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link" href="index.aspx#hero">Inicio</a></li>
          <li><a class="nav-link" href="index.aspx#catalogo">Catálogo</a></li>
          <li><a class="nav-link" href="index.aspx#footer">Contáctanos</a></li>            
          <li><a class="nav-link active" href="/pedido.aspx">Pedido</a></li>
          <li><a class="nav-link" href="/login.aspx">Admin</a></li>
        </ul>
        <i class="fas fa-bars fa-1x mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

 
    
      <!-- ======= Gallery Section ======= -->
    <form runat="server" id="pedidoForm">
        <section id="pedido" class="mt-5">
          <div class="container">
            <div class="section-title" style="padding-bottom:0px">
              <h2>Pedido</h2>
                <div class="row mb-4">
                    <div class="form-group col-md-3">
                        <label>A nombre de: </label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtNombrePedido" MinLength="3" required placeholder="Nombre"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-3">
                        <label>Teléfono: </label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" MinLength="10" MaxLength="10" required placeholder="Teléfono"></asp:TextBox>
                        
                    </div>
                    <div class="form-group col-md-6" style="align-self:flex-end">
                        <div class="domicilio" id="domicilio">
                            <label>Dirección: </label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion" MinLenght="10" MaxLength="100" required placeholder="Dirección"></asp:TextBox>
                        </div>
                        <div class="custom-control custom-checkbox" style="text-align:left">
                           <input class="custom-control-input " id="habilitarDomicilio" type="checkbox" />
                           <label class="custom-control-label" for="habilitarDomicilio">¿Desea recoger en sucursal?</label> 
                        </div>
                    </div>
                 <asp:RegularExpressionValidator ID="RegExValid1" Runat="server"
                        ErrorMessage="Ingresa un nombre correcto con 3 o más caracteres" Display="Dynamic"
                        CssClass="alert alert-danger m-2" ControlToValidate="txtNombrePedido"
                        ValidationExpression="^[A-Za-z\s]{3,}$"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator CssClass="alert alert-danger m-2" Display="Dynamic" style="z-index:3" ID="RegularExpressionValidator1" runat="server"  
                            ControlToValidate="txtTelefono" ErrorMessage="Ingresa un número teléfonico correcto"  
                            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    
                </div>
               
                <h4>Productos</h4>
                
                <div class="d-flex flex-wrap justify-content-center">
                    <div class="p-2">
                        <asp:TextBox ID="txtBuscar" runat="server" placeholder="Buscar" CssClass="form-control"></asp:TextBox> 
                    </div>
                    <div class="p-2">
                        <asp:DropDownList CssClass="btn btn-light border dropdown-toggle" ID="ddlCategoria" runat="server">
                            <asp:ListItem Value="0" Enabled="true" Selected="True" Text="Categoria">Categoria</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="p-2">
                        <asp:Button runat="server" CssClass="btn btn-secondary" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click"/>
                    </div>
                    <div class="p-2 btnVerPedido">
                        <asp:Button runat="server" CssClass="btn btn-secondary" ID="btnVerPedido" Text="Hacer Pedido" OnClick="btnVerPedido_Click" />
                    </div>
                </div>
            </div>                  
           </div> 
            
                <div class='container'>
                    <div class="d-flex flex-wrap justify-content-center">
                        <asp:ListView runat="server" ID="lvProductos" ClientIDRowSuffix="idProducto" >
                            <ItemTemplate>
                                <div class="card m-3">
                                    <div class="card-header text-center">
                                        <label class="text-center"><%# Eval("CATEGORIA.categoria1")%></label>
                                    </div>
                                        <div class="card-body text-center">
                                            <h5 class="card-title"><%# Eval("nombre")%></h5>
                                            <p class="card-text">$<%# Eval("precio")%></p>
                                        </div>
                                    <div class="card-footer text-center">
                                        Cantidad:&nbsp<asp:TextBox runat="server" ID="txtCantidadProducto" CssClass="btn btn-light border m-1" TextMode="number" min="0" max="50"  placeholder="0" obj='<%# Eval("idProducto")%>' name='<%# Eval("nombre")%>'></asp:TextBox>
                                        <asp:Button runat="server" CssClass="btn btn-secondary m-1" Text="Agregar" ID="btnAgregar" OnClick="btnAgregar_Click" obj='<%# Eval("idProducto")%>'/>
                                    </div>
                                </div>
                            </ItemTemplate>                            
                        </asp:ListView>                        
                    </div>                    
                </div>
            
            <div class="fix">
                <div class="canasta">                
                <asp:ImageButton ID="imgCanasta" ImageUrl="include/img/canasta.png" OnClick="btnVerPedido_Click" width="50" height="50"  runat="server"/>
                <asp:LinkButton ID="linkPrecioCanasta" Text="$0" runat="server"/>               
                </div>
            </div>

        </section>

        <!-- Ver Modal-->
    <div class="modal" id="verModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><strong>Ver Pedido</strong></h5>
                    <a class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </a>
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
                                <asp:TemplateField HeaderText="Cantidad">   
                                    <ItemTemplate>
                                        <div class="text-center">
                                            <asp:Button Text="-" CssClass="btn-sm btn-light border" ID="btnMenosCantidad" obj='<%# Eval("idElemento")%>' OnClick="btnMenosCantidad_Click" runat="server" />
                                            <%# Eval("cantidad") %>
                                            <asp:Button Text="+" CssClass="btn-sm btn-light border" ID="btnMasCantidad" obj='<%# Eval("idElemento")%>' OnClick="btnMasCantidad_Click" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="precioDelElemento" HeaderText="Precio Total" />
                                <asp:TemplateField HeaderText="">   
                                    <ItemTemplate>
                                        <asp:LinkButton ID="linkEliminar" OnClick="linkEliminar_Click" obj='<%# Eval("idElemento") %>'  runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <strong>Total:</strong>&nbsp$<asp:Label ID="lblTotalPedido" Text="" runat="server" /><br/>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-dark" type="button" data-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnHacerPedido" Text="Hacer Pedido" OnClick="btnHacerPedido_Click" CssClass="btn btn-secondary" runat="server" />
                </div>
            </div>
        </div>
    </div>

    </form>
  
  

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="fas fa-arrow-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="include/assetsIndex/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="include/assetsIndex/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="include/assetsIndex/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="include/assetsIndex/vendor/php-email-form/validate.js"></script>
  <script src="include/assetsIndex/vendor/purecounter/purecounter.js"></script>
  <script src="include/assetsIndex/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="include/assetsIndex/js/main.js"></script>
  <script src="include/js/jquery-3.4.1.min.js"></script>
  <script src="include/bootstrap/js/bootstrap.min.js"></script>
  <script src="include/js/modal.js"></script>
  <script src="include/js/scripts.js"></script>

</body>

</html>
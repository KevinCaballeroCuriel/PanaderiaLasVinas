<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PedidosLasViñas.index" %>

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
  <link href="include/assetsIndex/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--<link href="include/assetsIndex/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">-->
  <link href="inlcude/assetsIndex/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="include/assetsIndex/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="include/assetsIndex/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="include/fontawesome/css/all.min.css" rel="stylesheet" />

  <!-- Template Main CSS File -->
  <link href="include/assetsIndex/css/style.css" rel="stylesheet">

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
          <li><a class="nav-link scrollto active" href="#hero">Inicio</a></li>
          <li><a class="nav-link scrollto active" href="#catalogo">Catálogo</a></li>
          <li><a class="nav-link scrollto active" href="#footer">Contáctanos</a></li>            
          <li><a class="nav-link" href="/pedido.aspx">Pedido</a></li>
          <li><a class="nav-link" href="/login.aspx">Admin</a></li>

        </ul>
        <i class="fas fa-bars fa-1x mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center" style="background-color:#f3e2d2">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 pt-4 pt-lg-0 order-1 order-lg-1 d-flex flex-column justify-content-center">
          <img src="include/img/logo.png" alt="" class="img-fluid">
          <h1 class="text-center">¡Un halago a tus sentidos!</h1>
        </div>
        <div class="col-lg-6 order-2 order-lg-2 hero-img">
          <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="include/img/pastel-guayaba.png" class="d-block w-100" alt="Pay de Guayaba">
                </div>
                <div class="carousel-item">
                  <img src="include/img/baguette.png" class="d-block w-100" alt="Pan Baguette">
                </div>
                <div class="carousel-item">
                  <img src="include/img/macarron.png" class="d-block w-100" alt="Macarron">
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>

  </section><!-- End Hero -->

      <!-- ======= Gallery Section ======= -->
    <section id="catalogo" class="gallery">
      <div class="container">

        <div class="section-title" style="padding-bottom:0px">
          <h2>Catálogo</h2>
          <h3>¡Contamos de una gran variedad de productos!</h3>
        </div>
        
        <!-- Modal gallery -->
        <section class="" style="padding:0px">
        <!-- Section: Images -->
        <section class="" style="padding-bottom:0px">  
            <div class="row no-gutters">
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">   
                        
                        <a data-bs-toggle="modal" href="#danesModal">
                          <h2 class="text-center">DANES</h2>
                          <img src="include/img/danesa.png" alt="" class="img-fluid">
                        </a>
                     </div>
                </div>
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a data-bs-toggle="modal" href="#feitteModal">
                          <h2 class="text-center">FEITTE</h2>
                          <img src="include/img/feitte.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a data-bs-toggle="modal" href="#bizcochoModal">
                          <h2 class="text-center">BIZCOCHO</h2>
                          <img src="include/img/bizcocho.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
                  <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a href="#royalModal" data-bs-toggle="modal">
                          <h2 class="text-center">ROYAL</h2>
                          <img src="include/img/royal.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
            </div>
            <div class="row no-gutters pt-4">
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a href="#barrasModal" data-bs-toggle="modal">
                          <h2 class="text-center">BARRAS</h2>
                          <img src="include/img/barras.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a href="#baguetteModal" data-bs-toggle="modal">
                          <h2 class="text-center">BAGUETTE</h2>
                          <img src="include/img/baguettes.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a href="#servicioModal" data-bs-toggle="modal" >
                          <h2 class="text-center">PAN DE SERVICIO</h2>
                          <img src="include/img/servicio.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
                  <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                    <div class="gallery-item">     
                      <a href="#donaModal" data-bs-toggle="modal">
                          <h2 class="text-center">DONA</h2>
                          <img src="include/img/donas.png" alt="" class="img-fluid">
                      </a>
                     </div>
                </div>
                </div>
            </section>
              </section>
              <!-- Section: Images -->

              <!-- Section: Modals -->
              <section class="" style="position:absolute">
                <!-- Modal Danes -->
                <div class="modal fade" id="danesModal" tabindex="-1" aria-labelledby="danesModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="danesModalLabel">DANES</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Trenza</h2>
                                        <h2>Broca</h2>
                                        <h2>Danesa de Manzana</h2>
                                        <h2>Danesa de Guayaba</h2>  
                                        <h2>Bigote</h2> 
                                    </div>
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Rol de canela</h2>
                                        <h2>Anteojo</h2>
                                        <h2>Chocolatín</h2>
                                        <h2>Flor de Manzanela</h2>  
                                        <h2>Cuernito</h2> 
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Feitte -->
                <div class="modal fade" id="feitteModal" tabindex="-1" aria-labelledby="feitteModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="feitteModalLabel">FEITTE</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Tarta de Piña</h2>
                                        <h2>Tarata de Fresa</h2>
                                        <h2>Rollito de Ate</h2>
                                        <h2>Peinete sin azúcar</h2>  
                                        <h2>Barrita de Zarzamora</h2> 
                                        <h2>Empanada de Piña</h2> 
                                    </div>
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Peineta</h2>
                                        <h2>Oreja</h2>
                                        <h2>Banderilla</h2>
                                        <h2>Conito</h2>  
                                        <h2>Bocadillo Jamón</h2> 
                                        <h2>Bocadillo Poblano</h2> 
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Bizcocho -->
                <div class="modal fade" id="bizcochoModal" tabindex="-1" aria-labelledby="bizcochoModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="bizcochoModalLabel">BIZCOCHO</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Concha Grande</h2>
                                        <h2>Concha Chica</h2>
                                        <h2>Bisquette</h2>
                                        <h2>Muffin</h2>  
                                    </div>
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Panqué</h2>
                                        <h2>Rebanada</h2>
                                        <h2>Bollito con Queso</h2>
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Royal -->
                <div class="modal fade" id="royalModal" tabindex="-1" aria-labelledby="royalModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="royalModalLabel">ROYAL</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Cochito</h2>
                                        <h2>Elote</h2>
                                        <h2>Canasta</h2>
                                    </div>
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Empanada Azucarada</h2>
                                        <h2>Empanada de Cerveza</h2>
                                        <h2>Galleta de Avena</h2>
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Barras -->
                <div class="modal fade" id="barrasModal" tabindex="-1" aria-labelledby="barrasModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="barrasModalLabel">BARRAS</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Integral</h2>
                                        <h2>Integral 100%</h2>
                                        <h2>Centeno Negro</h2>
                                    </div>
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Centeno Negro 100%</h2>
                                        <h2>Siete Granos</h2>
                                        <h2>Arándano, Nuez y Pasas</h2>
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Baguette -->
                <div class="modal fade" id="baguetteModal" tabindex="-1" aria-labelledby="baguetteModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="baguetteModalLabel">BAGUETTE</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Natural</h2>
                                        <h2>Integral</h2>
                                    </div>
                                    <div class="col-md-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Orégano</h2>
                                        <h2>Ajo</h2>
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Pan de Servicio -->
                <div class="modal fade" id="servicioModal" tabindex="-1" aria-labelledby="servicioModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="servicioModalLabel">PAN DE SERVICIO</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Hamburguesa</h2>
                                        <h2>Hot Dog</h2>
                                        <h2>Virginia</h2>
                                        <h2>Telera</h2>  
                                    </div>
                                    <div class="col-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Birote</h2>
                                        <h2>Focaccia</h2>
                                        <h2>Campesino</h2>
                                        <h2>Biropizza</h2>  
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Donas -->
                <div class="modal fade" id="donaModal" tabindex="-1" aria-labelledby="donaModalLabel">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content" style="background-color:#e4c3c1;">
                            <div class="modal-header">
                                <h1 class="modal-title w-100 text-center" id="donaModalLabel">DONA</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"/>
                            </div>
                            <div class="modal-body">
                                <div class="row no-gutters">
                                    <div class="col-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Chocolate</h2>
                                        <h2>Maple</h2>
                                    </div>
                                    <div class="col-5 mb-4 mt-3 mx-4 ps-5">
                                        <h2>Glaseada</h2>
                                        <h2>Azucarada</h2>
                                    </div>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
              </section>
                </div>
                
                <div class="btn-lg mb-5 mt-5 text-center">
                    <a href="pedido.aspx"><button class="btn border" style="background-color: #a00054; color:white;">Haz Tú Pedido!</button></a>
                </div>                                
              </section>

           

  
  <!-- ======= Footer ======= -->
  <footer id="footer" style="background-color:#fff">

    <div class="footer-top" style="background-color:#f3e2d2">
      <div class="container">
        <div class="row">
            <div class="section-title" style="padding-bottom:0px">
                <h2>¡Contáctanos!</h2>
            </div>
            <div class="col-lg-4 col-md-4 footer-contact">
              <a href="index.aspx">
                <img src="include/img/logo.png" alt="" class="img-fluid">
                <h5 class="text-center" style="color:#b3bc01">¡UN HALAGO A TUS SENTIDOS!</h5>
              </a>
            </div>
            <div class="col-lg-4 col-md-4 mt-5 text-center footer-contact">
               <p><a href="https://goo.gl/maps/jk7YW5nSDkXXdV9P9">
                AVE.J Y CALLE CERRO CAÑEDO <br>
                COL. AGRONÓMICA H. CABORCA, SON.</a><br>
                <a href="tel:6373726584"><strong>Tel:</strong> (637) 372 65 84</a></p>
            </div>
            <div class="col-lg-4 col-md-4 mt-5 text-center footer-contact">  
                <h4>¡Síguenos!</h4>
                <div class="social-links mt-3">
                    <a href="https://www.instagram.com/panaderia.lasvinas/"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.facebook.com/PanaderiaLasVinas"><i class="fab fa-facebook"></i></a>
                    <a href="https://api.whatsapp.com/send?phone=+526373726584"><i class="fab fa-whatsapp"></i></a>
                </div>
            </div>
        </div>
      </div>
    </div>

    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Butterfly</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/butterfly-free-bootstrap-theme/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

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

</body>

<script>
    // Open the Modal
    function openModal() {
        document.getElementById("danesModal").style.display = "block";
    }
    // Close the Modal
    function closeModal() {
        document.getElementById("danesModal").style.display = "none";
    }
</script>

</html>
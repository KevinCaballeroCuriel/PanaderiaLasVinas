(function($) {
    $(document).ready(function(){
        $('#mostrarPasswordCheck').on('change',function(){
          var isChecked = $(this).prop('checked');
          if (isChecked) {
            $('#txtContrasena').attr('type','text');
          } else {
            $('#txtContrasena').attr('type','Password');
          }
        });
      });
})(jQuery);

(function($) {
    $(document).ready(function(){
        $('#habilitarDomicilio').on('change',function(){
          var isChecked2 = $(this).prop('checked');
          if (isChecked2) {
            $("#domicilio").show();
          } else {
              $("#domicilio").hide();
              $("#txtDireccion").val("");
          }
        });
      });
})(jQuery);

(function($) {
    "use strict";

    // Add active state to sidbar nav links
    var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
        $("#layoutSidenav_nav .sb-sidenav a.nav-link").each(function() {
            if (this.href === path) {
                $(this).addClass("active");
            }
        });

    // Toggle the side navigation
    $("#sidebarToggle").on("click", function(e) {
        e.preventDefault();
        $("body").toggleClass("sb-sidenav-toggled");
    });
})(jQuery);


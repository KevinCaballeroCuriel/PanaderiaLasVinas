using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CONTROLADOR;
using MODELO;

namespace PedidosLasViñas
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                var admin = new USUARIO()
                {
                    contraseña = txtContrasena.Text,
                    correo = txtEmail.Text
                };
                var usuario = UsuarioControl.IngresarSistema(admin);
                Session.Timeout = 60;
                Session["nombre"] = usuario.nombre + " " + usuario.primerApellido;
                Session["idUsuario"] = usuario.idUsuario;
                Session["tipoDeUsuario"] = usuario.tipoDeUsuario;

                Response.Redirect("pedidos.aspx");
            }
            catch (Exception ex)
            {
                mensajeError.Visible = true;
                //mensajeError.InnerText = ex.Message;

                string javaScript = "OcultarMensajeError();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
                //var datos = "<script> alert('" + ex.Message + "') </script>";
                //Response.Write(datos);
            }
            //mensajeError.Visible = true;
            //mensajeError.InnerText = ex.Message;
            //string javaScript = "OcultarMensajeError();";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            //var datos = "<script> alert('" + ex.Message + "') </script>";
            //Response.Write(datos);   
        }
    }
}
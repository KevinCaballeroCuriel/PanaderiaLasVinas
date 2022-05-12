using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PedidosLasViñas
{
    public partial class paginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombre"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if ((Session["tipoDeUsuario"].ToString()).Equals("2"))
                {
                    lblNombre.InnerHtml = "Empleado: " + Session["nombre"].ToString();
                } else
                {
                    lblNombre.InnerHtml = "Administrador: " + Session["nombre"].ToString();
                }
                
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PedidosLasViñas
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipoDeUsuario"] == null)
            {
                Response.Redirect("login.aspx");
            } else
            {
                if ((Session["tipoDeUsuario"].ToString()).Equals("2"))
                {
                    liUsuarios.Visible = false;
                }
            }
        }
    }
}
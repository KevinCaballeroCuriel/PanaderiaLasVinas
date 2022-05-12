using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MODELO;
using CONTROLADOR;

namespace PedidosLasViñas
{
    public partial class pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipoDeUsuario"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if ((Session["tipoDeUsuario"].ToString()).Equals("2"))
                {
                    liUsuarios.Visible = false;
                }
            }
            if (!IsPostBack)
            {
                var resultado = PedidoControl.ListaDePedidos();
                gvBuscarPedidos.DataSource = resultado;
                gvBuscarPedidos.DataBind();
                if (resultado.Count > 0)
                {
                    gvBuscarPedidos.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            var resultado = PedidoControl.ListaDePedidosPorEstatus(ddlEstatus.SelectedValue);
            gvBuscarPedidos.DataSource = resultado;
            gvBuscarPedidos.DataBind();
            if (resultado.Count > 0)
            {
                gvBuscarPedidos.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void linkVerPedido_Click(object sender, EventArgs e)
        {
            try
            {
                string javaScript = "MostrarModalVer();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

                LinkButton link = (LinkButton)sender;

                var id = Convert.ToInt32(link.Attributes["obj"]);

                PEDIDO pedido = PedidoControl.BuscarPedidoPorID(id);

                var resultado = CarritoControl.ListaDeElementosDelCarrito(pedido.idCarrito);
                gvCarritoPedido.DataSource = resultado;
                gvCarritoPedido.DataBind();
                if (resultado.Count > 0)
                {
                    gvBuscarPedidos.HeaderRow.TableSection = TableRowSection.TableHeader;
                }

                lblNombrePedido.Text = pedido.nombre;
                lblDireccionPedido.Text = pedido.direccion;
                lblTelefonoPedido.Text = pedido.telefono;
                lblFechaPedido.Text = pedido.fechaDePedido.ToString();
                lblTotalPedido.Text = pedido.CARRITO.precioDelCarrito.ToString();
                lblEstatusPedido.Text = pedido.estatus;

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "script", "alertError()", true);
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }

        protected void linkModificar_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModal();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

            LinkButton link = (LinkButton)sender;

            var id = Convert.ToInt32(link.Attributes["obj"]);

            PEDIDO pedido = PedidoControl.BuscarPedidoPorID(id);

            //modificarModal.Visible = true;
            txtIdPedido.Text = pedido.idPedido.ToString();
            txtNombreModificar.Text = pedido.nombre;
            txtTelefonoModificar.Text = pedido.telefono;
            txtFechaModificar.Text = pedido.fechaDePedido.ToString();
            txtPrecioModificar.Text = pedido.CARRITO.precioDelCarrito.ToString();
            txtDireccionModificar.Text = pedido.direccion;
            ddlEstatusModificar.SelectedValue = pedido.estatus.ToString();
            txtIdCarritoPedido.Text = pedido.idCarrito.ToString();
        }

        protected void linkEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton link = (LinkButton)sender;

                var id = Convert.ToInt32(link.Attributes["obj"]);

                PedidoControl.EliminarPedido(id);

                ClientScript.RegisterStartupScript(this.GetType(), "script", "alertBorrarPedido()", true);

                btnBuscar_Click(null, null);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "script", "alertError()", true);
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }

        protected void btnGuardarModificar_Click(object sender, EventArgs e)
        {
            var pedidoModificado = new PEDIDO()
            {
                idPedido = Convert.ToInt32(txtIdPedido.Text),
                nombre = txtNombreModificar.Text,
                telefono = txtTelefonoModificar.Text,
                fechaDePedido = Convert.ToDateTime(txtFechaModificar.Text),
                direccion = txtDireccionModificar.Text,
                estatus = ddlEstatusModificar.SelectedValue,
                idCarrito = Convert.ToInt32(txtIdCarritoPedido.Text)
            };

            PedidoControl.ModificarEstatusPedido(pedidoModificado);
            ClientScript.RegisterStartupScript(this.GetType(), "script", "alertModificarPedido()()", true);
            btnBuscar_Click(null, null);
        }
    }
}
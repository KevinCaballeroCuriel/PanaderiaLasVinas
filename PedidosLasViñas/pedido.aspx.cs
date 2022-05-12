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
    public partial class pedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idCarrito"] == null)
            {
                var carrito = new CARRITO() { precioDelCarrito = 0 };
                Session.Timeout = 60;
                Session["idCarrito"] = CarritoControl.CrearCarrito(carrito);
            }

            if (!IsPostBack)
            {
                var listaDeProductos = ProductoControl.BuscarProductosPorCriterios("",true);
                lvProductos.DataSource = listaDeProductos;
                lvProductos.DataBind();

                var listaDeCategorias = ProductoControl.ListaDeCategorias();
                ddlCategoria.DataSource = listaDeCategorias;
                ddlCategoria.DataTextField = "categoria1";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("TODAS LAS CATEGORÍAS", "0", true));
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Button btnAgregarLink = (Button)sender;
            var idProducto = Convert.ToInt32(btnAgregarLink.Attributes["obj"]);
            PRODUCTO productoSeleccionado = ProductoControl.BuscarProductoPorID(idProducto);
            var idCarritoCliente = Convert.ToInt32(Session["idCarrito"].ToString());
            CARRITO carritoCliente = CarritoControl.BuscarCarritoPorID(idCarritoCliente);
            TextBox txtCantidadProducto = (TextBox)btnAgregarLink.Parent.FindControl("txtCantidadProducto");

            ELEMENTO_CARRITO elementoAgregado = new ELEMENTO_CARRITO()
            {
                cantidad = Convert.ToInt32(txtCantidadProducto.Text),
                precioDelElemento = productoSeleccionado.precio * Convert.ToInt32(txtCantidadProducto.Text),
                idCarrito = idCarritoCliente,
                idProducto = productoSeleccionado.idProducto
            };

            CARRITO carritoModificado = new CARRITO()
            {
                idCarrito = idCarritoCliente,
                precioDelCarrito = carritoCliente.precioDelCarrito + productoSeleccionado.precio * Convert.ToInt32(txtCantidadProducto.Text)
            };

            CarritoControl.ModificarPrecioCarrito(carritoModificado);
            CarritoControl.InsertarElementoAlCarrito(elementoAgregado);
            lblTotalPedido.Text = carritoModificado.precioDelCarrito.ToString();
            linkPrecioCanasta.Text = "$"+ carritoModificado.precioDelCarrito.ToString();
            ClientScript.RegisterStartupScript(this.GetType(),"script", "alertAgregarProducto()", true);
        }

        protected void btnVerPedido_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModalVer();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

            lblNombrePedido.Text = txtNombrePedido.Text;
            lblTelefonoPedido.Text = txtTelefono.Text;
            lblDireccionPedido.Text = txtDireccion.Text;
            lblFechaPedido.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss tt");

            var listaDeElementos = CarritoControl.ListaDeElementosDelCarrito(Convert.ToInt32(Session["idCarrito"].ToString()));
            gvCarritoPedido.DataSource = listaDeElementos;
            gvCarritoPedido.DataBind();
        }

        protected void btnHacerPedido_Click(object sender, EventArgs e)
        {
            if (gvCarritoPedido.Rows.Count > 0)
            {
                var idCarritoCliente = Convert.ToInt32(Session["idCarrito"].ToString());
                var fecha = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));

                PEDIDO nuevoPedido = new PEDIDO()
                {
                    nombre = lblNombrePedido.Text,
                    telefono = lblTelefonoPedido.Text,
                    direccion = lblDireccionPedido.Text,
                    fechaDePedido = fecha,
                    estatus = "PENDIENTE DE PAGO",
                    idCarrito = idCarritoCliente
                };

                PedidoControl.NuevoPedido(nuevoPedido);

                var listaDeProductos = ProductoControl.BuscarProductosPorCriterios("", true);
                lvProductos.DataSource = listaDeProductos;
                lvProductos.DataBind();

                txtDireccion.Text = "";
                txtNombrePedido.Text = "";
                txtTelefono.Text = "";
                linkPrecioCanasta.Text = "$0";
                ClientScript.RegisterStartupScript(this.GetType(), "script", "alertPedido()", true);
            }
            else
            {
                string javaScript = "MostrarModalVer();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alertBorrarProductoPedido()", true);
            }
            Session["idCarrito"] = null;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            var listaDeProductos = ProductoControl.BuscarProductosPorCriterios(txtBuscar.Text, Convert.ToInt32(ddlCategoria.SelectedValue), true);
            lvProductos.DataSource = listaDeProductos;
            lvProductos.DataBind();
        }

        protected void btnMenosCantidad_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModalVer();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            Button btn = (Button)sender;
            var id = Convert.ToInt32(btn.Attributes["obj"]);
            var idCarritoCliente = Convert.ToInt32(Session["idCarrito"].ToString());
            CARRITO carritoCliente = CarritoControl.BuscarCarritoPorID(idCarritoCliente);

            ELEMENTO_CARRITO elemento = CarritoControl.BuscarElementoPorID(id);

            int nuevaCantidad = elemento.cantidad - 1;

            if (nuevaCantidad > 0)
            {
                ELEMENTO_CARRITO elementoModificado = new ELEMENTO_CARRITO()
                {
                    idElemento = elemento.idElemento,
                    idCarrito = elemento.idCarrito,
                    idProducto = elemento.idProducto,
                    cantidad = nuevaCantidad,
                    precioDelElemento = nuevaCantidad * elemento.PRODUCTO.precio
                };

                CarritoControl.ModificarElemento(elementoModificado);

                CARRITO carritoModificado = new CARRITO()
                {
                    idCarrito = elemento.idCarrito,
                    precioDelCarrito = carritoCliente.precioDelCarrito - elemento.PRODUCTO.precio
                };

                CarritoControl.ModificarPrecioCarrito(carritoModificado);
                lblTotalPedido.Text = carritoModificado.precioDelCarrito.ToString();
                linkPrecioCanasta.Text = "$" + carritoModificado.precioDelCarrito.ToString();
            }
            else
            {
                ELEMENTO_CARRITO elementoEliminado = CarritoControl.BuscarElementoPorID(id);

                CARRITO carritoModificado = new CARRITO()
                {
                    idCarrito = idCarritoCliente,
                    precioDelCarrito = carritoCliente.precioDelCarrito - elementoEliminado.precioDelElemento
                };

                CarritoControl.ModificarPrecioCarrito(carritoModificado);

                CarritoControl.EliminarElementoDelCarrito(id);
                lblTotalPedido.Text = carritoModificado.precioDelCarrito.ToString();
                linkPrecioCanasta.Text = "$" + carritoModificado.precioDelCarrito.ToString();
            }
            btnVerPedido_Click(null, null);
        }

        protected void btnMasCantidad_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModalVer();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            Button btn = (Button)sender;
            var id = Convert.ToInt32(btn.Attributes["obj"]);
            var idCarritoCliente = Convert.ToInt32(Session["idCarrito"].ToString());
            CARRITO carritoCliente = CarritoControl.BuscarCarritoPorID(idCarritoCliente);

            ELEMENTO_CARRITO elemento = CarritoControl.BuscarElementoPorID(id);

            int nuevaCantidad = elemento.cantidad + 1;

            ELEMENTO_CARRITO elementoModificado = new ELEMENTO_CARRITO()
            {
                idElemento = elemento.idElemento,
                idCarrito = elemento.idCarrito,
                idProducto = elemento.idProducto,
                cantidad = nuevaCantidad,
                precioDelElemento = nuevaCantidad * elemento.PRODUCTO.precio
            };

            CarritoControl.ModificarElemento(elementoModificado);

            CARRITO carritoModificado = new CARRITO()
            {
                idCarrito = elemento.idCarrito,
                precioDelCarrito = carritoCliente.precioDelCarrito + elemento.PRODUCTO.precio
            };

            CarritoControl.ModificarPrecioCarrito(carritoModificado);

            lblTotalPedido.Text = carritoModificado.precioDelCarrito.ToString();
            linkPrecioCanasta.Text = "$" + carritoModificado.precioDelCarrito.ToString();

            btnVerPedido_Click(null, null);
        }

        protected void linkEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton link = (LinkButton)sender;
                var id = Convert.ToInt32(link.Attributes["obj"]);
                var idCarritoCliente = Convert.ToInt32(Session["idCarrito"].ToString());
                CARRITO carritoCliente = CarritoControl.BuscarCarritoPorID(idCarritoCliente);

                ELEMENTO_CARRITO elementoEliminado = CarritoControl.BuscarElementoPorID(id);

                CARRITO carritoModificado = new CARRITO()
                {
                    idCarrito = idCarritoCliente,
                    precioDelCarrito = carritoCliente.precioDelCarrito - elementoEliminado.precioDelElemento
                };

                CarritoControl.ModificarPrecioCarrito(carritoModificado);

                CarritoControl.EliminarElementoDelCarrito(id);
                lblTotalPedido.Text = carritoModificado.precioDelCarrito.ToString();
                linkPrecioCanasta.Text = "$" + carritoModificado.precioDelCarrito.ToString();
                btnVerPedido_Click(null, null);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "script", "alertError()", true);
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }
    }
}
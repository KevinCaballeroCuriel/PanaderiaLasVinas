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
    public partial class productos : System.Web.UI.Page
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
                var categorias = ProductoControl.ListaDeCategorias();
                Console.WriteLine(categorias);
                ddlCategoria.DataSource = categorias;
                ddlCategoria.DataBind();
                //ddlCategoria.Items.Add(new ListItem("TODAS", "0", true));
                ddlCategoria.DataTextField = "categoria1";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("TODAS", "0", true));

                ddlCategoriaAgregar.DataSource = categorias;
                ddlCategoriaAgregar.DataBind();
                ddlCategoriaAgregar.DataTextField = "categoria1";
                ddlCategoriaAgregar.DataValueField = "idCategoria";
                ddlCategoriaAgregar.DataBind();

                ddlCategoriaModificar.DataSource = categorias;
                ddlCategoriaModificar.DataBind();
                ddlCategoriaModificar.DataTextField = "categoria1";
                ddlCategoriaModificar.DataValueField = "idCategoria";
                ddlCategoriaModificar.DataBind();

                var resultado = ProductoControl.ListaDeProducto();
                gvBuscarPedidos.DataSource = resultado;
                gvBuscarPedidos.DataBind();
                if (resultado.Count > 0)
                {
                    gvBuscarPedidos.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        public string GetLabelTextDisponibilidad(object dataItem)
        {
            string text = "";
            string val = dataItem.ToString();
            switch (val)
            {
                case "True":
                    text = "Disponible";
                    break;
                case "False":
                    text = "No disponible";
                    break;

            }
            return text;
        }

        public string GetLabelTextCategoria(object dataItem)
        {
            string text = "";
            int val = Int32.Parse(dataItem.ToString());
            text = ProductoControl.BuscarCategoriaPorID(val).categoria1.ToString();
            return text;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            bool estado = true;
            var resultado = ProductoControl.ListaDeProducto();

            if (chbxEstado.SelectedIndex == 0)
            {
                estado = true;
            }
            else
            {
                estado = false;
            }

            if (chbxEstado.Items.Cast<ListItem>().All(item => item.Selected == true))
            {
                resultado = ProductoControl.ListaDeProductosPorCategoria(Int32.Parse(ddlCategoria.SelectedValue));
            }
            else if (chbxEstado.Items.Cast<ListItem>().All(item => item.Selected == false))
            {
                resultado = null;
            }
            else
            {
                resultado = ProductoControl.BuscarProductosPorCriterios("", Int32.Parse(ddlCategoria.SelectedValue), estado); ;
            }
            gvBuscarPedidos.DataSource = resultado;
            gvBuscarPedidos.DataBind();
            if (resultado != null)
            {
                if (resultado.Count > 0)
                {
                    gvBuscarPedidos.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void linkEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton link = (LinkButton)sender;

                var id = Convert.ToInt32(link.Attributes["obj"]);

                ProductoControl.EliminarProducto(id);

                btnBuscar_Click(null, null);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }

        protected void linkVerPedido_Click(object sender, EventArgs e)
        {
            //string javaScript = "MostrarModal();";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

            //LinkButton link = (LinkButton)sender;
            //var id = Convert.ToInt32(link.Attributes["obj"]);

            //PRODUCTO product = ProductoControl.BuscarProductoPorID(id);

            //lblFolio.Text = product.idProducto.ToString();
            //lblFechaPedido.Text = product.nombre.ToString();
            //lblDomicilio.Text = product.descripcion.ToString();
            //lblTelefono.Text = product.precio.ToString();
            //lblHorarioPreferido.Text = product.idCategoria.ToString();
            //lblTotalBSQ.Text = product.disponibilidad.ToString();

            //btnBuscar_Click(null, null);
        }

        protected void linkModificar_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModal();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

            LinkButton link = (LinkButton)sender;

            var id = Convert.ToInt32(link.Attributes["obj"]);

            PRODUCTO producto = ProductoControl.BuscarProductoPorID(id);

            //modificarModal.Visible = true;
            txtIdProduct.Text = producto.idProducto.ToString();
            txtNombreModificar.Text = producto.nombre;
            txtDescripcionModificar.Text = producto.descripcion;
            txtPrecioModificar.Text = producto.precio.ToString();
            ddlDisponibilidadModificar.SelectedValue = Convert.ToInt32(producto.disponibilidad).ToString();
            ddlCategoriaModificar.SelectedValue = producto.idCategoria.ToString();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModalAgregar();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
        }

        protected void btnGuardarModificar_Click(object sender, EventArgs e)
        {
            try
            {
                var productoModificado = new PRODUCTO()
                {
                    idProducto = Convert.ToInt32(txtIdProduct.Text),
                    nombre = txtNombreModificar.Text,
                    descripcion = txtDescripcionModificar.Text,
                    precio = Convert.ToDecimal(txtPrecioModificar.Text),
                    disponibilidad = Convert.ToBoolean(Int32.Parse(ddlDisponibilidadModificar.SelectedValue.ToString())),
                    idCategoria = Int32.Parse(ddlCategoriaModificar.SelectedValue.ToString())
                };

                ProductoControl.ModificarProducto(productoModificado);

                btnBuscar_Click(null, null);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }

        protected void btnGuardarAgregar_Click(object sender, EventArgs e)
        {
            var newProduct = new PRODUCTO()
            {
                nombre = txtNombreAgregar.Text,
                descripcion = txtDescripcionAgregar.Text,
                precio = Convert.ToDecimal(txtPrecioAgregar.Text),
                disponibilidad = Convert.ToBoolean(Int32.Parse(ddlDisponibilidadAgregar.SelectedValue.ToString())),
                idCategoria = Int32.Parse(ddlCategoriaAgregar.SelectedValue.ToString())
            };
            ProductoControl.AgregarProducto(newProduct);
            btnBuscar_Click(null, null);
        }
    }
}
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
    public partial class usuarios : System.Web.UI.Page
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
                    Response.Write("<script>alert('No tiene permisos para acceder a Usuarios');window.location = 'inicio.aspx';</script>");
                }
            }
            if (!IsPostBack)
            {
                var resultado = UsuarioControl.ListaDeUsuarios();
                gvBuscarAdmins.DataSource = resultado;
                gvBuscarAdmins.DataBind();
                if (resultado.Count > 0)
                {
                    gvBuscarAdmins.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        public string GetLabelText(object dataItem)
        {
            string text = "";
            string val = dataItem.ToString();
            switch (val)
            {
                case "True":
                    text = "Activo";
                    break;
                case "False":
                    text = "Inactivo";
                    break;
            }
            return text;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            bool estado;
            var resultado = UsuarioControl.ListaDeUsuarios();

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
                resultado = UsuarioControl.BuscarUsuarioCriterios(txtCriterios.Text);
            }
            else if (chbxEstado.Items.Cast<ListItem>().All(item => item.Selected == false))
            {
                resultado = null;
            } else
            {
                resultado = UsuarioControl.BuscarUsuarioCriterios(txtCriterios.Text, estado);
            }
            gvBuscarAdmins.DataSource = resultado;
            gvBuscarAdmins.DataBind();
            if (resultado != null)
            {
                if (resultado.Count > 0)
                {
                    gvBuscarAdmins.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void linkModificar_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModal();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

            LinkButton link = (LinkButton)sender;

            var id = Convert.ToInt32(link.Attributes["obj"]);

            USUARIO usuario= UsuarioControl.BuscarUsuarioPorID(id);

            //modificarModal.Visible = true;
            txtIdAdmin.Text = (usuario.idUsuario).ToString();
            txtNombre.Text = usuario.nombre;
            txtPrimerApellido.Text = usuario.primerApellido;
            txtSegundoApellido.Text = usuario.segundoApellido;
            txtCorreo.Text = usuario.correo;
            txtContrasena.Text = usuario.contraseña;
            ddlRolModificar.SelectedValue = usuario.tipoDeUsuario.ToString();
        }

        protected void linkEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton link = (LinkButton)sender;

                var id = Convert.ToInt32(link.Attributes["obj"]);

                UsuarioControl.CambiarEstadoUsuario(id);

                btnBuscar_Click(null, null);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                var usuarioModificado = new USUARIO()
                {
                    idUsuario = Convert.ToInt32(txtIdAdmin.Text),
                    nombre = txtNombre.Text,
                    primerApellido = txtPrimerApellido.Text,
                    segundoApellido = txtSegundoApellido.Text,
                    correo = txtCorreo.Text,
                    contraseña = txtContrasena.Text,
                    activo = true,
                    tipoDeUsuario = Int32.Parse(ddlRolModificar.SelectedValue.ToString())
                };

                UsuarioControl.ModificarUsuario(usuarioModificado);

                btnBuscar_Click(null, null);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error " + ex.Message.ToString());
            }
        }

        protected void btnGuardarAgregar_Click(object sender, EventArgs e)
        {
            var newUsuario = new USUARIO()
            {
                nombre = txtNombreAgragar.Text,
                primerApellido = txtPrimerApellidoAgregar.Text,
                segundoApellido = txtSegundoApellidoAgregar.Text,
                correo = txtCorreoAgregar.Text,
                contraseña = txtContrasenaAgregar.Text,
                activo = true,
                tipoDeUsuario = Int32.Parse(ddlRol.SelectedValue.ToString())
            };
            UsuarioControl.InsertarUsuario(newUsuario);
            btnBuscar_Click(null, null);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string javaScript = "MostrarModalAgregar();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
        }

    }
}
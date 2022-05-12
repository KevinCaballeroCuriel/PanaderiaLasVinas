using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public static class UsuarioControl
    {
        public static List<USUARIO> ListaDeUsuarios()
        {
            try
            {
                return UsuarioModel.ListaDeUsuarios();
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static USUARIO BuscarUsuarioPorID(int idUsuario)
        {
            try
            {
                if (idUsuario > 0)
                {
                    return UsuarioModel.BuscarUsuarioPorID(idUsuario);
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static USUARIO IngresarSistema(USUARIO usuario)
        {
            try
            {
                if (usuario.correo != string.Empty && usuario.contraseña != string.Empty)
                {
                    var resultado = UsuarioModel.IngresarSistema(usuario);
                    if (resultado != null)
                    {
                        return resultado;
                    }
                    else
                    {
                        throw new Exception("Usuario y/o contraseña incorrectos");
                    }
                }
                else
                {
                    throw new Exception("Hubo un error");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void CambiarEstadoUsuario(int idUsuario)
        {
            try
            {
                if (idUsuario > 0)
                {
                    UsuarioModel.CambiarEstadoUsuario(idUsuario);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<USUARIO> BuscarUsuarioCriterios(string criterios, bool estado)
        {
            try
            {
                return UsuarioModel.BuscarUsuarioCriterios(criterios, estado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<USUARIO> BuscarUsuarioCriterios(string criterios)
        {
            try
            {
                return UsuarioModel.BuscarUsuarioCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void InsertarUsuario(USUARIO newUsuario)
        {
            try
            {
                if (newUsuario.contraseña != string.Empty && newUsuario.correo != string.Empty
                    && newUsuario.nombre != string.Empty && newUsuario.primerApellido != string.Empty)
                {
                    UsuarioModel.InsertarUsuario(newUsuario);
                }
                else
                {
                    throw new Exception("Hubo un error");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void ModificarUsuario(USUARIO usuarioModificado)
        {
            try
            {
                if (usuarioModificado.contraseña != string.Empty && usuarioModificado.correo != string.Empty
                    && usuarioModificado.nombre != string.Empty && usuarioModificado.primerApellido != string.Empty)
                {
                    UsuarioModel.ModificarUsuario(usuarioModificado);
                }
                else
                {
                    throw new Exception("Hubo un error");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}

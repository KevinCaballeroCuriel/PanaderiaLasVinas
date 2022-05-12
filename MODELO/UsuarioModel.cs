using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public static class UsuarioModel
    {
        public static List<USUARIO> ListaDeUsuarios()
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<USUARIO> resultado =
                    (from admin in modelo.USUARIOS
                     select admin).ToList();
                return resultado;
            }
        }

        public static USUARIO BuscarUsuarioPorID(int idUsuario)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado = (from us in modelo.USUARIOS
                                 where us.idUsuario == idUsuario
                                 select us).FirstOrDefault();
                return resultado;
            }
        }

        public static USUARIO IngresarSistema(USUARIO usuario)
        {
            try
            {
                using (var modelo = new PedidosLasVinasEntities())
                {
                    var resultado = (from us in modelo.USUARIOS
                                     where (us.contraseña == usuario.contraseña
                                     && us.correo == usuario.correo)
                                     && us.activo == true
                                     select us).FirstOrDefault();
                    return resultado;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void CambiarEstadoUsuario(int idUsuario)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var usuario = modelo.USUARIOS.Find(idUsuario);
                if (usuario.activo == true)
                {
                    usuario.activo = false;
                }
                else
                {
                    usuario.activo = true;
                }
                modelo.SaveChanges();
            }
        }

        public static List<USUARIO> BuscarUsuarioCriterios(string criterios, bool estado)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<USUARIO> resultado =
                    (from us in modelo.USUARIOS
                     where (us.nombre.Contains(criterios)
                     || us.primerApellido.Contains(criterios)
                     || us.segundoApellido.Contains(criterios)
                     || us.correo.Contains(criterios))
                     && us.activo == estado
                     select us).ToList();
                return resultado;
            }
        }

        public static List<USUARIO> BuscarUsuarioCriterios(string criterios)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<USUARIO> resultado =
                    (from us in modelo.USUARIOS
                     where (us.nombre.Contains(criterios)
                     || us.primerApellido.Contains(criterios)
                     || us.segundoApellido.Contains(criterios)
                     || us.correo.Contains(criterios))
                     select us).ToList();
                return resultado;
            }
        }

        public static void InsertarUsuario(USUARIO newUsuario)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.USUARIOS.Add(newUsuario);
                modelo.SaveChanges();
            }
        }

        public static void ModificarUsuario(USUARIO usuarioModificado)
        {
            //var user = new USUARIO() { idUsuario = usuarioModificado.idUsuario };

            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.Entry(usuarioModificado).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
            }
        }
    }
}

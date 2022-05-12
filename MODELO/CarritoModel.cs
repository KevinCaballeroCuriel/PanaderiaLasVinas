using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public static class CarritoModel
    {
        public static int CrearCarrito(CARRITO nuevoCarrito)
        {
            int idCarrito;
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.CARRITOS.Add(nuevoCarrito);
                modelo.SaveChanges();
                idCarrito = nuevoCarrito.idCarrito;
            }
            return idCarrito;
        }

        public static CARRITO BuscarCarritoPorID(int idCarrito)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado =
                   (from c in modelo.CARRITOS
                    where c.idCarrito == idCarrito
                    select c).FirstOrDefault();
                return resultado;
            }
        }

        public static void ModificarPrecioCarrito(CARRITO carritoModificado)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.Entry(carritoModificado).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
            }
        }

        public static List<ELEMENTO_CARRITO> ListaDeElementosDelCarrito(int idCarrito)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado =
                    (from elementos in modelo.ELEMENTOS_CARRITO.Include("PRODUCTO")
                     where elementos.idCarrito == idCarrito
                     select elementos).ToList();
                return resultado;
            }
        }

        public static ELEMENTO_CARRITO BuscarElementoPorID(int idElemento)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado =
                   (from e in modelo.ELEMENTOS_CARRITO.Include("PRODUCTO")
                    where e.idElemento == idElemento
                    select e).FirstOrDefault();
                return resultado;
            }
        }

        public static void ModificarElemento(ELEMENTO_CARRITO elementoModificado)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.Entry(elementoModificado).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
            }
        }

        public static void InsertarElementoAlCarrito(ELEMENTO_CARRITO nuevoElemento)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.ELEMENTOS_CARRITO.Add(nuevoElemento);
                modelo.SaveChanges();
            }
        }

        public static void EliminarElementoDelCarrito(int idElemento)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                ELEMENTO_CARRITO elemento = modelo.ELEMENTOS_CARRITO.Find(idElemento);
                modelo.ELEMENTOS_CARRITO.Remove(elemento);
                modelo.SaveChanges();
            }
        }
    }
}

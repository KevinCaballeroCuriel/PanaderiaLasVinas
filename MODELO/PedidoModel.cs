using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public static class PedidoModel
    {
        public static List<PEDIDO> ListaDePedidos()
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado =
                    (from pedidos in modelo.PEDIDOS.Include("CARRITO")
                     select pedidos).ToList();
                return resultado;
            }
        }

        public static void ModificarEstatusPedido(PEDIDO pedidoModificado)
        {
            //var pedido = new PEDIDO() { idPedido = pedidoModificado.idPedido};

            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.Entry(pedidoModificado).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
            }
        }

        public static PEDIDO BuscarPedidoPorID(int idPedido)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado =
                    (from pedido in modelo.PEDIDOS.Include("CARRITO")
                     where pedido.idPedido == idPedido
                     select pedido).FirstOrDefault();
                return resultado;
            }
        }

        public static void NuevoPedido(PEDIDO newPedido)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.PEDIDOS.Add(newPedido);
                modelo.SaveChanges();
            }
        }

        public static void EliminarPedido(int idPedido)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                PEDIDO pedido = modelo.PEDIDOS.Find(idPedido);
                modelo.PEDIDOS.Remove(pedido);
                modelo.SaveChanges();
            }
        }

        public static List<PEDIDO> ListaDePedidosPorEstatus(string status)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PEDIDO> resultado =
                    (from pedido in modelo.PEDIDOS.Include("CARRITO")
                     where pedido.estatus.Contains(status)
                     select pedido).ToList();
                return resultado;
            }
        }
    }
}

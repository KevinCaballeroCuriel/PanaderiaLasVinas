using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public static class PedidoControl
    {
        public static List<PEDIDO> ListaDePedidos()
        {
            try
            {
                return PedidoModel.ListaDePedidos();
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void ModificarEstatusPedido(PEDIDO pedidoModificado)
        {
            try
            {
                if (pedidoModificado.estatus != "")
                {
                    PedidoModel.ModificarEstatusPedido(pedidoModificado);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static PEDIDO BuscarPedidoPorID(int idPedido)
        {
            try
            {
                if (idPedido > 0){return PedidoModel.BuscarPedidoPorID(idPedido);}
                else{return null;}
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void NuevoPedido(PEDIDO newPedido)
        {
            try
            {
                if (newPedido.idCarrito > 0 
                    && newPedido.estatus != "" 
                    && newPedido.direccion != ""
                    && newPedido.fechaDePedido != null
                    && newPedido.nombre != ""
                    && newPedido.telefono != "")
                {
                    PedidoModel.NuevoPedido(newPedido);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void EliminarPedido(int idPedido)
        {
            try
            {
                if (idPedido > 0)
                {
                    PedidoModel.EliminarPedido(idPedido);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PEDIDO> ListaDePedidosPorEstatus(string status)
        {
            try
            {
                if (status != "0"){return PedidoModel.ListaDePedidosPorEstatus(status);}
                else{return PedidoModel.ListaDePedidos();}
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public static class CarritoControl
    {
        public static int CrearCarrito(CARRITO nuevoCarrito)
        {
            try
            {
                return CarritoModel.CrearCarrito(nuevoCarrito);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static CARRITO BuscarCarritoPorID(int idCarrito)
        {
            try
            {
                if (idCarrito > 0)
                {
                    return CarritoModel.BuscarCarritoPorID(idCarrito);
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

        public static ELEMENTO_CARRITO BuscarElementoPorID(int idElemento)
        {
            try
            {
                if (idElemento > 0)
                {
                    return CarritoModel.BuscarElementoPorID(idElemento);
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

        public static void ModificarPrecioCarrito(CARRITO carritoModificado)
        {
            try
            {
                if (carritoModificado.precioDelCarrito > 0)
                {
                    CarritoModel.ModificarPrecioCarrito(carritoModificado);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<ELEMENTO_CARRITO> ListaDeElementosDelCarrito(int idCarrito)
        {
            try
            {
                if (idCarrito > 0)
                {
                    return CarritoModel.ListaDeElementosDelCarrito(idCarrito);
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

        public static void ModificarElemento(ELEMENTO_CARRITO elementoModificado)
        {
            try
            {
                CarritoModel.ModificarElemento(elementoModificado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void InsertarElementoAlCarrito(ELEMENTO_CARRITO nuevoElemento)
        {
            try
            {
                CarritoModel.InsertarElementoAlCarrito(nuevoElemento);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void EliminarElementoDelCarrito(int idElemento)
        {
            try
            {
                if (idElemento > 0)
                {
                    CarritoModel.EliminarElementoDelCarrito(idElemento);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}

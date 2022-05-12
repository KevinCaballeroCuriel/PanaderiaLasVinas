using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MODELO;

namespace CONTROLADOR
{
    public static class ProductoControl
    {
        public static List<PRODUCTO> ListaDeProducto()
        {
            try
            {
                return ProductoModel.ListaDeProductos();
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<CATEGORIA> ListaDeCategorias()
        {
            try
            {
                return ProductoModel.ListaDeCategorias();
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static CATEGORIA BuscarCategoriaPorID(int idCategoria)
        {
            try
            {
                if (idCategoria >= 1)
                {
                    return ProductoModel.BuscarCategoriaPorID(idCategoria);
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

        public static List<PRODUCTO> ListaDeProductosPorCategoria(int idCategoria)
        {
            try
            {
                if (idCategoria <= 0)
                {
                    return ProductoModel.ListaDeProductos();
                }
                else
                {
                    return ProductoModel.ListaDeProductosPorCategoria(idCategoria);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios, int idCategoria, bool estado)
        {
            try
            {
                if (idCategoria <= 0)
                {
                    return ProductoModel.BuscarProductosPorCriterios(criterios, estado);
                }
                else
                {
                    return ProductoModel.BuscarProductosPorCriterios(criterios, idCategoria, estado);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios, int idCategoria)
        {
            try
            {
                if (idCategoria <= 0)
                {
                    return ProductoModel.BuscarProductosPorCriterios(criterios);
                }
                else
                {
                    return ProductoModel.BuscarProductosPorCriterios(criterios, idCategoria);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios, bool estado)
        {
            try
            {
                return ProductoModel.BuscarProductosPorCriterios(criterios, estado);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios)
        {
            try
            {
                return ProductoModel.BuscarProductosPorCriterios(criterios);
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static PRODUCTO BuscarProductoPorID(int idProduct)
        {
            try
            {
                if (idProduct >= 0)
                {
                    return ProductoModel.BuscarProductoPorID(idProduct);
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

        public static void AgregarProducto(PRODUCTO newProduct)
        {
            try
            {
                if (newProduct.nombre != string.Empty && newProduct.descripcion != string.Empty
                    && newProduct.precio > 0 && newProduct.idCategoria > 0)
                {
                    ProductoModel.AgregarProducto(newProduct);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void ModificarProducto(PRODUCTO productoModificado)
        {
            try
            {
                if (productoModificado.nombre != string.Empty && productoModificado.descripcion != string.Empty
                    && productoModificado.precio > 0 && productoModificado.idCategoria > 0)
                {
                    ProductoModel.ModificarProducto(productoModificado);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }

        public static void EliminarProducto(int idProduct)
        {
            try
            {
                if (idProduct > 0)
                {
                    ProductoModel.EliminarProducto(idProduct);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la capa del Modelo: " + ex.Message.ToString());
            }
        }
    }
}

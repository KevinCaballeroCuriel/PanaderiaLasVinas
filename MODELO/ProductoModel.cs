using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MODELO
{
    public static class ProductoModel
    {
        public static List<PRODUCTO> ListaDeProductos()
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PRODUCTO> resultado =
                    (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                     select products).ToList();
                return resultado;
            }
        }

        public static List<CATEGORIA> ListaDeCategorias()
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<CATEGORIA> resultado =
                    (from category in modelo.CATEGORIAS
                     select category).ToList();
                return resultado;
            }
        }

        public static CATEGORIA BuscarCategoriaPorID(int idCategoria)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado =
                    (from category in modelo.CATEGORIAS
                     where category.idCategoria == idCategoria
                     select category).FirstOrDefault();
                return resultado;
            }
        }

        public static List<PRODUCTO> ListaDeProductosPorCategoria(int idCategoria)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PRODUCTO> resultado =
                    (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                     where products.idCategoria == idCategoria
                     select products).ToList();
                return resultado;
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios, int idCategoria, bool estado)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PRODUCTO> resultado =
                    (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                     where (products.nombre.Contains(criterios) 
                     || products.descripcion.Contains(criterios)) 
                     && products.idCategoria == idCategoria && products.disponibilidad == estado
                     select products).ToList();
                return resultado;
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios, int idCategoria)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PRODUCTO> resultado =
                    (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                     where (products.nombre.Contains(criterios)
                     || products.descripcion.Contains(criterios))
                     && products.idCategoria == idCategoria && products.disponibilidad == true
                     select products).ToList();
                return resultado;
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios, bool estado)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PRODUCTO> resultado =
                    (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                     where (products.nombre.Contains(criterios)
                     || products.descripcion.Contains(criterios))
                     && products.disponibilidad == estado
                     select products).ToList();
                return resultado;
            }
        }

        public static List<PRODUCTO> BuscarProductosPorCriterios(string criterios)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                List<PRODUCTO> resultado =
                    (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                     where (products.nombre.Contains(criterios)
                     || products.descripcion.Contains(criterios))
                     && products.disponibilidad == true
                     select products).ToList();
                return resultado;
            }
        }

        public static PRODUCTO BuscarProductoPorID(int idProduct)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                var resultado = (from products in modelo.PRODUCTOS.Include("CATEGORIA")
                                 where products.idProducto == idProduct
                                 select products).FirstOrDefault();
                return resultado;
            }
        }

        public static void AgregarProducto(PRODUCTO newProduct)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.PRODUCTOS.Add(newProduct);
                modelo.SaveChanges();
            }
        }

        public static void ModificarProducto(PRODUCTO productoModificado)
        {
            //var product = new PRODUCTO() { idProducto = productoModificado.idProducto};

            using (var modelo = new PedidosLasVinasEntities())
            {
                modelo.Entry(productoModificado).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
            }
        }

        public static void EliminarProducto(int idProduct)
        {
            using (var modelo = new PedidosLasVinasEntities())
            {
                PRODUCTO product = modelo.PRODUCTOS.Find(idProduct);
                modelo.PRODUCTOS.Remove(product);
                modelo.SaveChanges();
            }
        }
    }
}

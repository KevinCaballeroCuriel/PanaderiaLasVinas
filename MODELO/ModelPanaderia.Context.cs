﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MODELO
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PedidosLasVinasEntities : DbContext
    {
        public PedidosLasVinasEntities()
            : base("name=PedidosLasVinasEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CARRITO> CARRITOS { get; set; }
        public virtual DbSet<CATEGORIA> CATEGORIAS { get; set; }
        public virtual DbSet<ELEMENTO_CARRITO> ELEMENTOS_CARRITO { get; set; }
        public virtual DbSet<PEDIDO> PEDIDOS { get; set; }
        public virtual DbSet<PRODUCTO> PRODUCTOS { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TIPO_DE_USUARIO> TIPOS_DE_USUARIO { get; set; }
        public virtual DbSet<USUARIO> USUARIOS { get; set; }
    }
}

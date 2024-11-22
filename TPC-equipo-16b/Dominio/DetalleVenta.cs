using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetalleVenta
    {
        public int IdDetalleVenta { get; set; }
        public int IdCompra { get; set; }
        public int IdProducto { get; set; }
        public Articulo Articulo { get; set; }
        public int Cantidad { get; set; }
        public decimal Total { get; set; }
    }
}

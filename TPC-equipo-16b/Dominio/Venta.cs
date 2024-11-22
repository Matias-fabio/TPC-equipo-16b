using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
        public int NumVenta { get; set; }
        public Cliente Cliente { get; set; } = new Cliente();
        public DateTime FechaVenta { get; set; }
        public string MetodoPago { get; set; }
        public Envio Envio { get; set; } = new Envio();
        public decimal TotalVenta { get; set; }
        public Estado Estado { get; set; } = new Estado();
        List<DetalleVenta> listaDetalleVenta { get; set; }
    }
}

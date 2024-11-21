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
        public int IdCliente { get; set; }
        public DateTime FechaVenta { get; set; }
        public decimal TotalVenta { get; set; }
        public string MetodoPago { get; set; }
        public int CostoEnvio { get; set; }
        public string Estado { get; set; }
    }
}

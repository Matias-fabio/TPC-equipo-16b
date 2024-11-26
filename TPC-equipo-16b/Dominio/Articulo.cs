using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public string UrlImagen { get; set; }
        public int IdCategoria { get; set; }
        public int IdMarca { get; set; }
        public string categoria { get; set; }
        public string Marca { get; set; }
        public int Cantidad { get; set; } 
    }

}


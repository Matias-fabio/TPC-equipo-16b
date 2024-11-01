using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Id { get; set; }
        public string categoria { get; set; }
        public string Marca { get; set; }

    }
}
//Para la primera etapa del TPC se solicita:
//-la arquitectura de clases (modelo de dominio),
//- armado de pantallas de la aplicación (SIN funcionalidad, sólo ventanas, algunos controles y navegación) y
//- lectura desde base de datos de al menos UNA entidad.
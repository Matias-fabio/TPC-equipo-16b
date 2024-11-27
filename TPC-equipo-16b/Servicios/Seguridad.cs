using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Servicios
{
    public static class Seguridad
    {
        public static bool sessionActiva(object usuario)
        {
            Cliente cliente = usuario != null ? (Cliente)usuario : null;
            if (cliente != null && cliente.ID != 0)
                return true;
            else
                return false;
        }
    }
}

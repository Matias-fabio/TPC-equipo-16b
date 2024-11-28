using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class negocioHelpers
    {
        public string GenerarCodigoSeguimiento()
        {
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(caracteres, 10)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}

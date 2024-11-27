using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("decompritas601@gmail.com", "jaun jhrg lfum vgjt");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";

        }

        public void armarCorreo(string correoDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@ecommercedecompritas601gmail.com");
            email.To.Add(correoDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;
            //email.Body = "<h2> Tu compra ha sido confirmada correctamente</h2> <br>";
            //email.Body += "<p>Gracias por tu compra en nuestra tienda. Aquí tienes los detalles de tu pedido:</p>";;
            //email.Body += "<p>Esperamos que disfrutes tu compra. Si tienes alguna pregunta, no dudes en contactarnos.</p>";
            //email.Body += "<p>Saludos cordiales,</p>";
            //email.Body += "<p>Equipo de E-commerce</p>";
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class UsuarioEntity
    {
        public UsuarioEntity()
        {
            Id_usr = 0;
            Nombre = "";
            Apellido = "";
            Email = "";
            Pasword = "";
            Fnac = DateTime.MinValue;
            Sexo = ' ';
            //Foto = null;
            FechaRegistracion = DateTime.Now;
           // FechaActualizacion = null;
        }

        public int Id_usr { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Pasword { get; set; }
        public DateTime Fnac { get; set; }
        public char Sexo { get; set; }
        public string Foto { get; set; }
        public DateTime FechaRegistracion { get; set; }
        public Nullable<DateTime> FechaActualizacion { get; set; }

        public void ValidarDatos()
        {
            if (Nombre.Trim() == "" ||
                Apellido.Trim() == "" ||
                Email.Trim() == "" ||
                Pasword.Trim() == "" ||
                Fnac == DateTime.MinValue ||
                Sexo == ' ')
            {
                throw new DatosObligatoriosExcepcion();
            }

            if (!Util.EsEmail(Email))
            {
                throw new EmailExcepcion();
            }

            if (Fnac > DateTime.Today)
            {
                throw new FechaNacimientoExcepcion();
            }
        }
    }
}

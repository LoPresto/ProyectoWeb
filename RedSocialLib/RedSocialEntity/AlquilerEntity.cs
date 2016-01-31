using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;


namespace RedSocialEntity
{
    public class AlquilerEntity
    {
        public AlquilerEntity()
        {
            Id_alquiler = 0;
            Id_publicacion = 0;
            Id_usr = 0;
            Costo = 0;
            FechaDesde = Convert.ToString(DateTime.Now.Date);
            FechaHasta = Convert.ToString(DateTime.Now.Date);
            Confirmado = false;
            Pagado = false;
            Finalizado = false;
          }

        public int Id_alquiler { get; set; }
        public int Id_publicacion { get; set; }
        public int Id_usr { get; set; }
        public int Costo { get; set; }
        public string FechaDesde { get; set; }
        public string FechaHasta { get; set; }
        public bool Confirmado { get; set; }
        public bool Pagado { get; set; }
        public bool Finalizado { get; set; }

         }
    }


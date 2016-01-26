using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialComun;

namespace RedSocialEntity
{
    public class PublicacionEntity
    {
      public PublicacionEntity()
        {
            Id_publicacion = 0;
            Id_usr = 0;
            Titulo = "";
            Descripcion = "";
            PrecioD = 0;;
            PrecioS = 0;
            PecioM = 0;
            FechaDesde = Convert.ToString(DateTime.Now.Date);
            FechaHasta = Convert.ToString(DateTime.Now.Date);
            Id_cat_lvl3 = 0;
            Alquilado = false;
            Suspendido = false;
        }

        public int Id_publicacion { get; set; }
        public int Id_usr { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public float PrecioD { get; set; }
        public float PrecioS { get; set; }
        public float PecioM { get; set; }
        public string FechaDesde { get; set; }
        public string FechaHasta { get; set; }
        public bool Alquilado { get; set; }
        public bool Suspendido { get; set; }
        public int Id_cat_lvl3 { get; set; }

        //public void ValidarDatos()
        //{
        //    
        //}
    }
}



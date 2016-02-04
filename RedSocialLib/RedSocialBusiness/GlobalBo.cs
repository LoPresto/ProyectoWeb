using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RedSocialBusiness
{
    public static class GlobalBo
    {
        public static int      _Id_Publicacion { get; set; }
        public static int      _Id_usr         { get; set; }
        public static string   _Titulo         { get; set; }
        public static string   _Descripcion    { get; set; }
        public static int      _PrecioD        { get; set; }
        public static int      _PrecioS        { get; set; }
        public static int      _PrecioM        { get; set; }
        public static DateTime _FechaDesde     { get; set; }
        public static DateTime _FechaHasta     { get; set; }
        public static string   _Suspendido     { get; set; }
        public static DateTime _inicioAlqui    { get; set; }
        public static DateTime _finaAlqui      { get; set; }
        public static float    _cost           { get; set; }
        public static int      _id_alquiler    { get; set; }
        public static int      _cantdias       { get; set; }
        public static float    _feeService     { get; set; }
        public static float    _totalcost      { get; set; }

    }
}

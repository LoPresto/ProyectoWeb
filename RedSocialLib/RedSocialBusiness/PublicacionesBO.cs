using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RedSocialEntity;
using RedSocialData;
using RedSocialDataSQLServer;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RedSocialBusiness
{
    public class PublicacionesBO
    {
        private PublicacionesDA daPublicacion;

        public PublicacionesBO()
        {
            daPublicacion = new PublicacionesDA();
        }

        public void Publicar(PublicacionEntity publicacion)
        {
            try
            {
                //publicacion.ValidarDatos();

                daPublicacion.Insertar(publicacion);

            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la publicacion del producto.", ex);
            }
        }

        public void Modificar(PublicacionEntity publicacion)
        {
            try
            {
                //publicacion.ValidarDatos();

                daPublicacion.Modificar(publicacion);

            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la publicacion del producto.", ex);
            }
        }

        public void Suspender(PublicacionEntity publicacion)
        {
            try
            {
                //publicacion.ValidarDatos();

                daPublicacion.Suspender(publicacion);

            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la publicacion del producto.", ex);
            }
        }

        public void BuscarPublicacion(GridView GridView1, string SearchWord, int id_usr)
        {
            daPublicacion.BuscarPublicacion(GridView1, SearchWord, id_usr);
        }

        public void VerMisAlquilados(GridView GridView1, int id_usr)
        {
            daPublicacion.VerMisAlquilados(GridView1, id_usr);
        }

        public void VerMisAlquileres(GridView GridView1, int id_usr)
        {
            daPublicacion.VerMisAlquileres(GridView1, id_usr);
        }

        public void VerMisPublicaciones(GridView GridView3, int id_usr)
        {
            daPublicacion.VerMisPublicaciones(GridView3, id_usr);
        }

        public void Alquilar(PublicacionEntity publicacion, AlquilerEntity alquiler)
        {
            try
            {
                //publicacion.ValidarDatos();

                daPublicacion.Alquilar(publicacion, alquiler);

            }
            catch (ExcepcionDA ex)
            {
                throw new ExcepcionBO("No se pudo realizar la publicacion del producto.", ex);
            }

        }
    }
}

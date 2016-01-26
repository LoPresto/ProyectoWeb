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

        public void BuscarPublicacion(GridView GridView1, string SearchWord)
        {
            daPublicacion.BuscarPublicacion(GridView1, SearchWord);
        }


    }
}

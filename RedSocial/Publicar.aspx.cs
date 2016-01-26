using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialBusiness;

public partial class Procesos_Publicar_Default : System.Web.UI.Page
{
    PublicacionEntity publicacion = new PublicacionEntity();
    PublicacionesBO publicacionBo = new PublicacionesBO();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCrearViaje_clik(object sender, EventArgs e)
    {
        publicacion.Id_usr = SessionHelper.UsuarioAutenticado.Id_usr;
        publicacion.Titulo = txtTitulo.Text;
        publicacion.Descripcion = txtDescripcion.Text;
        publicacion.FechaDesde = Convert.ToString(DateTime.Now.Date);
        publicacion.FechaHasta = txtDate.Text;
        publicacion.PrecioD = Convert.ToInt64(numPrecio.Text);
        publicacion.PrecioS = publicacion.PrecioD*7;
        publicacion.PecioM = publicacion.PrecioS*4;
        //publicacion.Fecha = Fecha2.Text;
        //publicacion.Reservado = "NO";

        publicacionBo.Publicar(publicacion);
        Server.Transfer("Perfil.aspx");

    }


}
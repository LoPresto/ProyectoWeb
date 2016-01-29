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
        if (!Page.IsPostBack)
        {
            txtTitulo.Text = GlobalBo._Titulo.Trim();
            txtDescripcion.Text = GlobalBo._Descripcion.Trim();
            txtDate.Text = Convert.ToString(GlobalBo._FechaHasta).Substring(0, 10).Trim();
            numPrecio.Text = Convert.ToString(GlobalBo._PrecioD);
            //publicacion.PrecioS = publicacion.PrecioD * 7;
            //publicacion.PecioM = publicacion.PrecioS * 4;
        }
    }

    protected void btnModPublicacion_click(object sender, EventArgs e)
    {
        publicacion.Id_publicacion = GlobalBo._Id_Publicacion;
        publicacion.Titulo = txtTitulo.Text;
        publicacion.Descripcion = txtDescripcion.Text;
        publicacion.FechaHasta = txtDate.Text;
        publicacion.PrecioD = Convert.ToInt64(numPrecio.Text);
        publicacion.PrecioS = publicacion.PrecioD*7;
        publicacion.PecioM = publicacion.PrecioS*4;
        //publicacion.Fecha = Fecha2.Text;
        //publicacion.Reservado = "NO";

        publicacionBo.Modificar(publicacion);
        Server.Transfer("VerMisPublic.aspx");

    }


    protected void btnSuspPublicacion_click(object sender, EventArgs e)
    {
        publicacion.Id_publicacion = GlobalBo._Id_Publicacion;
        publicacion.Titulo = txtTitulo.Text;
        publicacion.Descripcion = txtDescripcion.Text;
        publicacion.FechaHasta = txtDate.Text;
        publicacion.PrecioD = Convert.ToInt64(numPrecio.Text);
        publicacion.PrecioS = publicacion.PrecioD * 7;
        publicacion.PecioM = publicacion.PrecioS * 4;

        publicacionBo.Suspender(publicacion);
        Server.Transfer("VerMisPublic.aspx");

    }



}
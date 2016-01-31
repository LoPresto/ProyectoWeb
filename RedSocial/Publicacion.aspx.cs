using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialBusiness;

public partial class Publicacion : System.Web.UI.Page
{
    PublicacionEntity publicacion = new PublicacionEntity();
    PublicacionesBO publicacionBo = new PublicacionesBO();
    AlquilerEntity alquiler = new AlquilerEntity();

    //Variables de la vista
    string txtTitulo;
    string txtDescripcion;
    int precioD;
    int precioS;
    int precioM;
    DateTime FechaHasta;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             txtTitulo = GlobalBo._Titulo.Trim();
             txtDescripcion = GlobalBo._Descripcion.Trim();
             FechaHasta = GlobalBo._FechaHasta;
             precioD = GlobalBo._PrecioD;
             precioS = GlobalBo._PrecioS;
             precioM = GlobalBo._PrecioM;

            //publicacion.PrecioS = publicacion.PrecioD * 7;
            //publicacion.PecioM = publicacion.PrecioS * 4;
        }
    }

    protected void btnAlquilar(object sender, EventArgs e)
    {
        //publicacion.Id_publicacion = GlobalBo._Id_Publicacion;
        //publicacion.Titulo = txtTitulo.Text;
        //publicacion.Descripcion = txtDescripcion.Text;
        //publicacion.FechaHasta = txtDate.Text;
        //publicacion.PrecioD = Convert.ToInt64(numPrecio.Text);
        //publicacion.PrecioS = publicacion.PrecioD * 7;
        //publicacion.PecioM = publicacion.PrecioS * 4;
        //publicacionBo.Alquilar(publicacion, alquiler);
        Server.Transfer("Perfil.aspx");

    }


}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialBusiness;

public partial class Pago : System.Web.UI.Page
{
    //Variables de la vista
    public string txtTitulo;
    public string txtDescripcion;
    public int txtDias;
    public DateTime txtInicioAlqui;
    public DateTime txtFinalqui;
    public float CostoAlqui;
    public float Feealqui;
    public float Totalcost;

    PublicacionEntity publicacion = new PublicacionEntity();
    PublicacionesBO publicacionBo = new PublicacionesBO();
    AlquilerEntity alquiler = new AlquilerEntity();
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtTitulo = GlobalBo._Titulo.Trim();
            //txtDescripcion.Text = GlobalBo._Descripcion.Trim();
            txtDias = GlobalBo._cantdias;
            txtInicioAlqui = GlobalBo._inicioAlqui;
            txtFinalqui = GlobalBo._finaAlqui;
            CostoAlqui = GlobalBo._cost;
            Feealqui = GlobalBo._feeService;
            Totalcost = GlobalBo._totalcost;
        }
    }

    protected void btnPagarMP (object sender, EventArgs e)
    {
        publicacion.Id_publicacion = GlobalBo._Id_Publicacion;
        alquiler.Costo =  GlobalBo._cost;
        alquiler.FechaDesde = GlobalBo._inicioAlqui.ToString("dd/MM/yyyy");
        alquiler.FechaHasta = GlobalBo._finaAlqui.ToString("dd/MM/yyyy");
        alquiler.Id_usr = SessionHelper.UsuarioAutenticado.Id_usr;

        publicacionBo.Alquilar(publicacion, alquiler);

      
    }

    protected void btnPagarEfectivo (object sender, EventArgs e)
    {
        
    }
}
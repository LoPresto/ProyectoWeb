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
   public string txtTitulo;
   public string txtDescripcion;
   public int precioD;
   public int precioS;
   public int precioM;
   public DateTime FechaHasta;
   public int DiasFin;
   public DateTime Hoy;
   public TimeSpan ts;
   public DateTime fechainicioalquiler;

   public TimeSpan Cant_Dias_Alquiler;

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
             Hoy = DateTime.Now;
             ts = FechaHasta - Hoy;
             DiasFin = ts.Days;
             fechainicioalquiler = Hoy.AddDays(1);
             txtDateInicio.Text = Hoy.ToString("dd/MM/yyyy");
             txtDateFin.Text = fechainicioalquiler.ToString("dd/MM/yyyy");

           
        }
    }

    protected void btnAlquilar(object sender, EventArgs e)
    {
          publicacion.Id_publicacion = GlobalBo._Id_Publicacion;
          GlobalBo._inicioAlqui = Convert.ToDateTime(txtDateInicio.Text);
          GlobalBo._finaAlqui   = Convert.ToDateTime(txtDateFin.Text);
          Cant_Dias_Alquiler = GlobalBo._finaAlqui - GlobalBo._inicioAlqui;
          GlobalBo._cantdias = Convert.ToInt16(Cant_Dias_Alquiler.Days);
          GlobalBo._cost = GlobalBo._PrecioD * GlobalBo._cantdias;
          GlobalBo._feeService = GlobalBo._cost * 0.05F;
          GlobalBo._totalcost = GlobalBo._cost + GlobalBo._feeService;
 
        Server.Transfer("ConfirmacionAlq.aspx");

    }


}
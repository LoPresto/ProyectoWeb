using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialBusiness;

public partial class ConfirmacionAlq : System.Web.UI.Page
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

    protected void btnConfirmar(object sender, EventArgs e)
    {
        Server.Transfer("Pagar.aspx");
    }

    protected void btnCancelar(object sender, EventArgs e)
    {
        Server.Transfer("Perfil.aspx");
    }
}
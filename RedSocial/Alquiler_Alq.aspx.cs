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
   public string estado;
   public string nombre_publicador;
   public string email_publicador;
   public int DiasRestantes;
   public int id_publicacion;
   public int id_alquiler;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
             txtTitulo = GlobalBo._Titulo.Trim();
             estado = GlobalBo._Estado;
             nombre_publicador = GlobalBo._Nombre;
             email_publicador = GlobalBo._Email;
             DiasRestantes = GlobalBo._DiasRestantes;
             id_alquiler = GlobalBo._id_alquiler;
             id_publicacion = GlobalBo._Id_Publicacion;
           
        }
    }

    


}
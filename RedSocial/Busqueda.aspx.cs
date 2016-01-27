using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialBusiness;

public partial class Busqueda : System.Web.UI.Page
{
    private PublicacionesBO Publicacion = new PublicacionesBO();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        string SearchWord = txtSearchWord.Text;
        Publicacion.BuscarPublicacion(GridView1, SearchWord);
    }

}
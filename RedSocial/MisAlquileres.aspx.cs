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

public partial class MisAlquileres : System.Web.UI.Page
{
    private PublicacionesBO Publicacion = new PublicacionesBO();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PublicacionesBO Publicacion = new PublicacionesBO();
            Publicacion.VerMisAlquileres(GridView2, SessionHelper.UsuarioAutenticado.Id_usr);
        }

    }

    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView2, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow Gridrow = GridView2.SelectedRow;
        int indexcoma;
        int largoprecio;
        string preciocorto;
        string fechahasta;
        string cortador;


        if (GridView2.SelectedRow != null)
        {
            GlobalBo._Id_Publicacion = Convert.ToInt32(Gridrow.Cells[0].Text);
            //GlobalBo._Id_usr = SessionHelper.UsuarioAutenticado.Id_usr;//Gridrow.Cells[0].Text;
            GlobalBo._id_alquiler = Convert.ToInt32(Gridrow.Cells[1].Text);
            GlobalBo._Titulo = Gridrow.Cells[2].Text;
            GlobalBo._Estado = Gridrow.Cells[4].Text;
            GlobalBo._DiasRestantes = Convert.ToInt32(Gridrow.Cells[3].Text);
            GlobalBo._Nombre = Gridrow.Cells[5].Text;
            GlobalBo._Email = Gridrow.Cells[6].Text;

            Server.Transfer("Alquiler_Pub.aspx");

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor seleccione un registro')", true);
        }
    }
}
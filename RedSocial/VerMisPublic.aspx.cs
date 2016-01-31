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
        if (!Page.IsPostBack)
        {
            PublicacionesBO Publicacion = new PublicacionesBO();
            Publicacion.VerMisPublicaciones(GridView1, SessionHelper.UsuarioAutenticado.Id_usr);
        }

    }

    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow Gridrow = GridView1.SelectedRow;

        if (GridView1.SelectedRow != null)
        {
            GlobalBo._Id_Publicacion = Convert.ToInt32(Gridrow.Cells[0].Text);
            GlobalBo._Id_usr = SessionHelper.UsuarioAutenticado.Id_usr;
            GlobalBo._Titulo          = Gridrow.Cells[1].Text;
            GlobalBo._PrecioD = Convert.ToInt32(Gridrow.Cells[3].Text.Substring(1));
            GlobalBo._PrecioS = Convert.ToInt32(Gridrow.Cells[4].Text.Substring(1));
            GlobalBo._PrecioM = Convert.ToInt32(Gridrow.Cells[5].Text.Substring(1));
            GlobalBo._FechaDesde = Convert.ToDateTime(Gridrow.Cells[6].Text);
            GlobalBo._FechaHasta      = Convert.ToDateTime(Gridrow.Cells[7].Text.Substring(0,10));
            GlobalBo._Suspendido      = Gridrow.Cells[8].Text;  
            
            Server.Transfer("ModPublicacion.aspx");

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor seleccione un registro')", true);
        }
    }
  

}
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
            GlobalBo._Titulo = Gridrow.Cells[1].Text;
            GlobalBo._Descripcion = Gridrow.Cells[2].Text;
            GlobalBo._Descripcion = Gridrow.Cells[2].Text;
            largoprecio = Gridrow.Cells[3].Text.Length;
            preciocorto = Gridrow.Cells[3].Text.Substring(1, largoprecio - 1);
            indexcoma = preciocorto.IndexOf(",");
            GlobalBo._PrecioD = Convert.ToInt32(Gridrow.Cells[3].Text.Substring(1, indexcoma - 1));
            GlobalBo._PrecioS = GlobalBo._PrecioD * 7;
            GlobalBo._PrecioM = GlobalBo._PrecioD * 31;
            GlobalBo._FechaHasta = Convert.ToDateTime(Gridrow.Cells[4].Text);

            Server.Transfer("Publicacion.aspx");

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Por favor seleccione un registro')", true);
        }
    }
}
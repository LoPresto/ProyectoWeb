using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Permissions;

[PrincipalPermission(SecurityAction.Demand, Authenticated = true)]
public partial class Autenticado : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCerrar_Sesion(object sender, EventArgs e)
    {
        Session.Abandon(); // Limpiar la sesion
        System.Web.Security.FormsAuthentication.SignOut();
        Server.Transfer("Default.aspx");

    }
}

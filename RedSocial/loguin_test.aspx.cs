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

public partial class loguin_test : System.Web.UI.Page
{

    private UsuarioBO boUsuario = new UsuarioBO();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        string Email = Request.Form["TxtEmail"];
        string Password = Request.Form["TxtPassword"];
        try
        {
            SessionHelper.AlmacenarUsuarioAutenticado(boUsuario.Autenticar(Email, Password));
            
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(SessionHelper.UsuarioAutenticado.Email, false);
            Server.Transfer("Perfil.aspx");
        }
        catch (AutenticacionExcepcionBO ex)
        {
            WebHelper.MostrarMensaje(Page, ex.Message);
        }

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

    }
}
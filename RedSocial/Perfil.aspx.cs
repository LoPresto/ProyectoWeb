﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RedSocialEntity;
using RedSocialWebUtil;
using RedSocialBusiness;
using System.Web.Services;


public partial class Biografia : System.Web.UI.Page
{
    public string Nombre;
    public string Apellido;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //TxtNombre.Text = SessionHelper.UsuarioAutenticado.Nombre;
            //txtApellido.Text = SessionHelper.UsuarioAutenticado.Apellido;
           // TxtEmail.Text = SessionHelper.UsuarioAutenticado.Email;
             Nombre = SessionHelper.UsuarioAutenticado.Nombre;
             Apellido = SessionHelper.UsuarioAutenticado.Apellido;
            
        }


    }
    protected void btnCerrar_Sesion(object sender, EventArgs e)
    {
        Session.Abandon(); // Limpiar la sesion
        System.Web.Security.FormsAuthentication.SignOut();
        Server.Transfer("Home.aspx");

    }
}
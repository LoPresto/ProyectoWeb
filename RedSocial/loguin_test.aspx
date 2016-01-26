<%@ Page Title="" Language="C#" MasterPageFile="~/SinAutenticar.master" AutoEventWireup="true" CodeFile="loguin_test.aspx.cs" Inherits="loguin_test" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">
<div class="col-md-12">
								                          
<div class="form-group">
		<label class="sr-only" for="exampleInputEmail2">Email address</label>
		<input type="email" class="form-control" id="TxtEmail" name="TxtEmail" placeholder="Ingrese correo electrónico" required>
</div>
<div class="form-group">
		<label class="sr-only" for="exampleInputPassword2">Password</label>
		<input type="password" class="form-control" id="TxtPassword" name="TxtPassword" placeholder="Ingrese su contraseña" required>
    <%-- <div class="help-block text-right"><a href="RecuperarPassword.aspx">¿Olvido su contraseña?</a></div>--%>
</div>
<div class="form-group">
		<asp:LinkButton ID="Ingresar"  Text="Ingresar" class="btn btn-primary btn-block" Height = "25%" runat="server" OnClick="btnEntrar_Click" required></asp:LinkButton>
</div>
 
</div>
</asp:Content>



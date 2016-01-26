<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoNormal.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Biografia" %>

<asp:Content ID="cphCuerpo" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <div>
     <h1 class=" text-center pacifico"> Bienvenido  - <%=Nombre%> <%=Apellido%> </h1>
     <h2 class=" text-center lato"> Selecciona alguna acción para continuar</h2>
    </div>
   

    <!--Buscar-->
 <div class=" text-center">
	<div class="col-md-4 inline-block espacio-arriba espacio-abajo">
     <h3 class=" text-center pacifico">Buscar Publicacion
    </h3>
    <button id="BuscarButton" type="submit" class="btn btn-default btn-plano fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btn_BuscarPublicaciones_Click" required>
	    <span class="fa-stack fa-lg fa-5x">
	          <i class="fa fa-square fa-stack-2x"></i>
	          <i class="fa fa-binoculars fa-stack-1x fa-inverse"></i>
	    </span>
    </button>
	</div>

<!--Publicar-->
	<div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <h3 class=" text-center pacifico">Publicar
    </h3>
    <button id="PublicarButton" type="submit" class="btn btn-default fondo_blanco btn-sinborde btn-plano largo-80"  runat="server"   onserverclick="btnPublicar_Click" required>
	<span class="fa-stack fa-lg fa-5x">
	  <i class="fa fa-square fa-stack-2x"></i>
	  <i class="fa fa-bullhorn fa-stack-1x fa-inverse"></i>
	</span>
    </button>
	</div>

<!--Revisar publicaciones-->
	<div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <h3 class=" text-center pacifico">Revisar mis publicaciones
    </h3>
    <button id="EditarPublicacionesButton" type="submit" class="btn btn-default fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnCerrar_Sesion" required>
	<span class="fa-stack fa-lg fa-5x">
	  <i class="fa fa-square fa-stack-2x"></i>
	  <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
	</span>
    </button>
	</div>

<!--Mis publicaciones alquiladas-->
	<div class="col-md-4 inline-block espacio-arriba espacio-abajo">
     <h3 class=" text-center pacifico">Mis publicaciones alquiladas
    </h3>
    <button id="PublicacionesAlquiladasButton2" type="submit" class="btn btn-default fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnCerrar_Sesion" required>
	<span class="fa-stack fa-lg fa-5x">
	  <i class="fa fa-square fa-stack-2x"></i>
	  <i class="fa fa-slideshare fa-stack-1x fa-inverse"></i>
	</span>
    </button>
	</div>

<!--Mis Alquileres-->
	<div class="col-md-4 inline-block espacio-arriba espacio-abajo">
     <h3 class=" text-center pacifico">Mis Alquileres
    </h3>
    <button id="MisAlquileresButton" type="submit" class="btn btn-default fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnCerrar_Sesion" required>
	<span class="fa-stack fa-lg fa-5x">
	  <i class="fa fa-square fa-stack-2x"></i>
	  <i class="fa fa-shopping-basket fa-stack-1x fa-inverse"></i>
	</span>
    </button>
	</div>

<!--LogOut-->
<div class="col-md-4 inline-block espacio-arriba espacio-abajo">
<h3 class=" text-center pacifico">Desconectarme
    </h3>
<button id="Cerrar_SesionButton" type="submit" class="btn btn-default fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnCerrar_Sesion" required>
    <span class="fa-stack fa-lg fa-5x">
	  <i class="fa fa-square fa-stack-2x"></i>
	  <i class="fa fa-sign-out fa-stack-1x fa-inverse"></i>
	</span>
</button>
</div>
	

</asp:Content>


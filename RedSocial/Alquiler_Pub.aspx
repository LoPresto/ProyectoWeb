<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoAcciones.master" AutoEventWireup="true" CodeFile="Alquiler_Pub.aspx.cs" Inherits="Publicacion" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <div>
     <h1 class=" text-center Lato">  <%=txtTitulo%>  </h1>
     <h2 class=" text-center pacifico">El usuario tiene <%=DiasRestantes %> días para devolver . </h2>
        <div id="cuerpo_public" class="center-block" >
            <div id="fotoprod"  class="col-md-6 inline-block center-block">
              <img src="Imagenes/prd_nopic.jpg" alt="" class="imagenformulario img-rounded" >
            </div>
            <div id="descripcion" class=" inline-block col-md-6 lato fondo_indigo center-block">
             
            <p class=" text-center lato">El producto le pertenece a <%=nombre_publicador%> </p>
            <p class=" text-center lato">Puedes contactarlo en <a href="mailto:<%=email_publicador%>" target="_top"><%=email_publicador%></a> </p>
            
            </div>     
        </div>
    </div>



   <div id="Formulario_Alquiler" class="col-md-12 fondo-gris-obscuro">
   
    <div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <button id="BuscarButton" type="submit" class="btn btn-default btn-plano fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnDevolucion" required>
	Confirmar Devolución
    </button>
	</div>

    </div>


</asp:Content>



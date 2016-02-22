<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoAcciones.master" AutoEventWireup="true" CodeFile="Alquiler_Alq.aspx.cs" Inherits="Publicacion" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <div>
     <h1 class=" text-center Lato">  <%=txtTitulo%>  </h1>
     <h2 class=" text-center pacifico">Tenés que devolver el producto en <%=DiasRestantes %> días. </h2>
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

<%--    <div id="Formulario_Alquiler" class="col-md-12 fondo-gris-obscuro">
     <div class="col-md-6 inline-block color-blanco">
        
     <p>Si deceas alquilar el producto debes ingresar el rango de fechas que alquilarás el producto </p>

     <div id="inicioalquiler" class="inline-block">
         <p class="inline-block">Fecha Inicio :</p>
            
    <asp:TextBox ID="txtDateInicio" class="inline-block" runat="server"></asp:TextBox>
     <asp:RegularExpressionValidator ID="regexpDate"  runat="server" ControlToValidate="txtDateInicio"
                ErrorMessage="Por favor ingrese la fecha con formato dd/mm/aaaa" 
                ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"></asp:RegularExpressionValidator>
     </div>
     <div id="finalquiler">
       <p class="inline-block">Fecha Devolución :</p>   
     <asp:TextBox ID="txtDateFin" class="inline-block" runat="server" placeholder="Fecha de devolucion"></asp:TextBox>

      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDateFin"
                ErrorMessage="Por favor ingrese la fecha con formato dd/mm/aaaa" 
                ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"></asp:RegularExpressionValidator>
      </div>   
    </div>

    <div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <button id="BuscarButton" type="submit" class="btn btn-default btn-plano fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnAlquilar" required>
	Alquilar !
    </button>
	</div>
    </div>--%>

</asp:Content>



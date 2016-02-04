<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoAcciones.master" AutoEventWireup="true" CodeFile="ConfirmacionAlq.aspx.cs" Inherits="ConfirmacionAlq" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">
    <div class="lato center-block col-md-12">
    
    <h1>Confirmación de alquiler: <%=txtTitulo%></h1>
    <h3>Durante <%=txtDias%> desde el <%=txtInicioAlqui%> hasta el <%=txtFinalqui%></h3>
    <h4>El costo del alquiler es $<%=CostoAlqui%> + $<%=Feealqui%> por costos del servicio. </h4>
    <h4>Total a pagar $<%=Totalcost%> </h4>
    <p>Presione el boton confirmár para ingresar en el portal de pago, una vez pagado se le compartirán los datos del Publicador</p>

     <div class="lato center-block col-md-12">
        
    <div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <button id="ConfirmarButton" type="submit" class="btn btn-default btn-plano  btn-sinborde largo-80" runat="server"   onserverclick="btnConfirmar" required>
	Confirmar
    </button>
	</div>

    <div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <button id="Button1" type="submit" class="btn btn-default btn-plano  btn-sinborde largo-80" runat="server"   onserverclick="btnCancelar" required>
	Cancelar
    </button>
	</div>
    </div>

     </div>
</asp:Content>



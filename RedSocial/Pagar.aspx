<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoAcciones.master" AutoEventWireup="true" CodeFile="Pagar.aspx.cs" Inherits="Pago" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">

<div class="lato center-block col-md-12">
    
    <h1>Pago de alquiler: <%=txtTitulo%></h1>
    <h4>El costo del alquiler es $<%=CostoAlqui%> + $<%=Feealqui%> por costos del servicio. </h4>
    <h4>Total a pagar $<%=Totalcost%> </h4>
    <p>Seleccione una forma de pago para poder acreditar el pago y recibir los datos del publicador</p>

     <div class="lato center-block col-md-12">
        
    <div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <button id="PagarMLbtn" type="submit" class="btn btn-default btn-plano  btn-sinborde largo-80" runat="server"   onserverclick="btnPagarMP" required>
	Pagar MercadoPago
    </button>
	</div>

    <div class="col-md-4 inline-block espacio-arriba espacio-abajo">
    <button id="Button1" type="submit" class="btn btn-default btn-plano  btn-sinborde largo-80" runat="server"   onserverclick="btnPagarEfectivo" required>
	Pagar Efectivo
    </button>
	</div>
    </div>

     </div>
</asp:Content>


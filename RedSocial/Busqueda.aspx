<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoNormal.master" AutoEventWireup="true" CodeFile="Busqueda.aspx.cs" Inherits="Busqueda" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">

 <div id="Busqueda">
<div class=" col-md-2 inline-block text-center">
			               
	</div>
  <div class=" col-md-6 inline-block text-center">
   <asp:TextBox class="form-control quitar-float inline-block  color_indigo col-md-6" ID="txtSearchWord" name="txtSearchWord"   placeholder="Ingrese un titulo"  runat="server" required/>
			     
			                </div>

			                <div class="quitar-float inline-block text-center">
						

         <button id="BuscarButton" type="submit" class="btn btn-default btn-plano fondo_blanco btn-sinborde largo-80" runat="server"   onserverclick="btnBuscar_Click" required>
	    <span class="fa-stack fa-lg fa-2x">
							<i class="fa fa-square fa-stack-2x"></i>
							<i class="fa fa-binoculars fa-stack-1x fa-inverse"></i>
							</span>
    </button>
	</div>
</div>

    <div class="col-md-1">
    </div>
<div id="ResultadoBusqueda" class="col-md-8 inline-block text-center" >

    <asp:GridView ID="GridView1" Font-Size="9" HorizontalAlign="Center" Width ="100%" class="table table-hover" runat="server" AutoGenerateColumns="false">
    <Columns>
    <asp:BoundField DataField="Id_publicacion" HeaderText="Codigo de Publicación" Visible ="True"/>
    <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
    <asp:BoundField DataField="PrecioD" HeaderText="PrecioD" DataFormatString="${0:0.00}" />
    <asp:BoundField DataField="FechaHasta" HeaderText="Fecha Maxima" dataformatstring="{0:dd/MM/yyyy}" />
    </Columns>
    </asp:GridView>

</div>


</asp:Content>



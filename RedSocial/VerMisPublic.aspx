<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoNormal.master" AutoEventWireup="true" CodeFile="VerMisPublic.aspx.cs" Inherits="Busqueda" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">



    <div class="col-md-1">
    </div>
<div id="MisPublicaciones" class="col-md-8 inline-block text-center" >

    <asp:GridView ID="GridView1" Font-Size="9" HorizontalAlign="Center" Width ="100%" class="table table-hover" runat="server" AutoGenerateColumns="false">
    <Columns>
    <asp:BoundField DataField="Id_publicacion" HeaderText="Codigo de Publicación" Visible ="True"/>
    <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
    <asp:BoundField DataField="PrecioD" HeaderText="Precio Diario" DataFormatString="${0:0.00}" />
    <asp:BoundField DataField="PrecioS" HeaderText="Precio Semanal" DataFormatString="${0:0.00}" />
    <asp:BoundField DataField="PecioM" HeaderText="Precio Mensual" DataFormatString="${0:0.00}" />
    <asp:BoundField DataField="FechaDesde" HeaderText="Fecha Publicacion" dataformatstring="{0:dd/MM/yyyy}" />
    <asp:BoundField DataField="FechaHasta" HeaderText="Fecha Maxima" dataformatstring="{0:dd/MM/yyyy}" />
    <asp:BoundField DataField="Estado" HeaderText="Estado" />
    </Columns>
    </asp:GridView>

</div>


</asp:Content>



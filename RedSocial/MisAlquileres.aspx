<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoNormal.master" AutoEventWireup="true" CodeFile="MisAlquileres.aspx.cs" Inherits="MisAlquileres" EnableEventValidation="false" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">

    <h1>Mis Alquileres</h1>

<div id="MisAlquileres" class="col-md-8 inline-block text-center" >

    <asp:GridView ID="GridView2" Font-Size="9" 
    OnRowDataBound = "OnRowDataBound"
    onselectedindexchanged="OnSelectedIndexChanged"
    HorizontalAlign="Center" 
    Width ="100%" 
    class="table table-hover" 
    runat="server" 
    AutoGenerateColumns="false">
    <Columns>
    <asp:BoundField DataField="Id_publicacion" HeaderText="Codigo de Publicación" Visible ="True"/>
    <asp:BoundField DataField="Id_Alquiler" HeaderText="Codigo de Alquiler" Visible ="True"/>
    <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
    <asp:BoundField DataField="DiasRestantes" HeaderText="Dias Restantes" />
    <asp:BoundField DataField="Estado" HeaderText="Estado"  />
    <asp:BoundField DataField="Publicador" HeaderText="Nombre Publicador"  />
    <asp:BoundField DataField="MailPub" HeaderText="Mail Publicador"  />
    </Columns>
    </asp:GridView>

</div>


</asp:Content>


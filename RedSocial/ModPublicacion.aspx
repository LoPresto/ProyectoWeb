<%@ Page Title="" Language="C#" MasterPageFile="~/LogueadoAcciones.master" AutoEventWireup="true" CodeFile="ModPublicacion.aspx.cs" Inherits="Procesos_Publicar_Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Cuerpo" Runat="Server">

<div class="col-md-8 inline-block espacio-arriba espacio-abajo">


        <div class="lato">
               <form action="." oninput="range_control_value.value = range_control.valueAsNumber">
                <div>
                    <p>Titulo</p>
                    <asp:TextBox class="col-md-10 form-control" ID="txtTitulo" name="txtTitulo"   placeholder="Ingrese un titulo"  runat="server" required/>
                    <br />
                    <br />
                    <p>Descripcion del producto</p>
                    <asp:TextBox ID="txtDescripcion" class="col-md-10" rows="10" cols="40" runat="server" TextMode="MultiLine" required></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <hr />
                <br />
                <br />
                <br />
                <br />
                <p class="inline-block ">Fecha final de publicación:</p>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

                <asp:RegularExpressionValidator ID="regexpDate" runat="server" ControlToValidate="txtDate"
                ErrorMessage="Por favor ingrese la fecha con formato dd/mm/aaaa" 
                ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"></asp:RegularExpressionValidator>
                  <br />
                <br />
                <p lass="inline-block "> Precio de alquiler por día </p>
                 <asp:TextBox ID="numPrecio" runat="server" Columns="20" MaxLength="30" placeholder="Ingrese precio" class="form-control"></asp:TextBox> 

                <br />
                <br />
               <asp:LinkButton ID="Publicar"  Text="Publicar !" class="btn btn-primary btn-block" Height = "25%" runat="server" OnClick="btnCrearPublicacion_click" required></asp:LinkButton>
                </div>
                </form>
        </div>

    </div>

    <div class="col-md-4  espacio-arriba espacio-abajo">
    <img src="Imagenes/prd_nopic.jpg" alt="" class="imagenformulario img-rounded" >
    </div>


</asp:Content>

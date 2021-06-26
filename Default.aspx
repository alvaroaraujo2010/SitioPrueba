<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SitioPrueba._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" languaje="javascript">
        function ContarPalabra() {
            var numeroPalabras = 1; //Inicializamos la variable que contará la cantidad de veces

            var Texto = document.getElementById("<%= txtTexto.ClientID %>").value.replace(/\s\s+/g, ' ');//Se reemplazn algunos espacios
            Texto = Texto.trim();

            var textoArray = Texto.split(/\s+/);

            for (var i in textoArray) {
                if (textoArray[i] == document.getElementById("<%= txtPalabra.ClientID %>").value) //Se realiza la comparación para contar las palabras
                {
                    numeroPalabras++;
                }
            }

            alert("La palabra a buscar es: " + document.getElementById("<%= txtPalabra.ClientID %>").value + ", y está " + numeroPalabras + " veces en el texto.");
        }
    </script>

    <form id="form1" runat="server">
        <div class="container-fluid px-4">
            <br />
            <br />
            <div class="card-header">
                <i></i>
                Ingreso Información

                <table>
                    <tr>
                        <td>Ingrese Texto
                        </td>
                        <td>
                            <asp:TextBox ID="txtTexto" runat="server" TextMode="MultiLine" Height="136px" Width="446px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Palabra a buscar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtPalabra" runat="server" Width="135px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnLocal" runat="server" Text="Buscar Local" OnClick="btnLocal_Click" />
                            &nbsp;
                            <asp:Button ID="btnServicio" runat="server" Text="Buscar con Servicio" OnClick="btnServicio_Click" />
                            &nbsp;
                            <asp:Button ID="btnJavaScript" runat="server" Text="Buscar con JavaScript" OnClientClick="ContarPalabra()" />
                            &nbsp;
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</asp:Content>

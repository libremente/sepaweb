﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RicercaINT.aspx.vb" Inherits="Contratti_Anagrafica_Ricerca" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
var Uscita;
Uscita = 0;
var CFGlobale1;
var IDGlobale1;


function ImpostaValore() {
        var oggetto = dialogArguments;
        oggetto.CFGlobale = CFGlobale1;
        oggetto.IDGlobale = IDGlobale1;
        self.close(); 
    }

function $onkeydown() 
{  

if (event.keyCode==13) 
      {  
      alert('Usare il tasto <Avvia Ricerca>');
      history.go(0);
      event.keyCode=0;
      }  
}


function ChiamaRicerca() {
    var Nome;
    var Cognome;
    Nome = document.getElementById('txtNome').value;
    Cognome = document.getElementById('txtCognome').value;
    window.open('RisultatiRicercaINT.aspx?NOME=' + Nome + '&COGNOME=' + Cognome + '&CF=' + document.getElementById('txtCF').value + '&RAGSOCIALE=' + document.getElementById('txtRagione').value + '&PIVA=' + document.getElementById('txtPiva').value, 'Risultato', 'height=420,width=500');
}


</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <base target="_self"/>
		<title>Ricerca</title>
	</head>
	<body bgcolor="#ffffff">

		<form id="form1" runat="server" defaultfocus="txtCognome">
            &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="arial" Font-Size="14pt"
                ForeColor="#660000" Style="z-index: 111; left: 13px; position: absolute; top: 22px"
                Text="Ricerca"></asp:Label>
            <br />
            <br />
            <br />
            <table style="left: 1px; background-image: url(../../NuoveImm/SfondoMascheraRubrica.jpg); width: 501px;
                position: absolute; top: 2px; height: 460px; z-index: 101; background-attachment: fixed; background-repeat: no-repeat;">
                <tr>
                    <td style="width: 800px">
                        <br />
                        <span style="font-size: 14pt; color: #801f1c; font-family: Arial"><strong>&nbsp; </strong></span><br />

                        <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                            Style="z-index: 106; left: 19px; position: absolute; top: 180px">Rag. Sociale</asp:Label>
                        <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
                            Style="z-index: 106; left: 19px; position: absolute; top: 207px">P. IVA</asp:Label>
                        <asp:TextBox ID="txtPiva" runat="server" BorderStyle="Solid" BorderWidth="1px" Style="z-index: 107;
                            left: 132px; position: absolute; top: 206px" TabIndex="5"></asp:TextBox>
                        <asp:TextBox ID="txtRagione" runat="server" BorderStyle="Solid" BorderWidth="1px"
                            Style="z-index: 107; left: 132px; position: absolute; top: 179px" 
                            TabIndex="4"></asp:TextBox>
                        &nbsp;&nbsp;<br />

                        <img alt="" src="../../NuoveImm/Img_AvviaRicerca.png" 
                            
                            onclick="ChiamaRicerca();" 
                            style="position: absolute; cursor: pointer; top: 321px; left: 252px;"/><img 
                            onclick="self.close();" alt="" src="../../NuoveImm/Img_EsciCorto.png" 
                            style="cursor:pointer;position:absolute; top: 320px; left: 412px; "/></td>
                </tr>
            </table>
            <img alt="Image" src="../../ImmMaschere/alert2_ricercad.gif" style="z-index: 110; left: 311px; position: absolute;
                top: 122px" />
            &nbsp;
            						<asp:label id="Label1" runat="server" Font-Size="8pt" Font-Names="Arial" Font-Bold="False" style="z-index: 104; left: 19px; position: absolute; top: 102px">Cognome</asp:label>
									<asp:textbox id="txtCognome" tabIndex="1" runat="server" style="z-index: 105; left: 133px; position: absolute; top: 98px" BorderStyle="Solid" BorderWidth="1px"></asp:textbox>
									<asp:label id="Label2" runat="server" Font-Size="8pt" Font-Names="Arial" Font-Bold="False" style="z-index: 106; left: 19px; position: absolute; top: 127px">Nome</asp:label>
									<asp:textbox id="txtNome" tabIndex="2" runat="server" style="z-index: 107; left: 133px; position: absolute; top: 125px" BorderStyle="Solid" BorderWidth="1px"></asp:textbox>
									<asp:label id="Label4" runat="server" Font-Size="8pt" Font-Names="Arial" Font-Bold="False" style="z-index: 108; left: 19px; position: absolute; top: 156px">Codice Fiscale</asp:label>
									<asp:textbox id="txtCF" tabIndex="3" runat="server" style="z-index: 109; left: 133px; position: absolute; top: 152px" BorderStyle="Solid" BorderWidth="1px" MaxLength="16"></asp:textbox>
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
		</form>
	</body>
</html>


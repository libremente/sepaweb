﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pagina_home.aspx.vb" Inherits="ANAUT_pagina_home" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Pagina Principale</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR"/>
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		
		
<script type="text/javascript">
var Uscita;
Uscita=1;
</script>

<script type ="text/javascript">
<!--
var id,pause=0,position=0; 

function scorrevole() { 
var i,k,msg=document.getElementById('txtmessaggio').value;

k=(200/msg.length)+1;
for(i=0;i<=k;i++) msg+=' '+msg;
document.getElementById('scorrevole').value=msg.substring(position,position+100);
if(position++==200) position=0;
id=setTimeout('scorrevole()',200); } 



//-->
</script>
    
<script language="javascript" id="clientEventHandlersJS">
<!--

function DIV1_onclick() {

}

function ApriContatti1()
{
var win=null;
win=window.open('../Contatti.htm','Contatti','height=480,top=0,left=0,width=490,scrollbars=yes');
}

function ApriHelp()
{
var win=null;
//win=window.open('Help_pw.htm','Accesso','height=380,top=0,left=0,width=490,scrollbars=no');
alert('Non Disponibile!');
}
//-->
		</script>
	</head>
	<body bgColor="#f2f5f1" 
        onload="document.getElementById('txtmessaggio').style.visibilty='hidden';" 
        style="background-attachment: fixed; background-image: url(../NuoveImm/sfondocopertinaContratti1.jpg)">
		<form id="Form1" method="post" runat="server">
			&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt"
                Style="z-index: 100; left: 29px; position: absolute; top: 71px" 
                Text="VERSIONE 1.20" Font-Italic="False"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:TextBox ID="txtmessaggio" runat="server" Style="left: 193px; position: absolute;
                top: 512px; z-index: 101;" Height="10px" Width="7px" BackColor="White" 
                BorderStyle="None" ForeColor="White" TabIndex="-1"></asp:TextBox>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="ARIAL" Font-Size="8pt"
                ForeColor="#404040" Style="z-index: 102; left: 31px; position: absolute; top: 90px; width: 418px;"
                Text="Label"></asp:Label>
            &nbsp; &nbsp;&nbsp;
            <img alt="Sistemi e Soluzioni" src="../immagini/sistemiesoluzionisrl.gif" style="z-index: 111; left: 13px; position: absolute;
                top: 503px" />
            <asp:Image ID="imgEventi" runat="server" 
                style="position:absolute; top: 447px; left: 493px; cursor:pointer" 
                ImageUrl="Immagini/NewEventgif.gif" 
                Visible="False"/>
		   <%-- <p>
            <asp:Image ID="imgSegnRespinte" runat="server" 
                style="position:absolute; top: 447px; left: 151px; cursor:pointer" 
                ImageUrl="~/SEGNALAZIONI/Immagini/checkerboard.gif" 
                Visible="False" ToolTip="Segnalazioni Respinte"/>
		    </p>--%>
		    </form>
	</body>
	

</html>
﻿<%@ Reference Control="~/Dom_Richiedente.ascx" %>
<%@ Register Src="../Dom_Alloggio_ERP.ascx" TagName="Dom_Alloggio_ERP_1" TagPrefix="uc6" %>
<%@ Reference Control="~/Dom_Dichiara.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Dom_Dichiara" Src="../Dom_Dichiara.ascx" %>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="domanda.aspx.vb" Inherits="CONS_domanda" EnableSessionState="True" %>
<%@ Register Src="../Dom_Requisiti.ascx" TagName="Dom_Requisiti" TagPrefix="uc6" %>
<%@ Register Src="../Dom_Abitative_1.ascx" TagName="Dom_Abitative_1" TagPrefix="uc3" %>
<%@ Register Src="../Dom_Abitative_2.ascx" TagName="Dom_Abitative_2" TagPrefix="uc4" %>
<%@ Register Src="../Note.ascx" TagName="Note" TagPrefix="uc5" %>
<%@ Register Src="../Dom_Familiari.ascx" TagName="Dom_Familiari" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="Dom_Richiedente" Src="../Dom_Richiedente.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
var Uscita;
Uscita=0;

function $onkeydown() 
{  

if (event.keyCode==8) 
      {  
      //alert('Questo tasto non può essere usato!');
      event.keyCode=0;
      }  
}

function VisDichiarazione() {
    window.open('max.aspx?ID=<%=lIdDichiarazione%>&LE=1','','top=0,left=0,width=670,height=450,resizable=no,menubar=no,toolbar=no,scrollbars=no');
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>domanda</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR"/>
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
		<style type="text/css">.CssMaiuscolo { FONT-SIZE: 8pt; TEXT-TRANSFORM: uppercase; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 20px; FONT-VARIANT: normal }
	.CssComuniNazioni { FONT-SIZE: 8pt; TEXT-TRANSFORM: uppercase; WIDTH: 166px; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 20px; FONT-VARIANT: normal }
	.CssPresenta { FONT-SIZE: 8pt; TEXT-TRANSFORM: uppercase; WIDTH: 450px; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 20px; FONT-VARIANT: normal }
	.CssFamiAbit { FONT-SIZE: 8pt;  WIDTH: 600px; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 20px; FONT-VARIANT: normal }
	.CssProv { FONT-SIZE: 8pt; TEXT-TRANSFORM: uppercase; WIDTH: 48px; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 20px; FONT-VARIANT: normal }
	.CssIndirizzo { FONT-SIZE: 8pt; TEXT-TRANSFORM: uppercase; WIDTH: 66px; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 20px; FONT-VARIANT: normal }
	.CssLabel { FONT-SIZE: 8pt; COLOR: black; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: times; FONT-VARIANT: normal }
	.CssLblValori { FONT-SIZE: 8pt; COLOR: blue; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-FAMILY: arial; HEIGHT: 16px; FONT-VARIANT: normal }
	.CssEtichetta { ALIGNMENT: center }
		</style>
	
</head>
<script type="text/javascript" src="Funzioni.js"></script>
<script type="text/javascript">
    var win=null;
    LeftPosition=(screen.width) ? (screen.width-250)/2 :0 ;
    TopPosition=(screen.height) ? (screen.height-150)/2 :0;
    LeftPosition=LeftPosition;
    TopPosition=TopPosition;
    aa=window.open('../loading.htm','','height=150,top='+TopPosition+',left='+LeftPosition+',width=250');
</script>

<script type="text/javascript">
function Indici(){
window.open("../indici.aspx?" + document.getElementById('txtIndici').value ,"","top=0,left=0,width=490,height=450,resizable=no,menubar=no,toolbar=no,scrollbars=no");
}

function Prenotazioni(){
window.open('Prenotazioni.aspx?ID=<%=lIdDomanda%>&PG=<%=lblPG.Text%>&NOMINATIVO=<%=lblNominativo.Text%>&STATO=<%=lblStato.Text%>&CF=<%=lblCF.Text%>','','top=0,left=0,width=480,height=450,resizable=no,menubar=no,toolbar=no,scrollbars=yes');
}

</script>
	<body onload="return AggTabDom(document.getElementById('txtTab').value,document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" bgColor="#f2f5f1">
	<script type="text/javascript">
document.onkeydown=$onkeydown;
</script>
		<form id="Form1" method="post" runat="server">
            &nbsp;
            <table border="0" cellpadding="0" cellspacing="0" height="55"
                style="left: 0px; border-top-style: none; border-right-style: none;
                border-left-style: none; position: absolute; top: 0px; border-bottom-style: none; z-index: 127;"
                width="673" background="../ImmMaschere/greydomande.jpg">
                <tr>
                    <td align="left" style="width: 62px;" valign="top"></td>
                    <td style="width: 131px;" align="left" valign="top"></td>
                    <td style="width: 77px;" align="left" valign="top"></td>
                    <td style="width: 127px;" align="left" valign="top">
                    <asp:ImageButton ID="imgUscita" runat="server" 
                            ImageUrl="~/NuoveImm/Img_EsciCorto.png" 
                            style="z-index: 100; left: 376px; position: absolute; top: 15px" /></td>
                    <td style="text-align: center; width: 245px;">
                        &nbsp;
                        &nbsp;&nbsp;
                        <asp:Label ID="Label10" runat="server" Style="z-index: 100; left: 376px; position: absolute;
                            top: 430px" Width="266px" Font-Names="arial" Font-Size="8pt"></asp:Label>
                        &nbsp;
                    </td>
                    <td style="text-align: center">
                    </td>
                    <td style="text-align: center">
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <asp:imagebutton id="btnNote" style="Z-INDEX: 100; LEFT: 460px; POSITION: absolute; TOP: 391px" runat="server" ImageUrl="..\p_menu\NOTE_0.gif" Height="21px" Width="42px" CausesValidation="False" TabIndex="7" Visible="False"></asp:imagebutton>
            &nbsp;
                <asp:imagebutton id="btnAbitative2" style="Z-INDEX: 101; LEFT: 312px; POSITION: absolute; TOP: 390px" runat="server" ImageUrl="..\p_menu\ABIT2_0.gif" Height="21px" Width="76px" CausesValidation="False" TabIndex="5" Visible="False"></asp:imagebutton><asp:imagebutton id="btnAbitative1" style="Z-INDEX: 102; LEFT: 234px; POSITION: absolute; TOP: 391px" runat="server" ImageUrl="p_menu\ABIT1_0.gif" Height="21px" Width="76px" CausesValidation="False" TabIndex="4" Visible="False"></asp:imagebutton><asp:imagebutton id="btnFamiliari" style="Z-INDEX: 103; LEFT: 168px; POSITION: absolute; TOP: 399px" runat="server" ImageUrl="p_menu\FAM_0.gif" Height="21px" Width="64px" CausesValidation="False" TabIndex="3" Visible="False"></asp:imagebutton><asp:imagebutton id="btnDichiara" style="Z-INDEX: 104; LEFT: 103px; POSITION: absolute; TOP: 392px" runat="server" ImageUrl="p_menu\DICH_0.gif" Height="21px" Width="63px" CausesValidation="False" TabIndex="2" Visible="False"></asp:imagebutton><asp:label id="lblISBAR" style="Z-INDEX: 105; LEFT: 572px; POSITION: absolute; TOP: 64px" runat="server" Width="70px" BackColor="Cornsilk" BorderWidth="1px" BorderStyle="Solid" BorderColor="#FFC080" CssClass="CssLblValori" Font-Bold="True">0</asp:label><asp:label id="lblPGDic" style="Z-INDEX: 106; LEFT: 355px; POSITION: absolute; TOP: 64px" runat="server" Width="126px" BackColor="Cornsilk" BorderWidth="1px" BorderStyle="Solid" BorderColor="#FFC080" CssClass="CssLblValori">pg</asp:label><asp:label id="Label4" style="Z-INDEX: 107; LEFT: 508px; POSITION: absolute; TOP: 64px" runat="server" Height="18px" Width="60px" CssClass="CssLabel" Font-Bold="True">ISBARC/R</asp:label><asp:label id="Label3" style="Z-INDEX: 108; LEFT: 307px; POSITION: absolute; TOP: 64px" runat="server" Height="18px" Width="43px" CssClass="CssLabel" Font-Bold="True">N. Dich.</asp:label><asp:label id="Label2" style="Z-INDEX: 109; LEFT: 180px; POSITION: absolute; TOP: 63px" runat="server" Height="18px" Width="33px" CssClass="CssLabel" Font-Bold="True">Data</asp:label><asp:label id="Label1" style="Z-INDEX: 110; LEFT: 4px; POSITION: absolute; TOP: 64px" runat="server" Height="18px" Width="31px" CssClass="CssLabel" Font-Bold="True">PG N.</asp:label><asp:label id="lblPG" style="Z-INDEX: 111; LEFT: 66px; POSITION: absolute; TOP: 64px" runat="server" Width="66px" BackColor="Cornsilk" BorderWidth="1px" BorderStyle="Solid" BorderColor="#FFC080" CssClass="CssLblValori">0000000000</asp:label><asp:textbox id="txtDataPG" style="Z-INDEX: 112; LEFT: 210px; POSITION: absolute; TOP: 62px" runat="server" CssClass="CssMaiuscolo" Columns="10" MaxLength="10" Width="68px" TabIndex="1"></asp:textbox><asp:imagebutton id="btnRichiedente" style="Z-INDEX: 113; LEFT: 16px; POSITION: absolute; TOP: 392px" runat="server" ImageUrl="p_menu\RICH_0.gif" Height="21px" Width="85px" CausesValidation="False" TabIndex="1" Visible="False"></asp:imagebutton><uc1:dom_richiedente id="Dom_Richiedente1" runat="server" Visible="true"></uc1:dom_richiedente><uc1:dom_dichiara id="Dom_Dichiara1" runat="server" Visible="true"></uc1:dom_dichiara>
            <asp:Label ID="lblSPG" runat="server" BackColor="Cornsilk" BorderColor="#FFC080"
                BorderStyle="Solid" BorderWidth="1px" CssClass="CssLblValori" Style="z-index: 114;
                left: 38px; position: absolute; top: 64px" Width="26px">06-1</asp:Label>
            <asp:Label ID="Label7" runat="server" BackColor="Cornsilk" BorderColor="#FFC080"
                BorderStyle="Solid" BorderWidth="1px" CssClass="CssLblValori" Style="z-index: 115;
                left: 134px; position: absolute; top: 64px" Width="31px">F205</asp:Label>
            &nbsp;
            <uc2:Dom_Familiari ID="Dom_Familiari1" runat="server" Visible="true" />
            <uc3:Dom_Abitative_1 ID="Dom_Abitative_1_1" runat="server" Visible="true" />
            <uc4:Dom_Abitative_2 ID="Dom_Abitative_2_1" runat="server" Visible="true" />
            <uc5:Note ID="Note1" runat="server" Visible="true" />
            &nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="btnRequisiti" runat="server" CausesValidation="False" Height="21px"
                ImageUrl="..\p_menu\REC_0.gif" Style="z-index: 116; left: 391px; position: absolute;
                top: 391px" Width="66px" TabIndex="6" Visible="False" />
            <uc6:Dom_Requisiti ID="Dom_Requisiti1" runat="server" Visible="true" /><asp:ImageButton ID="imgAttendi" runat="server" ImageUrl="../IMG/A1.gif" style="z-index: 117; left: 295px; position: absolute; top: 247px" Visible="False" />
            <asp:TextBox ID="txtL" runat="server" Style="z-index: 118; left: 584px; position: absolute;
                top: 108px" Width="33px"></asp:TextBox>
            <asp:Label ID="lblNominativo" runat="server" Style="z-index: 120; left: 533px; position: absolute;
                top: 86px" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="lblStato" runat="server" Style="z-index: 121; left: 575px; position: absolute;
                top: 85px" Visible="False"></asp:Label>
            <asp:Label ID="lblCF" runat="server" Style="z-index: 122; left: 504px; position: absolute;
                top: 86px" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <asp:TextBox ID="txtTab" runat="server" Style="left: 567px; position: absolute;
                top: 14px; z-index: 123;" Width="6px" Height="13px"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="lblIdDomanda" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="lblIdDichiarazione" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="ProgrComponente" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="lblBando" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="lblIdBando" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                Font-Names="Arial" Font-Size="8pt" Height="31px" Width="368px" Visible="False" style="z-index: 124; left: 257px; position: absolute; top: 204px">
                <PagerStyle Mode="NumericPages" />
                <HeaderStyle BackColor="PapayaWhip" Font-Bold="True" Font-Names="Arial" Font-Size="8pt" />
                <Columns>
                    <asp:BoundColumn DataField="DATA_NASCITA" HeaderText="DATA"></asp:BoundColumn>
                    <asp:BoundColumn DataField="PERC_INVAL" HeaderText="INVALIDITA"></asp:BoundColumn>
                    <asp:BoundColumn DataField="INDENNITA_ACC" HeaderText="ACC"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>
            <img id="i1" src="../p_menu/RICH_0.gif" style="z-index: 128; left: 10px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('1',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            <img id="i2" src="../p_menu/DICH_0.gif" style="z-index: 129; left: 97px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('2',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            <img id="i3" src="../p_menu/FAM_0.gif" style="z-index: 130; left: 162px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('3',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            <img id="i4" src="../p_menu/ABIT1_0.gif" style="z-index: 131; left: 228px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('4',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            <img id="i5" src="../p_menu/ABIT2_0.gif" style="z-index: 132; left: 306px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('5',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            <img id="i6" src="../p_menu/REC_0.gif" style="z-index: 133; left: 385px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('6',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            <img id="i7" src="../p_menu/NOTE_0.gif" style="z-index: 134; left: 454px; position: absolute;
                top: 87px" language="javascript" onclick="return AggTabDom('7',document.getElementById('ric').style,document.getElementById('dic').style,document.getElementById('fam').style,document.getElementById('abuno').style,document.getElementById('abdue').style,document.getElementById('req').style,document.getElementById('not').style);" />
            &nbsp;&nbsp;
            <asp:TextBox ID="txtIndici" runat="server" Style="z-index: 125; left: 16px; position: absolute;
                top: 399px"></asp:TextBox>
                        <asp:Label ID="LBLENTE" runat="server" BackColor="#C0FFC0" BorderStyle="Solid" BorderWidth="1px"
                            Font-Bold="True" Font-Names="ARIAL" Font-Size="8pt" ForeColor="#0000C0" Style="z-index: 126;
                            left: 10px; position: absolute; top: 429px" Text="VISUALIZZA INDICI" ToolTip="Ente che ha inserito la domanda"
                            Visible="False" Width="201px"></asp:Label>
            &nbsp;
            <img src="../NuoveImm/Img_VisDichiarazione_Grande.png" id="btnVisDichiarazione" 
                language="javascript" onclick="VisDichiarazione()" 
                style="cursor: pointer; z-index: 135; left: 4px; position: absolute; top: 14px;" /><img 
                src="../NuoveImm/Img_IndiciGrande.png" id="IMG1" language="javascript" 
                onclick="Indici()" 
                style="cursor: pointer; z-index: 136; left: 144px; position: absolute; top: 16px;" />
                    <img src="../NuoveImm/Img_Appuntamento.png" id="Img2" 
                language="javascript" onclick="Prenotazioni()" 
                style="cursor: pointer; z-index: 137; left: 230px; position: absolute; top: 16px;" />&nbsp;
            &nbsp;&nbsp;
            <asp:Label ID="LBLaNNOsIT" runat="server" BackColor="#FFE0C0" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="ARIAL" Font-Size="8pt" ForeColor="#0000C0" Style="z-index: 126;
                left: 218px; position: absolute; top: 429px" ToolTip="Ente che ha inserito la domanda"
                Visible="False" Width="149px"></asp:Label>
            <asp:HiddenField ID="txtI" runat="server" />
        </form>
	</body>
	<script type="text/javascript">
	document.getElementById('txtIndici').style.visibility='hidden';
	document.getElementById('txtL').style.visibility='hidden';
	if (document.getElementById('txtL').value=='1') {
	    document.getElementById('btnVisDichiarazione').style.visibility='hidden';
	}
	
	if (document.getElementById('txtI').value=='0') {
	    document.getElementById('Img2').style.visibility='hidden';
	}
	aa.close();
	</script>
</html>

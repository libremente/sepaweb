﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RisultatoMavAnomalie.aspx.vb"
    Inherits="Contabilita_RisultatoMavAnomalie" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RisultatoRicercaD</title>
    <meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
    <meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <script type="text/javascript">
        var Uscita;
        Uscita = 0;
        var Selezionato;
        function IMG1_onclick() {
        }
    </script>
</head>
<body style="background-image: url(../NuoveImm/SfondoMascheraContratti.jpg); width: 770px;">
    <form id="form1" runat="server">
    <table style="width: 100%;" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 100%">
                <asp:Label ID="Label1" runat="server" Text="Elenco Anomalie" Font-Bold="True" 
                    Font-Names="Arial" Font-Size="14pt" ForeColor="Maroon"></asp:Label>
                &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="14pt" 
                    Text="Label" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                <br /><br />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 100%;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 80%">
                                        <div style="width: 100%; overflow: auto; height: 420px;">
                                            <asp:DataGrid ID="DataGrid1" runat="server" Font-Names="Arial" AutoGenerateColumns="False"
                                                Font-Size="8pt" BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                Font-Strikeout="False" Font-Underline="False" GridLines="None" Width="100%" BorderColor="Navy"
                                                BorderStyle="Solid" BorderWidth="1px">
                                                <HeaderStyle Font-Size="8pt" Font-Names="Arial" Font-Bold="True" BackColor="#F2F5F1"
                                                    Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                                                    ForeColor="Navy" Wrap="False" HorizontalAlign="Center"></HeaderStyle>
                                                <Columns>
                                                    <asp:BoundColumn DataField="DATA_ORA" HeaderText="DATA ORA">
                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                            Font-Underline="False" HorizontalAlign="Center" Wrap="False" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="FILE" HeaderText="FILE"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DESCRIZIONE" HeaderText="DESCRIZIONE"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="BOLLETTA" HeaderText="BOLLETTA"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="IMPORTO" HeaderText="IMPORTO">
                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                            Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DATA_PAGAMENTO" HeaderText="DATA PAGAMENTO">
                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                            Font-Underline="False" HorizontalAlign="Center" Wrap="False" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DATA_VALUTA" HeaderText="DATA VALUTA">
                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                            Font-Underline="False" HorizontalAlign="Center" Wrap="False" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="NUMERO_CONTO" HeaderText="N. CONTO">
                                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" 
                                                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" 
                                                            Wrap="False" />
                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" 
                                                            Wrap="False" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <PagerStyle Mode="NumericPages"></PagerStyle>
                                                <FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" Wrap="False" />
                                                <AlternatingItemStyle BackColor="Gainsboro" />
                                            </asp:DataGrid>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td style="width: 20%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 20%">
                                        <center>
                                            <asp:ImageButton ID="btnExport" runat="server" ImageUrl="../NuoveImm/Img_Export_XLS.png"
                                                TabIndex="2" ToolTip="Esporta in Excel" />
                                        </center>
                                    </td>
                                    <td style="width: 20%">
                                        <center>
                                            <asp:ImageButton ID="btnRicerca" runat="server" ImageUrl="../NuoveImm/Img_NuovaRicerca.png"
                                                ToolTip="Nuova Ricerca" /></center>
                                    </td>
                                    <td style="width: 20%">
                                        <center>
                                            <asp:ImageButton ID="btnAnnulla" runat="server" ImageUrl="../NuoveImm/Img_Home.png"
                                                ToolTip="Home" /></center>
                                    </td>
                                    <td style="width: 20%">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        document.getElementById('dvvvPre').style.visibility = 'hidden';
    </script>
    </form>
</body>
</html>
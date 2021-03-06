﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StampaPFserv.aspx.vb" Inherits="CICLO_PASSIVO_CicloPassivo_PAGAMENTI_StampaPFserv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CicloPassivo.css" rel="stylesheet" type="text/css" />
    <script src="../../CicloPassivo.js" type="text/javascript"></script>
    <title>Stampa Piano Finanziario per Servizi</title>
</head>
<body class="sfondo">
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <table width="100%">
        <tr>
            <td style="width: 100%">
                <table width="100%">
                    <tr>
                        <td style="width: 10%">
                            <telerik:RadButton ID="btnExport" runat="server" Style="top: 0px; left: 0px" Text="Export XLS"
                                ToolTip="Esporta in Excel" />
                        </td>
                        <td style="width: 10%">
                            <telerik:RadButton ID="btnStampa" runat="server" Style="top: 0px; left: 0px" Text="Stampa"
                                ToolTip="Stampa" />
                        </td>
                        <td style="width: 70%">
                            &nbsp;
                        </td>
                        <td style="width: 10%; text-align: right">
                            <telerik:RadButton ID="btnEsci" runat="server" Style="top: 0px; left: 0px" Text="Esci"
                                ToolTip="Esci" OnClientClicking="function(sender, args){self.close();}" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; text-align: center;">
                <asp:Label ID="Errore" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="11pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; text-align: center">
                <asp:Label ID="Titolo2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <asp:DataGrid runat="server" ID="DataGrid2" AutoGenerateColumns="False" CellPadding="1"
                    Font-Names="Arial" Font-Size="8pt" ForeColor="#000000" GridLines="None" CellSpacing="1"
                    Width="100%">
                    <AlternatingItemStyle BackColor="#DDDDDD" ForeColor="#000000" />
                    <Columns>
                        <asp:BoundColumn DataField="DESCRIZIONE" HeaderText="SERVIZIO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Left" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="IMPORTO_PRENOTATO" HeaderText="IMPORTO PRENOTATO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="IMPORTO_CONSUNTIVATO" HeaderText="IMPORTO CONSUNTIVATO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="RITENUTE_CONSUNTIVATE" HeaderText="RITENUTE DI LEGGE CONSUNTIVATE">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="IMPORTO_CERTIFICATO" HeaderText="IMPORTO CERTIFICATO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                    </Columns>
                    <EditItemStyle BackColor="#999999" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Italic="False"
                        Font-Overline="False" Font-Size="9pt" Font-Strikeout="False" Font-Underline="False"
                        HorizontalAlign="Center" />
                    <ItemStyle BackColor="#FFFFFF" ForeColor="#000000" />
                    <PagerStyle BackColor="#507CD1" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#000000" />
                </asp:DataGrid>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 100%; text-align: center">
                <asp:Label ID="Titolo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="12pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <asp:DataGrid runat="server" ID="DataGrid1" AutoGenerateColumns="False" CellPadding="1"
                    Font-Names="Arial" Font-Size="8pt" ForeColor="#000000" GridLines="None" CellSpacing="1"
                    Width="100%">
                    <AlternatingItemStyle BackColor="#DDDDDD" ForeColor="#000000" />
                    <Columns>
                        <asp:BoundColumn DataField="CODICE" HeaderText="CODICE">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Left" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="DESCRIZIONE" HeaderText="SERVIZIO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Left" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="IMPORTO_PRENOTATO" HeaderText="IMPORTO PRENOTATO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="IMPORTO_CONSUNTIVATO" HeaderText="IMPORTO CONSUNTIVATO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="RITENUTE_CONSUNTIVATE" HeaderText="RITENUTE DI LEGGE CONSUNTIVATE">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="IMPORTO_CERTIFICATO" HeaderText="IMPORTO CERTIFICATO">
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                Font-Underline="False" HorizontalAlign="Right" />
                        </asp:BoundColumn>
                    </Columns>
                    <EditItemStyle BackColor="#999999" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Italic="False"
                        Font-Overline="False" Font-Size="9pt" Font-Strikeout="False" Font-Underline="False"
                        HorizontalAlign="Center" />
                    <ItemStyle BackColor="#FFFFFF" ForeColor="#000000" />
                    <PagerStyle BackColor="#507CD1" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#000000" />
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="FIN" Value="0" />
    </form>
    <script language="javascript" type="text/javascript">
        if (document.getElementById('FIN').value == '0') {
            window.focus();
            self.focus();
        }
        document.getElementById('divLoading').style.visibility = 'hidden';
    </script>
</body>
</html>

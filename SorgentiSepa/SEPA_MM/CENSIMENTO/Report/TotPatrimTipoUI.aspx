﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TotPatrimTipoUI.aspx.vb"
    Inherits="CENSIMENTO_Report_TotPatrimTipoUI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tot. Patrimoniali per tipo UI</title>
    <style type="text/css">
        .titoli_tabella
        {
            font-size: 8pt;
            font-family: Arial;
            font-weight: bold;
            color: White;
            width: 100%;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td style="text-align: left; height: 21px;">
                    <span style="font-family: Arial"><strong>
                        <asp:ImageButton ID="btnExport" runat="server" ImageUrl="../../NuoveImm/Img_ExportExcel.png"
                            TabIndex="2" ToolTip="Esporta in Excel" />
                    </strong></span>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <span style="font-family: Arial"><strong style="text-align: center">Totalizzazioni patrimoniali
                        per tipo UI </strong></span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTot" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="10pt"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
<div style="width:inherit;">
    <table cellpadding="1" cellspacing="0" bgcolor="#507CD1" width="1201px" border="1px">
        <tr>
            <td rowspan="3" style="width: 12%">
                <asp:Label ID="Label1" runat="server" CssClass="titoli_tabella">COMPLESSO</asp:Label>
            </td>
            <td rowspan="3" style="width: 16%">
                <asp:Label ID="Label2" runat="server" CssClass="titoli_tabella">INDIRIZZO: via e num. civico</asp:Label>
            </td>
            <td rowspan="3" style="width: 6%">
                <asp:Label ID="Label3" runat="server" CssClass="titoli_tabella">EDIFICIO</asp:Label>
            </td>
            <%--<td style="width: 650px" align="center" colspan="10">--%>
            <td style="width: 30%" align="center" colspan="12">
                <asp:Label ID="lbltabella" runat="server" CssClass="titoli_tabella">TIPOLOGIA UNITA' IMMOBILIARI</asp:Label>
            </td>
            <%--<td style="width: 120px" colspan="2" rowspan="2">--%>
            <td style="width: 6%" align="center" colspan="2" rowspan="2">
                <asp:Label ID="Label4" runat="server" CssClass="titoli_tabella">TOTALI</asp:Label>
            </td>
        </tr>
        <tr>
            <%--<td style="width: 120px" colspan="2">--%>
            <td style="width: 6%" colspan="2">
                <asp:Label ID="Label5" runat="server" CssClass="titoli_tabella">ALLOGGI</asp:Label>
            </td>
            <td style="width: 6%" colspan="2">
                <asp:Label ID="Label6" runat="server" CssClass="titoli_tabella">PORTINERIE</asp:Label>
            </td>
            <td style="width: 6%" colspan="2">
                <asp:Label ID="Label7" runat="server" CssClass="titoli_tabella">DEPOSITI</asp:Label>
            </td>
            <td style="width: 6%" colspan="2">
                <asp:Label ID="Label8" runat="server" CssClass="titoli_tabella">NEGOZI</asp:Label>
            </td>
            <td style="width: 6%" colspan="2">
                <asp:Label ID="Label9" runat="server" CssClass="titoli_tabella">LABORATORI</asp:Label>
            </td>
            <td style="width: 6%" colspan="2">
                <asp:Label ID="Label25" runat="server" CssClass="titoli_tabella">ALTRE</asp:Label>
            </td>
        </tr>
        <tr>
            <%--<td style="width: 60px">--%>
            <td style="width: 2%">
                <asp:Label ID="Label10" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label11" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
            <td style="width: 2%">
                <asp:Label ID="Label12" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label13" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
            <td style="width: 2%">
                <asp:Label ID="Label14" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label15" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
            <td style="width: 2%">
                <asp:Label ID="Label16" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label17" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
            <td style="width: 2%">
                <asp:Label ID="Label18" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label19" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
            <td style="width: 2%">
                <asp:Label ID="Label20" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label21" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
            <td style="width: 2%">
                <asp:Label ID="Label23" runat="server" CssClass="titoli_tabella">Num.</asp:Label>
            </td>
            <td style="width: 4%">
                <asp:Label ID="Label24" runat="server" CssClass="titoli_tabella">MQ</asp:Label>
            </td>
        </tr>
    </table>

    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" BorderWidth="1px"
        CellPadding="1" ForeColor="#333333" Width="1201px" BorderColor="Gray" BorderStyle="Solid"
        ShowHeader="False">
        <AlternatingItemStyle BackColor="White" BorderStyle="None" />
        <Columns>
            <asp:BoundColumn DataField="ID_COMPLESSO" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="DENOMINAZIONE" HeaderText="COMPLESSO">
                <HeaderStyle Width="12%" />
                <ItemStyle Width="12%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" />
            </asp:BoundColumn>
            <asp:BoundColumn DataField="INDIRIZZO" HeaderText="INDIRIZZO">
                <HeaderStyle Width="16%" />
                <ItemStyle Width="16%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="COD_EDIFICIO" HeaderText="EDIFICIO">
                <HeaderStyle Width="6%" />
                <ItemStyle Width="6%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_ALLOGGI" HeaderText="NUM.">
                <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_ALLOGGI" HeaderText="MQ">
                <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_PORTINERIE" HeaderText="NUM">
                <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_PORTINERIE" HeaderText="MQ">
                <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_DEPOSITI" HeaderText="NUM.">
                <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_DEPOSITI" HeaderText="MQ">
                <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_NEGOZI" HeaderText="NUM.">
                <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_NEGOZI" HeaderText="MQ">
                <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_LABORATORI" HeaderText="NUM.">
                <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_LABORATORI" HeaderText="MQ">
                <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_ALTRE" HeaderText="NUM.">
            <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_ALTRE" HeaderText="MQ">
            <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="N_TOTALE" HeaderText="NUM.">
                <HeaderStyle Width="2%" />
                <ItemStyle Width="2%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="MQ_TOTALE" HeaderText="MQ">
                <HeaderStyle Width="4%" />
                <ItemStyle Width="4%" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" Wrap="False" 
                    HorizontalAlign="Right"></ItemStyle>
            </asp:BoundColumn>
        </Columns>
        <EditItemStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Names="ARIAL" Font-Size="7pt"
            ForeColor="White" />
        <ItemStyle BackColor="White" Font-Names="arial" Font-Size="8pt" BorderStyle="None" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataGrid>
</div>
    </form>
    <script language="javascript" type="text/javascript">
        document.getElementById('dvvvPre').style.visibility = 'hidden';
        
    </script>
</body>
</html>
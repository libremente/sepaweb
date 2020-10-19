﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EventiIncassi.aspx.vb" Inherits="Contratti_Pagamenti_EventiIncassi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">

    <title>Eventi IncassiExtramav</title>
    		<script type="text/javascript" src="HGridScript.js"></script>


    <style type="text/css">
        .style1
        {
            font-family: Arial;
        }
        .style2
        {
            font-family: Arial;
            font-size: 8pt;
        }
    </style>


</head>
<body >
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
    
        <asp:Label ID="lblTitolo" runat="server" BorderStyle="Solid" BorderWidth="0px" 
                    
                    Style="font-size: 11pt;
            z-index: 100; left: 0px; font-family: Arial; position: static; top: 0px; text-align: center;" Text="Label"
            Width="100%" Font-Bold="True" ForeColor="Red" Font-Overline="False" 
                    Font-Underline="True"></asp:Label>
                    </td>
                    </tr>
        <tr>
            <td class="style2">
    
                <asp:Image ID="Image1" runat="server" ImageUrl="~/NuoveImm/Img_Q_rosso.png" />
&nbsp;<span class="style2"><strong>= INCASSO ANNULLATO</strong></span></td>
                    </tr>
                            <tr>
            <td class="style2">

        <asp:DataGrid ID="DataGrid1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            BackColor="White" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Names="Arial"
            Font-Overline="False" Font-Size="8pt" Font-Strikeout="False" Font-Underline="False"
            PageSize="1" Style="table-layout: auto; z-index: 101; left: 16px; clip: rect(auto auto auto auto);
            direction: ltr; top: 200px; border-collapse: separate" Width="100%" 
            BorderColor="#E7E7FF" BorderStyle="None" CellPadding="3" GridLines="Horizontal">
            <FooterStyle Wrap="False" BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <EditItemStyle Wrap="False" />
            <SelectedItemStyle Font-Bold="True" Wrap="False" BackColor="#738A9C" 
                ForeColor="#F7F7F7" />
            <PagerStyle Position="TopAndBottom" Visible="False" Wrap="False" 
                BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" 
                Mode="NumericPages" />
            <AlternatingItemStyle BackColor="#F7F7F7" Wrap="False" />
            <ItemStyle Wrap="False" BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:HyperLinkColumn Text="+">
                    <ItemStyle Font-Bold="True" Font-Italic="False" Font-Names="Arial" 
                        Font-Overline="False" Font-Size="10pt" Font-Strikeout="False" 
                        Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:HyperLinkColumn>
                <asp:BoundColumn DataField="DATA_ORA" HeaderText="DATA ORA EVENTO"></asp:BoundColumn>
                <asp:BoundColumn DataField="OPERATORE" HeaderText="OPERATORE"></asp:BoundColumn>
                <asp:BoundColumn DataField="COD_CAF" HeaderText="ENTE"></asp:BoundColumn>
                <asp:BoundColumn DataField="DATA_PAGAMENTO" HeaderText="DATA PAGAMENTO">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="TIPO" HeaderText="TIPOLOGIA"></asp:BoundColumn>
                <asp:BoundColumn DataField="MOTIVO_PAGAMENTO" HeaderText="MOTIVO">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="IMPORTO" HeaderText="TOTALE €.">
                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" 
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" 
                        Wrap="False" />
                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Right" 
                        Wrap="False" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ID_OPERATORE" HeaderText="ID_OPERATORE" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="FL_ANNULLATA" HeaderText="FL_ANNULLATO" 
                    Visible="False"></asp:BoundColumn>
            </Columns>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                ForeColor="#F7F7F7" Wrap="False" />
        </asp:DataGrid>
        <br />
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="LabelPostBack" runat="server" Font-Names="Tahoma" 
                    Font-Size="8pt" Width="100%"></asp:Label>
            </td>
        </tr>
    </table>
    <div style="DISPLAY: block; VISIBILITY: visible">
        <asp:TextBox ID="txtExpandedDivs" runat="server" Font-Names="Tahoma" 
            Font-Size="8pt" Width="0px" Height="0px" Visible="False"></asp:TextBox>
    </div>
    </form>
</body>
</html>
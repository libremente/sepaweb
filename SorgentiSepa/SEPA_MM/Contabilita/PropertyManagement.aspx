﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PropertyManagement.aspx.vb" Inherits="Contratti_Report_PropertyManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Consistenze Patrimoniali - Oneri</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 396px">
        &nbsp;&nbsp;
        <asp:Label ID="lblErrore" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="8pt"
            ForeColor="Red" Height="16px" Style="z-index: 104; left: 19px; position: absolute;
            top: 584px" Visible="False" Width="525px"></asp:Label>
        &nbsp;&nbsp;
        <table width="100%">
            <tr>
                <td style="text-align: center">
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="14pt"
            Style="z-index: 100; left: 337px; top: 11px" Width="763px">Compenso per il Property Management</asp:Label></td>
            </tr>
        </table>
        <asp:ImageButton ID="ImgBtnExport" runat="server" ImageUrl="~/Contabilita/IMMCONTABILITA/Img_Export_XLS.png" /><br />
        <br />
        <asp:Label ID="TBL_PROP_MANAGE" runat="server" Font-Names="ARIAL" 
            Font-Size="8pt" tabIndex="25" Width="98%"></asp:Label>
        <br />
        <br />
    
    </div>
    </form>
        <script  language="javascript" type="text/javascript">
    document.getElementById('dvvvPre').style.visibility='hidden';
    </script>
</body>
</html>
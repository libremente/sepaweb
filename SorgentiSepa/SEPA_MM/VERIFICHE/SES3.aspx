﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SES3.aspx.vb" Inherits="AMMSEPA_Controllo_Esegui" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Esegui</title>
    </head>
<body>

    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="CONFERMA" />
        <br />
    
    </div>
    <asp:TextBox ID="TextBox2" runat="server" Height="387px" TextMode="MultiLine" 
        Visible="False" Width="100%"></asp:TextBox>
    <br />
    <asp:Button ID="Button2" runat="server" Text="ESEGUI" Visible="False" />
    &nbsp;<asp:Button ID="Button3" runat="server" Text="COMMIT" Visible="False" />
    </form>
</body>
</html>
﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CreaLettere2.aspx.vb" Inherits="Contratti_Morosita_CreaLettere" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crea Lettere2</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="overflow: auto; height: 300px">
    
    </div>
        <script  language="javascript" type="text/javascript">
                document.getElementById('dvvvPre').style.visibility='hidden';
    </script>
    
    <asp:HiddenField ID="causalepagamento" runat="server" />
    <asp:HiddenField ID="idcontratto" runat="server" />
    <asp:HiddenField ID="idunita" runat="server" />
    </form>
      
<p>
    &nbsp;
    &nbsp;&nbsp;
        <img style="cursor:pointer" onclick="self.close();" id="imgEsci" alt="esci" src="../NuoveImm/Img_EsciCorto.png" /></p>      
</body>
</html>
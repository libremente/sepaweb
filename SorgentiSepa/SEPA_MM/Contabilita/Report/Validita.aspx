﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Validita.aspx.vb" Inherits="Contabilita_Report_Validita" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Gestione Categorie/Capitoli</title>
    <script type="text/javascript">
        function modifica(id) {
            location.replace('NuovaValidita.aspx?id=' + id);
        }
        function elimina(id) {
            var chiediConferma = window.confirm('Questa operazione eliminerà definitivamente questo abbinamento categoria-capitolo. Vuoi continuare?');
            if (chiediConferma) {
                document.getElementById('HiddenFieldId').value = id;
                document.getElementById('ButtonElimina').click();
            }
        }
    </script>
</head>
<body style="background-image: url(../../NuoveImm/SfondoMascheraContratti.jpg);">
    <form id="form1" runat="server">
    <div style="height: 10px;">
        <br />
    </div>
    <div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Label ID="Label1" Text="Gestione Categorie/Capitoli" runat="server" Font-Bold="True" Font-Names="Arial"
                        Font-Size="14pt" ForeColor="Maroon" />
                </td>
            </tr>
        </table>
        <div style="height: 15px;">
        </div>
        <div style="height: 430px; overflow: auto;">
            <asp:DataGrid ID="DataGrid1" runat="server" CellPadding="2" Font-Bold="False" Font-Italic="False"
                Font-Names="Arial" Font-Overline="False" Font-Size="8pt" Font-Strikeout="False"
                Font-Underline="False" ForeColor="#333333" GridLines="None" Width="97%" CellSpacing="2"
                AutoGenerateColumns="False">
                <ItemStyle BackColor="#EFF3FB" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                <AlternatingItemStyle BackColor="White" />
                <Columns>
                    <asp:BoundColumn DataField="TIPO" HeaderText="CATEGORIA" HeaderStyle-Width="15%">
                        <HeaderStyle Width="15%"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="VALIDITA_DA" HeaderText="VALIDITA DA" Visible="true"
                        HeaderStyle-Width="15%">
                        <HeaderStyle Width="15%"></HeaderStyle>
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="VALIDITA_A" HeaderText="VALIDITA A" Visible="true" HeaderStyle-Width="15%">
                        <HeaderStyle Width="15%"></HeaderStyle>
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="CAPITOLO" HeaderText="CAPITOLO" Visible="true" HeaderStyle-Width="15%">
                        <HeaderStyle Width="15%"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="USO" HeaderText="UTILIZZO UI" Visible="true" HeaderStyle-Width="15%">
                        <HeaderStyle Width="15%"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="COMPETENZA" HeaderText="COMPETENZA" Visible="true" HeaderStyle-Width="15%">
                        <HeaderStyle Width="15%"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ELIMINA" HeaderText="" Visible="true" HeaderStyle-Width="5%">
                        <HeaderStyle Width="5%"></HeaderStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false"></asp:BoundColumn>
                </Columns>
                <EditItemStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Red" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Names="Arial" Font-Size="8pt"
                    ForeColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" HorizontalAlign="Center" />
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataGrid>
        </div>
        <div style="height: 10px;">
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="width: 70%">
                </td>
                <td style="width: 10%">
                    &nbsp;
                </td>
                <td style="width: 10%">
                    <asp:ImageButton ID="ImageButtonAggiungiCapitolo" runat="server" ToolTip="Aggiungi"
                        ImageUrl="../../NuoveImm/NewAggiungi.png" />
                </td>
                <td style="width: 10%">
                    <asp:ImageButton ID="ImageButtonEsci" runat="server" ToolTip="Esci" ImageUrl="../../NuoveImm/newEsci.png" />
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField runat="server" ID="HiddenFieldIdModifica" Value="" />
    <asp:HiddenField runat="server" ID="HiddenFieldId" Value="" />
    <asp:Button ID="ButtonElimina" runat="server" Text="" Style="display: none;" />
    </form>
</body>
</html>

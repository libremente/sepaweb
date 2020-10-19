﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Dic_Patrimonio_VSA.ascx.vb" Inherits="Dic_Patrimonio" %>

<script type="text/javascript" src="Funzioni.js"></script>
<script type="text/javascript">
<!--

function MyDialogArguments2()
{
    this.Sender = null;
    this.StringValue = "";
}


function AggiungiPatrimonio() {
dialogArgs = new MyDialogArguments2();
dialogArgs.StringValue = '';
dialogArgs.Sender = window;

mioval='';
obj1 = document.getElementById('Dic_Nucleo1_ListBox1');
for (i=0;i<=obj1.length-1;i++)
{   
str=obj1.options[i].text;
str1=obj1.options[i].value;
mioval = mioval + str.substring(0, 51) + ';' + str1 + '!';
if (i == 9) { i = obj1.length - 1; }
}

window.showModalDialog("com_patrimonio.aspx?OP=0&COMPONENTE=" + mioval, window, 'status:no;dialogWidth:433px;dialogHeight:300px;dialogHide:true;help:no;scroll:no');
}

function ModificaPatrimonio() {
obj1=document.getElementById('Dic_Patrimonio1_ListBox1');
if (obj1.selectedIndex==-1)
    {  
     alert('Selezionare una riga dalla lista!');
    }
else
{
    mioval='';
    obj2=document.getElementById('Dic_Nucleo1_ListBox1');
    for (i=0;i<=obj2.length-1;i++)
    {   
    str=obj2.options[i].text;
    str1=obj2.options[i].value;
    mioval=mioval + str.substring(0,51)+ ';' + str1 + '!';
    }

    str=obj1.options[obj1.selectedIndex].text;
    
    
    abi=str.substring(26,53);
    cab=str.substring(26,1);
    cin=str.substring(26,1);
    //cab=str.substring(32,37);
    //cin=str.substring(38,39);
    //inter=str.substring(40,70);
    inter=str.substring(54,70);
    imp=str.substring(71,79);
    nome=obj1.options[obj1.selectedIndex].value;
    window.showModalDialog("com_patrimonio.aspx?OP=1&RI=" + obj1.selectedIndex + "&COMPONENTE=" + mioval + "&COMP=" + nome + "&ABI=" + abi + "&CAB=" + cab + "&CIN=" + cin + "&INT=" + inter + "&IMP=" + imp,'','status:no;dialogWidth:433px;dialogHeight:300px;dialogHide:true;help:no;scroll:no');
}
}

function AggiungiPatrimonioI() {

    dialogArgs = new MyDialogArguments2();
    dialogArgs.StringValue = '';
    dialogArgs.Sender = window;

    mioval = '';
    obj1 = document.getElementById('Dic_Nucleo1_ListBox1');
    for (i = 0; i <= obj1.length - 1; i++) {
        str = obj1.options[i].text;
        str1 = obj1.options[i].value;
        mioval = mioval + str.substring(0, 51) + ';' + str1 + '!';
        if (i == 9) { i = obj1.length - 1; }
    }

    window.showModalDialog("com_patrimonioI.aspx?OP=0&COMPONENTE=" + mioval + "&ANNOREDD=" + document.getElementById('Dic_Patrimonio1_annoRedd').value, window, 'status:no;dialogWidth:433px;dialogHeight:460px;dialogHide:true;help:no;scroll:no');
}

function ModificaPatrimonioI() {
    obj1 = document.getElementById('Dic_Patrimonio1_ListBox2');
    if (obj1.selectedIndex == -1) {
        alert('Selezionare una riga dalla lista!');
    }
    else {
        mioval = '';
        obj2 = document.getElementById('Dic_Nucleo1_ListBox1');
        for (i = 0; i <= obj2.length - 1; i++) {
            str = obj2.options[i].text;
            str1 = obj2.options[i].value;
            mioval = mioval + str.substring(0, 51) + ';' + str1 + '!';
        }

        str = obj1.options[obj1.selectedIndex].text;


        tipo = str.substring(26, 46);
        perc = str.substring(47, 54);
        catastale = str.substring(55, 58);
        rendita = str.substring(59,67);

        valore = str.substring(71,79);
        mutuo = str.substring(83,95);
        //res = str.substring(78, 80);
        res = '  ';
        
        comune = str.substring(99, 119);
        vani = str.substring(120,122);
        sup = str.substring(123,130);
        pie = str.substring(131,137);


        nome = obj1.options[obj1.selectedIndex].value;
        window.showModalDialog("com_patrimonioI.aspx?OP=1&RI=" + obj1.selectedIndex + "&COMPONENTE=" + mioval + "&ANNOREDD=" + document.getElementById('Dic_Patrimonio1_annoRedd').value + "&COMP=" + nome + "&TIPO=" + tipo + "&PER=" + perc + "&RENDITA=" + rendita + "&VAL=" + valore + "&MU=" + mutuo + "&RES=" + res + "&SUP=" + sup + "&VANI=" + vani + "&comune=" + comune + "&CATASTALE=" + catastale + "&PIE=" + pie, '', 'status:no;dialogWidth:433px;dialogHeight:460px;dialogHide:true;help:no;scroll:no');
    }
}
// -->
</script>

<div id="pat" style="border-right: lightsteelblue 1px solid; border-top: lightsteelblue 1px solid;
    z-index: 200; left: 10px; border-left: lightsteelblue 1px solid; width: 641px;
    border-bottom: lightsteelblue 1px solid; position: absolute; top: 106px; height: 315px; background-color: #ffffff;" >
    &nbsp;
    <asp:Label ID="Label3" runat="server" CssClass="CssLabel" Font-Bold="True" Font-Names="Times New Roman"
        Font-Size="8pt" Height="18px" Style="z-index: 100; left: 4px; position: absolute;
        top: 4px" Width="519px">QUADRO C: SITUAZIONE PATRIMONIALE DEL NUCLEO FAMILIARE</asp:Label>
    <asp:ListBox ID="ListBox1" runat="server" Height="80px" Style="z-index: 101; left: 6px;
        position: absolute; top: 61px" Width="586px" Font-Names="Courier New" Font-Size="8pt"></asp:ListBox>
    <asp:Label ID="Label1" runat="server" CssClass="CssLabel" Font-Bold="True" Font-Names="Times New Roman"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 102; left: 6px;
        position: absolute; top: 29px" Width="284px">PATRIMONIO MOBILIARE alla data del 31 Dicembre</asp:Label>
    <asp:Label ID="lbldataMob" runat="server" CssClass="CssLabel" Font-Bold="True" Font-Names="times"
        Font-Size="8pt" ForeColor="#0000C0" Style="z-index: 103; left: 291px; position: absolute;
        top: 29px" Text="2005"></asp:Label>
    <asp:Label ID="Label2" runat="server" CssClass="CssLabel" Font-Bold="True" Font-Names="Times New Roman"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 104; left: 6px;
        position: absolute; top: 151px" Width="300px">PATRIMONIO IMMOBILIARE alla data del 31 Dicembre</asp:Label>
    <asp:Label ID="lblDataImm" runat="server" CssClass="CssLabel" Font-Bold="True" Font-Names="times"
        Font-Size="8pt" ForeColor="#0000C0" Style="z-index: 105; left: 310px; position: absolute;
        top: 151px" Text="2005"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 107; left: 10px;
        position: absolute; top: 47px" Width="72px">COMPONENTE</asp:Label>
    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 108; left: 194px;
        position: absolute; top: 47px" Width="49px">CODICE</asp:Label>
    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 109; left: 389px;
        position: absolute; top: 47px" Width="72px">INTERMEDIARIO</asp:Label>
    <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 110; left: 509px;
        position: absolute; top: 47px" Width="55px">IMPORTO</asp:Label>
    <div id="contenitore" 
        
        
        
        
        
        
        
        
        
        
        
        
        
        style="overflow: auto; position: absolute; width: 580px; height: 89px; top: 169px; left: 8px;">
    <asp:ListBox ID="ListBox2" runat="server" Style="z-index: 106; left: 4px;
        position: absolute; top: 21px; width: 1029px; height: 50px;" Font-Names="Courier New" 
                Font-Size="8pt"></asp:ListBox>
                    <asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 111; left: 10px;
        position: absolute; top: 1px" Width="72px">COMPONENTE</asp:Label>
    <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 112; left: 194px;
        position: absolute; top: 1px" Width="49px">TIPO</asp:Label>
    <asp:Label ID="Label10" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 113; left: 352px;
        position: absolute; top: 1px" Width="37px">% Pr.</asp:Label>
        <asp:Label ID="Label14" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 113; left: 453px;
        position: absolute; top: 1px; width: 69px;">RENDITA</asp:Label>
    <asp:Label ID="Label11" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 114; left: 543px;
        position: absolute; top: 1px; width: 108px;">VALORE</asp:Label>
    <asp:Label ID="Label12" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 115; left: 652px;
        position: absolute; top: 1px; width: 52px;">MUTUO</asp:Label>
    <asp:Label ID="Label17" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 116; left: 896px;
        position: absolute; top: 1px; width: 22px;" ToolTip="Superficie Utile">SUP.</asp:Label>
        <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 116; left: 949px;
        position: absolute; top: 1px; width: 22px;" ToolTip="Piena Proprietà">P.PROPRIETA'</asp:Label>
    <asp:Label ID="Label16" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 116; left: 844px;
        position: absolute; top: 1px; width: 22px;" ToolTip="Numero Vani">VANI</asp:Label>
    <asp:Label ID="Label55" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 116; left: 699px;
        position: absolute; top: 1px; width: 22px;" ToolTip="Comune">COMUNE</asp:Label>
    <asp:Label ID="Label44" runat="server" Font-Bold="False" Font-Names="Courier New"
        Font-Size="8pt" ForeColor="#0000C0" Height="18px" Style="z-index: 116; left: 394px;
        position: absolute; top: 0px; width: 22px;" ToolTip="Categoria Catastale">C.C.</asp:Label>
                </div>
    <asp:Button ID="Button1" runat="server" Style="z-index: 117; left: 598px; position: absolute;
        top: 61px" Text="+" Width="38px" ToolTip="Aggiungi Elemento"/>
    <asp:Button ID="btnModifica" runat="server" Style="z-index: 118; left: 598px; position: absolute;
        top: 90px" Text="/" Width="38px" ToolTip="Modifica Elemento" />
    <asp:Button ID="Button2" runat="server" Style="z-index: 119; left: 598px; position: absolute;
        top: 119px" Text="-" Width="38px" ToolTip="Elimina Elemento" />
    <asp:Button ID="btnAggiungi" runat="server" Style="z-index: 120; left: 598px; position: absolute;
        top: 188px" Text="+" Width="38px" ToolTip="Aggiungi Elemento" />
    <asp:Button ID="btnMod" runat="server" Style="z-index: 121; left: 598px; position: absolute;
        top: 212px" Text="/" Width="38px" ToolTip="Modifica Elemento" />
    <asp:Button ID="Button6" runat="server" Style="z-index: 122; left: 598px; position: absolute;
        top: 236px" Text="-" Width="38px" ToolTip="Elimina Elemento" UseSubmitBehavior="False" />
    &nbsp;
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="arial" Font-Size="8pt"
        ImageUrl="~/IMG/Aiuto.gif" NavigateUrl="~/help_dichiarazione.htm#QC" Style="z-index: 126;
        left: 620px; position: absolute; top: 2px" Target="_blank" Width="18px">Aiuto</asp:HyperLink>
</div>
&nbsp; &nbsp;&nbsp;
<asp:HiddenField ID="V1" runat="server" />
<asp:HiddenField ID="V2" runat="server" />
<asp:HiddenField ID="annoRedd" runat="server" />

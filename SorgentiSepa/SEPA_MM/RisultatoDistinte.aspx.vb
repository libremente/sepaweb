﻿
Partial Class RisultatoDistinte
    Inherits PageSetIdMode
    Dim par As New CM.Global
    Dim sValoreOP As String
    Dim sValoreDA As String
    Dim sValoreA As String
    Dim sValoreDIS As String

    Dim sStringaSql As String
    Dim scriptblock As String
    Dim SPagina As String



    Protected Sub btnRicerca_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRicerca.Click
        Response.Write("<script>document.location.href=""CercaDistinte.aspx""</script>")
    End Sub

    Protected Sub btnVisualizza_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVisualizza.Click
        If LBLID.Text = "-1" Or LBLID.Text = "" Then
            Response.Write("<script>alert('Nessuna Distinta selezionata!')</script>")
        Else

            If par.OracleConn.State = Data.ConnectionState.Open Then
                Response.Write("IMPOSSIBILE VISUALIZZARE")
                Exit Sub
            Else
                par.OracleConn.Open()
                par.SettaCommand(par)
            End If

            SPagina = "<table border='0' cellpadding='0' cellspacing='0' width='100%'>" & vbCrLf
            SPagina = SPagina & "<tr>" & vbCrLf
            SPagina = SPagina & "<td width='100%' colspan='6'>" & vbCrLf
            SPagina = SPagina & "<p align='center'><b><font face='Arial' size='3'>Elenco delle Domande scaricate nella distinta N° " & LBLID.Text & " creata da: " & LBLPROGR.Text & "</font></b><p>&nbsp;</td>" & vbCrLf
            SPagina = SPagina & "</tr>" & vbCrLf
            SPagina = SPagina & "<tr>" & vbCrLf
            SPagina = SPagina & "<td width='100%' colspan='6'><p>&nbsp;</td>" & vbCrLf
            SPagina = SPagina & "</tr>" & vbCrLf
            SPagina = SPagina & "<tr>" & vbCrLf
            SPagina = SPagina & "<td width='6%'><b><font face='Arial' color='#000080' size='2'> </font></b>" & vbCrLf
            SPagina = SPagina & "<p align='left'><b><font face='Arial' size='2'>PROTOCOLLO</font></b></td>" & vbCrLf
            SPagina = SPagina & "<td width='7%'>" & vbCrLf
            SPagina = SPagina & "<p align='left'><font size='2' face='Arial'><b>DATA</b></font></td>" & vbCrLf
            SPagina = SPagina & "<td width='17%'>" & vbCrLf
            SPagina = SPagina & "<p align='left'><b><font size='2' face='Arial'>NOMINATIVO</font></b></td>" & vbCrLf
            SPagina = SPagina & "<td width='6%'>" & vbCrLf
            SPagina = SPagina & "<p align='left'><b><font size='2' face='Arial'>ISBARC/R</font></b></td>" & vbCrLf
            SPagina = SPagina & "<td width='10%'>" & vbCrLf
            SPagina = SPagina & "<p align='left'><b><font size='2' face='Arial'>UTENTE</font></b></td>" & vbCrLf
            SPagina = SPagina & "<td width='66%'></td>" & vbCrLf
            SPagina = SPagina & "</tr>" & vbCrLf


            par.cmd.CommandText = "select DOMANDE_BANDO.ID,DOMANDE_BANDO.PG,TO_CHAR(TO_DATE(DOMANDE_BANDO.DATA_PG,'YYYYmmdd'),'DD/MM/YYYY') AS ""DATA_PG1"",DOMANDE_BANDO.isbarc_r,COMP_NUCLEO.COGNOME,COMP_NUCLEO.NOME from DOMANDE_BANDO,DICHIARAZIONI,COMP_NUCLEO where DOMANDE_BANDO.PROGR_COMPONENTE=COMP_NUCLEO.PROGR AND COMP_NUCLEO.ID_DICHIARAZIONE=DOMANDE_BANDO.ID_DICHIARAZIONE AND DICHIARAZIONI.ID_CAF=" & Session.Item("ID_CAF") & " AND DOMANDE_BANDO.ID_DICHIARAZIONE=DICHIARAZIONI.ID and DOMANDE_BANDO.N_DISTINTA=" & LBLID.Text & " ORDER BY DOMANDE_BANDO.ID ASC"
            Dim myReader As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()
            While myReader.Read
                Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()


                par.cmd.CommandText = "SELECT OPERATORI.ID,OPERATORI.OPERATORE AS ""DESCRIZIONE"" FROM OPERATORI,EVENTI_BANDI " _
                & "WHERE EVENTI_BANDI.TIPO_OPERATORE='I' AND " _
                & "EVENTI_BANDI.COD_EVENTO='F133' AND " _
                & "EVENTI_BANDI.ID_DOMANDA=" & myReader("ID") _
                & " AND OPERATORI.ID=EVENTI_BANDI.ID_OPERATORE  ORDER BY EVENTI_BANDI.DATA_ORA DESC"

                myReader1 = par.cmd.ExecuteReader()
                If myReader1.Read Then
                    SPagina = SPagina & "<tr>" & vbCrLf
                    SPagina = SPagina & "<td width='21%'><p align='left'><font face='Arial' size='2'>" & myReader("PG") & "</font></td>" & vbCrLf
                    SPagina = SPagina & "<td width='12%'><p align='left'><font face='Arial' size='2'>" & myReader("DATA_PG1") & "</font></td>" & vbCrLf
                    SPagina = SPagina & "<td width='35%'><p align='left'><font face='Arial' size='2'>" & myReader("COGNOME") & " " & myReader("NOME") & "</font></td>" & vbCrLf
                    SPagina = SPagina & "<td width='15%'><p align='left'><font face='Arial' size='2'>" & par.Tronca(myReader("ISBARC_R")) & "</font></td>" & vbCrLf
                    SPagina = SPagina & "<td width='6%'><p align='left'><font face='Arial' size='2'>" & myReader1("DESCRIZIONE") & "</font></td>" & vbCrLf
                    SPagina = SPagina & "<td width='5%'><p align='left'><font face='Arial' size='2'></font></td>" & vbCrLf
                    SPagina = SPagina & "</tr>" & vbCrLf
                End If
                myReader1.Close()
            End While
            par.cmd.Dispose()
            myReader.Close()
            par.OracleConn.Close()

            SPagina = SPagina & "</table>" & vbCrLf
            Session.Add(Session.Item("ID_OPERATORE"), SPagina)
            Response.Write("<script>window.open('DistintaScarico.aspx','Distinta','');</script>")


            'scriptblock = "<script language='javascript' type='text/javascript'>" _
            '& "location.replace('max.aspx?ID=" & LBLID.Text & "');" _
            '& "</script>"
            'If (Not Page.ClientScript.IsClientScriptBlockRegistered("clientScript20")) Then
            '    Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "clientScript20", scriptblock)
            'End If

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("OPERATORE") = "" Then
            Response.Redirect("AccessoNegato.htm", True)
            Exit Sub
        End If
        If Not IsPostBack Then
            sValoreOP = Request.QueryString("OP")
            sValoreDA = Request.QueryString("DA")
            sValoreA = Request.QueryString("A")
            sValoreDIS = Request.QueryString("DIS")

            btnVisualizza.Attributes.Add("onclick", "this.style.visibility='hidden'")
            LBLID.Text = "-1"
            Cerca()
        End If
    End Sub

    Private Function Cerca()
        Dim bTrovato As Boolean
        Dim sValore As String
        Dim sCompara As String


        bTrovato = False
        sStringaSql = ""

        If sValoreDA <> "" Then
            sValore = sValoreDA
            If InStr(sValore, "*") Then
                sCompara = " LIKE "
                Call par.ConvertiJolly(sValore)
            Else
                sCompara = " = "
            End If
            bTrovato = True
            sStringaSql = sStringaSql & " DOMANDE_DISTINTE.DATA >= '" & par.PulisciStrSql(sValore) & "' "
        End If

        If sValoreA <> "" Then
            If bTrovato = True Then sStringaSql = sStringaSql & " AND "

            sValore = sValoreA
            If InStr(sValore, "*") Then
                sCompara = " LIKE "
                Call par.ConvertiJolly(sValore)
            Else
                sCompara = " = "
            End If
            bTrovato = True
            sStringaSql = sStringaSql & " DOMANDE_DISTINTE.DATA<='" & par.PulisciStrSql(sValore) & "' "
        End If


        If sValoreDIS <> "" Then
            If bTrovato = True Then sStringaSql = sStringaSql & " AND "

            sValore = sValoreDIS
            If InStr(sValore, "*") Then
                sCompara = " = "
                Call par.ConvertiJolly(sValore)
            Else
                sCompara = " = "
            End If
            bTrovato = True
            sStringaSql = sStringaSql & " DOMANDE_DISTINTE.NUMERO " & sCompara & " " & par.PulisciStrSql(sValore) & " "
        End If
        If sValoreOP <> "-1" Then
            If sValoreOP <> "" Then
                If bTrovato = True Then sStringaSql = sStringaSql & " AND "

                sValore = sValoreOP
                If InStr(sValore, "*") Then
                    sCompara = " = "
                    Call par.ConvertiJolly(sValore)
                Else
                    sCompara = " = "
                End If
                bTrovato = True
                sStringaSql = sStringaSql & " DOMANDE_DISTINTE.ID_OPERATORE" & sCompara & " " & par.PulisciStrSql(sValore) & " "
            End If
        End If

        sStringaSQL1 = "SELECT DOMANDE_DISTINTE.NUMERO,TO_CHAR(TO_DATE(DOMANDE_DISTINTE.DATA,'YYYYmmdd'),'DD/MM/YYYY')" _
                & " AS  ""DATA_DIS""," _
                & "OPERATORI.OPERATORE AS ""DESCRIZIONE""  " _
                & " FROM DOMANDE_DISTINTE,OPERATORI WHERE " _
                & "  DOMANDE_DISTINTE.ID_OPERATORE = OPERATORI.ID "

        If sStringaSql <> "" Then
            sStringaSQL1 = sStringaSQL1 & " AND " & sStringaSql
        End If
        sStringaSQL1 = sStringaSQL1 & " ORDER BY DOMANDE_DISTINTE.NUMERO DESC"
        BindGrid()
    End Function

    Private Sub BindGrid()
        par.OracleConn.Open()

        Dim da As New Oracle.DataAccess.Client.OracleDataAdapter(sStringaSQL1, par.OracleConn)

        Dim ds As New Data.DataSet()
        da.Fill(ds, "DOMANDE_DISTINTE,OPERATORI")
        DataGrid1.DataSource = ds
        DataGrid1.DataBind()

        par.OracleConn.Close()
        Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
    End Sub

    Public Property sStringaSQL1() As String
        Get
            If Not (ViewState("par_sStringaSQL1") Is Nothing) Then
                Return CStr(ViewState("par_sStringaSQL1"))
            Else
                Return ""
            End If
        End Get

        Set(ByVal value As String)
            ViewState("par_sStringaSQL1") = value
        End Set

    End Property

    Protected Sub DataGrid1_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.EditCommand
        LBLID.Text = e.Item.Cells(0).Text
        LBLPROGR.Text = e.Item.Cells(1).Text
        Label2.Text = "Hai selezionato: N° " & e.Item.Cells(0).Text
    End Sub

    Protected Sub DataGrid1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataGridItemEventArgs) Handles DataGrid1.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or _
    e.Item.ItemType = ListItemType.AlternatingItem Then
            '---------------------------------------------------         
            ' Add the OnMouseOver and OnMouseOut method to the Row of DataGrid         
            '---------------------------------------------------         
            e.Item.Attributes.Add("onmouseover", "this.style.backgroundColor='Silver'")
            e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor='white'")
        End If
    End Sub

    Protected Sub DataGrid1_PageIndexChanged(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridPageChangedEventArgs) Handles DataGrid1.PageIndexChanged
        If e.NewPageIndex >= 0 Then
            DataGrid1.CurrentPageIndex = e.NewPageIndex
            BindGrid()
        End If
    End Sub

    Protected Sub btnChiudi_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChiudi.Click
        Response.Write("<script>window.close();</script>")
    End Sub

    Protected Sub DataGrid1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataGrid1.SelectedIndexChanged

    End Sub
End Class
﻿
Partial Class ANAUT_DomandeCarico
    Inherits PageSetIdMode
    Dim par As New CM.Global

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("OPERATORE") = "" Then
            Response.Redirect("~/AccessoNegato.htm", True)
            Exit Sub
        End If


        If Not IsPostBack Then
            cmbAnnoa.SelectedIndex = -1
            cmbAnnoa.Items.FindByText(Year(Now)).Selected = True

            cmbMesea.SelectedIndex = -1
            cmbMesea.Items.FindByValue(Format(Month(Now), "00")).Selected = True

            cmbGa.SelectedIndex = -1
            cmbGa.Items.FindByText(Format(Day(Now), "00")).Selected = True
            RiempiOperatori()
        End If
    End Sub

    Private Function RiempiOperatori()
        Dim ds As New Data.DataSet()
        Dim dlist As CheckBoxList
        Dim da As Oracle.DataAccess.Client.OracleDataAdapter


        If par.OracleConn.State = Data.ConnectionState.Open Then
            Response.Write("IMPOSSIBILE VISUALIZZARE")
            Exit Function
        Else
            par.OracleConn.Open()
            par.SettaCommand(par)
        End If


        dlist = CheckOperatori

        da = New Oracle.DataAccess.Client.OracleDataAdapter("SELECT ID,OPERATORE AS ""DESCRIZIONE"" FROM OPERATORI WHERE ID_CAF=" & Session.Item("ID_CAF") & " ORDER BY ID ASC", par.OracleConn)
        da.Fill(ds)

        dlist.Items.Clear()
        dlist.DataSource = ds
        dlist.DataTextField = "DESCRIZIONE"
        dlist.DataValueField = "ID"
        dlist.DataBind()

        da.Dispose()
        da = Nothing

        dlist.DataSource = Nothing
        dlist = Nothing

        ds.Clear()
        ds.Dispose()
        ds = Nothing

        par.cmd.Dispose()
        par.OracleConn.Close()
        Oracle.DataAccess.Client.OracleConnection.ClearAllPools()

    End Function

    Protected Sub btnChiudi_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChiudi.Click
        Response.Write("<script>window.close();</script>")

    End Sub

    Protected Sub btnVisualizza_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVisualizza.Click
        Dim operatori As String
        Dim INTERVALLO_DA As String
        Dim INTERVALLO_A As String
        Dim i As Integer
        Dim sPagina As String
        Dim operatore As String
        Dim POS As Integer
        Dim POS1 As Integer
        Dim OPERATORE_TR As String


        Try
            If par.OracleConn.State = Data.ConnectionState.Open Then
                Response.Write("IMPOSSIBILE VISUALIZZARE")
                Exit Sub
            Else
                par.OracleConn.Open()
                par.SettaCommand(par)
            End If

            INTERVALLO_DA = cmbAnnoDa.Text & cmbMDa.Text & cmbGDa.Text
            INTERVALLO_A = cmbAnnoa.Text & cmbMesea.Text & cmbGa.Text

            operatori = ""

            For i = 0 To CheckOperatori.Items.Count - 1
                If CheckOperatori.Items(i).Selected Then
                    operatori = operatori & CheckOperatori.Items(i).Value & ","
                End If
            Next
            If operatori = "" Then
                Response.Write("<script>alert('Selezionare almeno un operatore');</script>")
                Exit Sub
            Else
                operatori = Mid(operatori, 1, Len(operatori) - 1)
            End If
            If Val(INTERVALLO_A) < Val(INTERVALLO_DA) Then
                Response.Write("<script>alert('Intervallo Date non valido!');</script>")
                Exit Sub
            End If


            If cmbTipo.SelectedValue = "0" Then
                par.cmd.CommandText = "select utenza_dichiarazioni.ID,utenza_dichiarazioni.PG,TO_CHAR(TO_DATE(utenza_dichiarazioni.DATA_PG,'YYYYmmdd'),'DD/MM/YYYY') AS ""DATA_PG1"",utenza_dichiarazioni.isee,utenza_COMP_NUCLEO.COGNOME,utenza_COMP_NUCLEO.NOME,utenza_dichiarazioni.N_DISTINTA from utenza_DICHIARAZIONI,utenza_COMP_NUCLEO where utenza_comp_nucleo.progr=0 and utenza_COMP_NUCLEO.ID_DICHIARAZIONE=utenza_dichiarazioni.id AND utenza_DICHIARAZIONI.ID_CAF=" & Session.Item("ID_CAF") & " and utenza_dichiarazioni.N_DISTINTA=0 and id_stato='1' ORDER BY utenza_dichiarazioni.ID ASC"
            Else
                par.cmd.CommandText = "select utenza_dichiarazioni.ID,utenza_dichiarazioni.PG,TO_CHAR(TO_DATE(utenza_dichiarazioni.DATA_PG,'YYYYmmdd'),'DD/MM/YYYY') AS ""DATA_PG1"",utenza_dichiarazioni.isee,utenza_COMP_NUCLEO.COGNOME,utenza_COMP_NUCLEO.NOME,utenza_dichiarazioni.N_DISTINTA from utenza_dichiarazioni,utenza_COMP_NUCLEO where utenza_comp_nucleo.progr=0 and utenza_COMP_NUCLEO.ID_DICHIARAZIONE=utenza_dichiarazioni.ID AND utenza_dichiarazioni.ID_CAF=" & Session.Item("ID_CAF") & " AND utenza_dichiarazioni.N_DISTINTA<>0 and id_stato='1' ORDER BY utenza_dichiarazioni.ID ASC"
            End If
            Dim myReader As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()
            
            sPagina = "<table border='0' cellpadding='0' cellspacing='0' width='100%'>" & vbCrLf
            sPagina = sPagina & "<tr>" & vbCrLf
            sPagina = sPagina & "<td width='100%' colspan='6'>" & vbCrLf
            If cmbTipo.SelectedValue = "0" Then
                sPagina = sPagina & "<p align='center'><b><font face='Arial' size='3'>ANAGRAFE UTENZA - Elenco delle Dichiarazioni in carico dal " & par.FormattaData(INTERVALLO_DA) & " al " & par.FormattaData(INTERVALLO_A) & "</font></b><p>&nbsp;</td>" & vbCrLf
            Else
                sPagina = sPagina & "<p align='center'><b><font face='Arial' size='3'>ANAGRAFE UTENZA - Elenco delle Dichiarazioni scaricate dal " & par.FormattaData(INTERVALLO_DA) & " al " & par.FormattaData(INTERVALLO_A) & "</font></b><p>&nbsp;</td>" & vbCrLf
            End If
            sPagina = sPagina & "</tr>" & vbCrLf
            sPagina = sPagina & "<tr>" & vbCrLf
            sPagina = sPagina & "<td width='100%' colspan='6'><p>&nbsp;</td>" & vbCrLf
            sPagina = sPagina & "</tr>" & vbCrLf
            sPagina = sPagina & "<tr>" & vbCrLf
            sPagina = sPagina & "<td width='6%'><b><font face='Arial' color='#000080' size='2'> </font></b>" & vbCrLf
            sPagina = sPagina & "<p align='left'><b><font face='Arial' size='2'>PROTOCOLLO</font></b></td>" & vbCrLf
            sPagina = sPagina & "<td width='7%'>" & vbCrLf
            sPagina = sPagina & "<p align='left'><font size='2' face='Arial'><b>DATA</b></font></td>" & vbCrLf
            sPagina = sPagina & "<td width='17%'>" & vbCrLf
            sPagina = sPagina & "<p align='left'><b><font size='2' face='Arial'>NOMINATIVO</font></b></td>" & vbCrLf
            sPagina = sPagina & "<td width='6%'>" & vbCrLf
            sPagina = sPagina & "<p align='left'><b><font size='2' face='Arial'>ISEE</font></b></td>" & vbCrLf
            sPagina = sPagina & "<td width='10%'>" & vbCrLf
            sPagina = sPagina & "<p align='left'><b><font size='2' face='Arial'>UTENTE</font></b></td>" & vbCrLf

            If cmbTipo.SelectedValue = "1" Then
                sPagina = sPagina & "<td width='10%'>" & vbCrLf
                sPagina = sPagina & "<p align='left'><b><font size='2' face='Arial'>DISTINTA</font></b></td>" & vbCrLf
            End If
            sPagina = sPagina & "<td width='66%'></td>" & vbCrLf
            sPagina = sPagina & "</tr>" & vbCrLf
            i = 0
            While myReader.Read
                par.cmd.CommandText = "SELECT OPERATORI.ID,OPERATORI.OPERATORE AS ""DESCRIZIONE"" FROM OPERATORI,UTENZA_EVENTI_DICHIARAZIONI " _
                                    & "WHERE UTENZA_EVENTI_DICHIARAZIONI.TIPO_OPERATORE='I' AND " _
                                    & " " _
                                    & "UTENZA_EVENTI_DICHIARAZIONI.ID_PRATICA=" & myReader("ID") _
                                    & " AND OPERATORI.ID=UTENZA_EVENTI_DICHIARAZIONI.ID_OPERATORE  ORDER BY UTENZA_EVENTI_DICHIARAZIONI.DATA_ORA DESC"
                'AND EVENTI_BANDI.ID_OPERATORE IN (" & operatori & ")
                Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()

                If myReader1.Read Then
                    operatore = myReader1("ID")

                    POS = 1
                    While POS <= Len(operatori)
                        POS1 = InStr(POS, operatori, ",", CompareMethod.Text)
                        'If POS1 = 0 Then POS1 = Len(operatori) + 1
                        'OPERATORE_TR = Mid(operatori, POS, POS1 - 1)

                        If POS1 = 0 Then POS1 = Len(operatori) + 1
                        OPERATORE_TR = Mid(operatori, POS, POS1 - POS)

                        POS = POS1 + 1
                        If OPERATORE_TR = operatore Then

                            sPagina = sPagina & "<tr>" & vbCrLf
                            sPagina = sPagina & "<td width='21%'><p align='left'><font face='Arial' size='2'>" & myReader("PG") & "</font></td>" & vbCrLf
                            sPagina = sPagina & "<td width='12%'><p align='left'><font face='Arial' size='2'>" & myReader("DATA_PG1") & "</font></td>" & vbCrLf
                            sPagina = sPagina & "<td width='35%'><p align='left'><font face='Arial' size='2'>" & myReader("COGNOME") & " " & myReader("NOME") & "</font></td>" & vbCrLf
                            sPagina = sPagina & "<td width='15%'><p align='left'><font face='Arial' size='2'>" & par.Tronca(myReader("ISEE")) & "</font></td>" & vbCrLf
                            sPagina = sPagina & "<td width='24%'><p align='left'><font face='Arial' size='2'>" & par.IfNull(myReader1("DESCRIZIONE"), "") & "</font></td>" & vbCrLf
                            If cmbTipo.SelectedValue = "1" Then
                                sPagina = sPagina & "<td width='10%'><p align='left'><font face='Arial' size='2'>" & par.IfNull(myReader("N_DISTINTA"), "") & "</font></td>" & vbCrLf
                            End If
                            sPagina = sPagina & "<td width='5%'><p align='left'><font face='Arial' size='2'></font></td>" & vbCrLf
                            sPagina = sPagina & "</tr>" & vbCrLf
                            Exit While
                        End If
                    End While

                End If
                myReader1.Close()
                i = i + 1
            End While

            sPagina = sPagina & "</table>" & vbCrLf

            myReader.Close()
            par.cmd.Dispose()
            par.OracleConn.Close()
            Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            If i = 0 Then
                Response.Write("<script>alert('Non sono state trovate domande!');</script>")
                Exit Sub
            End If
            HttpContext.Current.Session.Add("CARICO", sPagina)
            Response.Write("<script>window.open('ListaCarico.aspx','Domande','');</script>")


        Catch EX As Exception
            Label4.Text = "ERRORE: " + EX.Message
            par.OracleConn.Close()
            Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
        End Try
    End Sub

    Protected Sub cmdTutti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdTutti.Click
        Dim I As Integer
        For I = 0 To CheckOperatori.Items.Count - 1
            CheckOperatori.Items(I).Selected = True
        Next
    End Sub

    Protected Sub btnDeseleziona_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeseleziona.Click
        Dim I As Integer
        For I = 0 To CheckOperatori.Items.Count - 1
            CheckOperatori.Items(I).Selected = False
        Next
    End Sub
End Class

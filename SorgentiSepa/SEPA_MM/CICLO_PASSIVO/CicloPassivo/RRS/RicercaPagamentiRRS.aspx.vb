﻿'*** RICERCA I Pagamenti RRS da stampare

Partial Class RRS_RicercaPagamentiRRS
    Inherits PageSetIdMode
    Dim par As New CM.Global


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("OPERATORE") = "" Then
            Response.Redirect("~/AccessoNegato.htm", True)
            Exit Sub
        End If

        If Not IsPostBack Then
            sFiliale = "-1"
            sBP_Generale = "-1"

            If Session.Item("LIVELLO") <> "1" Then
                If (Session.Item("BP_GENERALE") = "0" Or IsNothing(Session.Item("BP_GENERALE"))) Then
                    sFiliale = Session.Item("ID_STRUTTURA")
                Else
                    sBP_Generale = Session.Item("ID_STRUTTURA")
                End If
            End If

            CaricaStrutture()

            'FiltraFornitori()
            'FiltraAppalti()
            'FiltraServizioVoce()

        End If

    End Sub



    Public Property sFiliale() As String
        Get
            If Not (ViewState("par_sFiliale") Is Nothing) Then
                Return CStr(ViewState("par_sFiliale"))
            Else
                Return "-1"
            End If
        End Get

        Set(ByVal value As String)
            ViewState("par_sFiliale") = value
        End Set

    End Property

    Public Property sBP_Generale() As String
        Get
            If Not (ViewState("par_sBP_Generale") Is Nothing) Then
                Return CStr(ViewState("par_sBP_Generale"))
            Else
                Return "-1"
            End If
        End Get

        Set(ByVal value As String)
            ViewState("par_sBP_Generale") = value
        End Set

    End Property



    'CARICO COMBO STRUTTURE (FILIARI)
    Private Sub CaricaStrutture()
        Dim FlagConnessione As Boolean = False

        Try

            ' APRO CONNESSIONE
            If par.OracleConn.State = Data.ConnectionState.Closed Then
                par.OracleConn.Open()
                par.SettaCommand(par)

                FlagConnessione = True
            End If





            If sFiliale <> "-1" Then
                par.cmd.CommandText = "select ID,NOME from SISCOM_MI.TAB_FILIALI where ID=" & sFiliale
            Else
                par.cmd.CommandText = "select distinct ID,NOME from SISCOM_MI.TAB_FILIALI " _
                                   & " where  ID in (select distinct(ID_STRUTTURA) from SISCOM_MI.PRENOTAZIONI " _
                                                 & " where TIPO_PAGAMENTO=7 " _
                                                  & "  and ID_STATO>=2 " _
                                                  & "  and ID_PAGAMENTO is not null ) " _
                                   & " order by NOME asc"
            End If

            par.caricaComboTelerik(par.cmd.CommandText, cmbStruttura, "ID", "NOME", True)
            
            '**************************

            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
                FlagConnessione = False
            End If

            If sFiliale <> "-1" Then
                Me.cmbStruttura.SelectedValue = sFiliale
                Me.cmbStruttura.Enabled = False
                CaricaEsercizio()
            Else
                If sBP_Generale <> "-1" Then
                    Me.cmbStruttura.SelectedValue = sBP_Generale
                    CaricaEsercizio()
                Else
                    Me.cmbStruttura.SelectedValue = "-1"
                End If
            End If


        Catch ex As Exception
            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            End If

            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../../../Errore.aspx';</script>")

        End Try

    End Sub


    Private Sub FiltraFornitori()
        Dim i As Integer = 0
        Dim FlagConnessione As Boolean = False

        Try

            ' APRO CONNESSIONE
            If par.OracleConn.State = Data.ConnectionState.Closed Then
                par.OracleConn.Open()
                par.SettaCommand(par)

                FlagConnessione = True
            End If


            par.cmd.CommandText = "select ID,trim(RAGIONE_SOCIALE) as RAGIONE_SOCIALE,trim(COGNOME) as COGNOME,trim(NOME) as NOME,trim(COD_FORNITORE) as COD_FORNITORE, " _
              & "(case when ragione_sociale is null then (case when cod_fornitore is null then cognome || ' ' || nome else cod_fornitore ||'-'|| cognome || ' ' || nome end) " _
                                  & "else (case when cod_fornitore is null then ragione_sociale else cod_fornitore || '-' || ragione_sociale  end) end) as descrizione " _
                             & " from SISCOM_MI.FORNITORI " _
                             & " where ID in (select ID_FORNITORE from SISCOM_MI.PRENOTAZIONI " _
                                          & " where  TIPO_PAGAMENTO=7 " _
                                          & "  and ID_STATO>=2 " _
                                          & "  and ID_PAGAMENTO is not null  "

            If Me.cmbStruttura.SelectedValue <> "-1" Then
                par.cmd.CommandText = par.cmd.CommandText & "  and ID_STRUTTURA=" & Me.cmbStruttura.SelectedValue
            End If

            If par.IfEmpty(Me.cmbAppalto.SelectedValue.ToString, "-1") <> "-1" Then
                par.cmd.CommandText = par.cmd.CommandText & "   and ID_APPALTO=" & Me.cmbAppalto.SelectedValue
            End If

            par.cmd.CommandText = par.cmd.CommandText & " ) order by RAGIONE_SOCIALE ASC, COGNOME ASC, NOME ASC"
            par.caricaComboTelerik(par.cmd.CommandText, cmbFornitore, "ID", "DESCRIZIONE", True)


            'par.cmd.CommandText = "select ID,trim(RAGIONE_SOCIALE) as RAGIONE_SOCIALE,trim(COGNOME) as COGNOME,trim(NOME) as NOME, trim(COD_FORNITORE) as COD_FORNITORE " _
            '                   & " from SISCOM_MI.FORNITORI " _
            '                   & " where ID in ( select ID_FORNITORE from SISCOM_MI.PRENOTAZIONI " _
            '                                & " where  TIPO_PAGAMENTO=7 " _
            '                                & "  and ID_STATO>=2 " _
            '                                & "  and ID_PAGAMENTO is not null  "

            'If Me.cmbStruttura.SelectedValue <> "-1" Then
            '    par.cmd.CommandText = par.cmd.CommandText & "  and ID_STRUTTURA=" & Me.cmbStruttura.SelectedValue
            'End If

            'If Me.cmbAppalto.SelectedValue <> "-1" Then
            '    par.cmd.CommandText = par.cmd.CommandText & " and ID_APPALTO=" & Me.cmbAppalto.SelectedValue
            'End If

            'par.cmd.CommandText = par.cmd.CommandText & " ) order by RAGIONE_SOCIALE ASC, COGNOME ASC, NOME ASC"


            'Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()

            'While myReader1.Read
            '    If IsDBNull(myReader1("RAGIONE_SOCIALE")) Then
            '        If par.IfNull(myReader1("COD_FORNITORE"), "") = "" Then
            '            Me.cmbFornitore.Items.Add(New ListItem(par.IfNull(myReader1("COGNOME"), " ") & " " & par.IfNull(myReader1("NOME"), " "), par.IfNull(myReader1("ID"), -1)))
            '        Else
            '            Me.cmbFornitore.Items.Add(New ListItem(par.IfNull(myReader1("COD_FORNITORE"), "") & " - " & par.IfNull(myReader1("COGNOME"), " ") & " " & par.IfNull(myReader1("NOME"), " "), par.IfNull(myReader1("ID"), -1)))
            '        End If
            '    Else
            '        If par.IfNull(myReader1("COD_FORNITORE"), "") = "" Then
            '            Me.cmbFornitore.Items.Add(New ListItem(par.IfNull(myReader1("RAGIONE_SOCIALE"), " "), par.IfNull(myReader1("ID"), -1)))
            '        Else
            '            Me.cmbFornitore.Items.Add(New ListItem(par.IfNull(myReader1("COD_FORNITORE"), "") & " - " & par.IfNull(myReader1("RAGIONE_SOCIALE"), " "), par.IfNull(myReader1("ID"), -1)))
            '        End If
            '    End If

            '    i = i + 1
            'End While
            'myReader1.Close()
            '**************************

            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
                FlagConnessione = False
            End If

            If cmbFornitore.Items.Count = 2 Then
                Me.cmbFornitore.Items(1).Selected = True
            End If


        Catch ex As Exception
            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            End If

            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../../../Errore.aspx';</script>")

        End Try

    End Sub


    Private Sub FiltraAppalti()
        Dim i As Integer = 0
        Dim FlagConnessione As Boolean = False

        Try

            ' APRO CONNESSIONE
            If par.OracleConn.State = Data.ConnectionState.Closed Then
                par.OracleConn.Open()
                par.SettaCommand(par)

                FlagConnessione = True
            End If


          

            par.cmd.CommandText = " select  ID,TRIM(NUM_REPERTORIO) as NUM_REPERTORIO " _
                                & " from SISCOM_MI.APPALTI " _
                                & " where ID in ( select ID_APPALTO from SISCOM_MI.PRENOTAZIONI " _
                                              & " where  TIPO_PAGAMENTO=7 " _
                                              & "  and ID_STATO>=2 " _
                                              & "  and ID_PAGAMENTO is not null  "

            If Me.cmbStruttura.SelectedValue <> "-1" Then
                par.cmd.CommandText = par.cmd.CommandText & " and ID_STRUTTURA=" & Me.cmbStruttura.SelectedValue
            End If

            If Me.cmbFornitore.SelectedValue <> "-1" Then
                par.cmd.CommandText = par.cmd.CommandText & " and ID_FORNITORE=" & Me.cmbFornitore.SelectedValue
            End If

            par.cmd.CommandText = par.cmd.CommandText & " ) order by NUM_REPERTORIO "
            par.caricaComboTelerik(par.cmd.CommandText, cmbAppalto, "ID", "NUM_REPERTORIO", True)

            'Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()
            'While myReader1.Read
            '    i = i + 1
            '    Me.cmbAppalto.Items.Add(New ListItem(par.IfNull(myReader1("NUM_REPERTORIO"), " "), par.IfNull(myReader1("ID"), -1)))
            'End While
            'myReader1.Close()

            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
                FlagConnessione = False
            End If

            If cmbAppalto.Items.Count = 2 Then
                cmbAppalto.Items(1).Selected = True
            End If

        Catch ex As Exception
            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            End If

            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../../../Errore.aspx';</script>")

        End Try

    End Sub

    Private Sub FiltraServizioVoce()
        Dim i As Integer = 0
        Dim FlagConnessione As Boolean = False
        Dim sStr1 As String = ""
        Dim flag As Boolean = False

        Try

           

            sStr1 = "select ID,trim(DESCRIZIONE) as DESCRIZIONE " _
                & " from SISCOM_MI.PF_VOCI " _
                & " where ID in (select distinct(ID_VOCE_PF) " _
                             & " from SISCOM_MI.PRENOTAZIONI " _
                             & " where  TIPO_PAGAMENTO=7 " _
                             & "  and ID_STATO>=2 " _
                             & "  and ID_PAGAMENTO is not null  "

            If Me.cmbAppalto.SelectedValue <> "-1" Then
                sStr1 = sStr1 & "  and ID_APPALTO= " & Me.cmbAppalto.SelectedValue.ToString
                flag = True
            End If

            If Me.cmbFornitore.SelectedValue <> "-1" Then
                sStr1 = sStr1 & "  and ID_FORNITORE= " & Me.cmbFornitore.SelectedValue.ToString
                flag = True
            End If

            If Me.cmbStruttura.SelectedValue <> "-1" Then
                sStr1 = sStr1 & " and ID_STRUTTURA=" & Me.cmbStruttura.SelectedValue
                flag = True
            End If

            sStr1 = sStr1 & " ) order by DESCRIZIONE ASC"


            If flag = False Then
                Exit Sub
            End If

            ' APRO CONNESSIONE
            If par.OracleConn.State = Data.ConnectionState.Closed Then
                par.OracleConn.Open()
                par.SettaCommand(par)

                FlagConnessione = True
            End If


            par.cmd.CommandText = sStr1

            par.caricaComboTelerik(par.cmd.CommandText, cmbServizioVoce, "ID", "DESCRIZIONE", True)
            'Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()

            'While myReader1.Read
            '    i = i + 1
            '    Me.cmbServizioVoce.Items.Add(New ListItem(par.IfNull(myReader1("DESCRIZIONE"), " "), par.IfNull(myReader1("ID"), -1)))
            'End While
            'myReader1.Close()
            '**************************

            If cmbServizioVoce.Items.Count = 2 Then
                Me.cmbServizioVoce.Items(1).Selected = True
            End If

            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
                FlagConnessione = False
            End If


        Catch ex As Exception
            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            End If

            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../../../Errore.aspx';</script>")

        End Try

    End Sub


    Protected Sub cmbFornitore_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbFornitore.SelectedIndexChanged

        FiltraAppalti()
        FiltraServizioVoce()

    End Sub

    Protected Sub cmbAppalto_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbAppalto.SelectedIndexChanged

        FiltraFornitori()
        FiltraServizioVoce()

    End Sub
 Protected Sub btnCerca_Click(sender As Object, e As System.EventArgs) Handles btnCerca.Click

        Try

            Response.Write("<script>location.replace('RisultatiPagamentiRRS.aspx?FO=" & Me.cmbFornitore.SelectedValue.ToString _
                                                                              & "&SV=" & Me.cmbServizioVoce.SelectedValue.ToString _
                                                                              & "&AP=" & Me.cmbAppalto.SelectedValue.ToString _
                                                                              & "&STR=" & Me.cmbStruttura.SelectedValue.ToString _
                                                                              & "&ST=" & Me.cmbStato.SelectedValue.ToString _
                                                                              & "&EF_R=" & Me.cmbEsercizio.SelectedValue.ToString _
                                                                         & "');</script>")


        Catch ex As Exception
            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../../../Errore.aspx';</script>")
        End Try
    End Sub

    Protected Sub btnAnnulla_Click(sender As Object, e As System.EventArgs) Handles btnAnnulla.Click
        Response.Write("<script>document.location.href=""../../pagina_home_ncp.aspx""</script>")
    End Sub


    Private Function IfEmpty(ByVal v As Object, ByVal s As Object) As Object
        If v = "" Or v = " " Or UCase(v) = "NOT FOUND" Then
            IfEmpty = s
        Else
            IfEmpty = v
        End If
    End Function



    Protected Sub cmbStruttura_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbStruttura.SelectedIndexChanged
        'Me.cmbFornitore.Items.Clear()
        'Me.cmbFornitore.Items.Add(New ListItem(" ", -1))

        'Me.cmbAppalto.Items.Clear()
        'Me.cmbAppalto.Items.Add(New ListItem(" ", -1))

        'Me.cmbServizioVoce.Items.Clear()
        'Me.cmbServizioVoce.Items.Add(New ListItem(" ", -1))

        CaricaEsercizio()

        'FiltraFornitori()
        'FiltraAppalti()
        'FiltraServizioVoce()

    End Sub


    'CARICO COMBO ESERCIZI FINANZIARI
    Private Sub CaricaEsercizio()
        Dim FlagConnessione As Boolean
        Dim i As Integer = 0
        Dim ID_ANNO_EF_CORRENTE As Long = -1

        Try

            ' APRO CONNESSIONE
            If par.OracleConn.State = Data.ConnectionState.Closed Then
                par.OracleConn.Open()
                par.SettaCommand(par)

                FlagConnessione = True
            End If


            If Me.cmbStruttura.SelectedValue <> "-1" Then
                par.cmd.CommandText = "select SISCOM_MI.PF_MAIN.ID, TO_CHAR(TO_DATE(T_ESERCIZIO_FINANZIARIO.INIZIO,'YYYYmmdd'),'DD/MM/YYYY') as INIZIO, " _
                    & "TO_CHAR(TO_DATE(T_ESERCIZIO_FINANZIARIO.INIZIO,'YYYYmmdd'),'DD/MM/YYYY') || '-' ||  " _
                    & "TO_CHAR(TO_DATE(T_ESERCIZIO_FINANZIARIO.FINE,'YYYYmmdd'),'DD/MM/YYYY') || '(' || SISCOM_MI.PF_STATI.DESCRIZIONE  || ')' as STATO " _
                                   & " from SISCOM_MI.T_ESERCIZIO_FINANZIARIO,SISCOM_MI.PF_MAIN,SISCOM_MI.PF_STATI " _
                                   & " where SISCOM_MI.PF_MAIN.ID_STATO>=5 " _
                                   & "   and SISCOM_MI.T_ESERCIZIO_FINANZIARIO.ID=SISCOM_MI.PF_MAIN.ID_ESERCIZIO_FINANZIARIO " _
                                   & "   and SISCOM_MI.PF_MAIN.ID_STATO=SISCOM_MI.PF_STATI.ID " _
                                   & "   and SISCOM_MI.PF_MAIN.ID in (select distinct(ID_PIANO_FINANZIARIO) " _
                                                                   & " from SISCOM_MI.MANUTENZIONI " _
                                                                   & " where ID_PF_VOCE_IMPORTO is null " _
                                                                   & "   and ID_STRUTTURA=" & Me.cmbStruttura.SelectedValue _
                                                                   & "   and ID_PRENOTAZIONE_PAGAMENTO in (select ID " _
                                                                                                & " from SISCOM_MI.PRENOTAZIONI " _
                                                                                                & " where  TIPO_PAGAMENTO=3 " _
                                                                                                & "  and ID_STATO>=2 " _
                                                                                                & "  and ID_PAGAMENTO is not null )) order by 1 desc"
            Else
                par.cmd.CommandText = "select SISCOM_MI.PF_MAIN.ID, TO_CHAR(TO_DATE(T_ESERCIZIO_FINANZIARIO.INIZIO,'YYYYmmdd'),'DD/MM/YYYY') as INIZIO, " _
                    & "TO_CHAR(TO_DATE(T_ESERCIZIO_FINANZIARIO.INIZIO,'YYYYmmdd'),'DD/MM/YYYY') || '-' ||  " _
                    & "TO_CHAR(TO_DATE(T_ESERCIZIO_FINANZIARIO.FINE,'YYYYmmdd'),'DD/MM/YYYY') || '(' || SISCOM_MI.PF_STATI.DESCRIZIONE  || ')' as STATO " _
                   & " from SISCOM_MI.T_ESERCIZIO_FINANZIARIO,SISCOM_MI.PF_MAIN,SISCOM_MI.PF_STATI " _
                   & " where SISCOM_MI.PF_MAIN.ID_STATO>=5 " _
                   & "   and SISCOM_MI.T_ESERCIZIO_FINANZIARIO.ID=SISCOM_MI.PF_MAIN.ID_ESERCIZIO_FINANZIARIO " _
                   & "   and SISCOM_MI.PF_MAIN.ID_STATO=SISCOM_MI.PF_STATI.ID " _
                   & "   and SISCOM_MI.PF_MAIN.ID in (select distinct(ID_PIANO_FINANZIARIO) " _
                                                   & " from SISCOM_MI.MANUTENZIONI " _
                                                   & " where ID_PF_VOCE_IMPORTO is null " _
                                                   & "   and ID_PRENOTAZIONE_PAGAMENTO in (select ID " _
                                                                                & " from SISCOM_MI.PRENOTAZIONI " _
                                                                                & " where  TIPO_PAGAMENTO=7 " _
                                                                                & "  and ID_STATO>=2 " _
                                                                                & "  and ID_PAGAMENTO is not null )) order by 1 desc"

            End If

            Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()
            While myReader1.Read
                i = i + 1
                If Strings.Right(par.IfNull(myReader1("INIZIO"), 1000), 4) = Now.Year Then
                    ID_ANNO_EF_CORRENTE = par.IfNull(myReader1("ID"), -1)
                End If


            End While
            myReader1.Close()
            par.caricaComboTelerik(par.cmd.CommandText, cmbEsercizio, "ID", "STATO", False)
            '**************************

            '************CHIUSURA CONNESSIONE**********
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
                FlagConnessione = False
            End If

            If i = 1 Then
                Me.cmbEsercizio.Items(0).Selected = True
                Me.cmbEsercizio.Enabled = False
            ElseIf i = 0 Then
                Me.cmbEsercizio.Items.Clear()
                'Me.cmbEsercizio.Items.Add(New ListItem(" ", -1))
                Me.cmbEsercizio.Enabled = False
            End If

            If i > 0 Then
                If ID_ANNO_EF_CORRENTE <> -1 Then
                    Me.cmbEsercizio.SelectedValue = ID_ANNO_EF_CORRENTE
                End If

                FiltraFornitori()
                FiltraAppalti()
                FiltraServizioVoce()
            End If


        Catch ex As Exception
            If FlagConnessione = True Then
                par.cmd.Dispose()
                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            End If

            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../../../Errore.aspx';</script>")

        End Try
    End Sub


    Protected Sub cmbEsercizio_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbEsercizio.SelectedIndexChanged
        FiltraFornitori()
        FiltraAppalti()
        FiltraServizioVoce()
    End Sub

   
End Class

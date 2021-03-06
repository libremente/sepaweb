﻿
Partial Class PED_DatiContratto
    Inherits PageSetIdMode
    Dim par As New CM.Global
    Dim sValoreID As Long
    Dim sValoreUI As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("OPERATORE") = "" Then
            Response.Redirect("~/AccessoNegato.htm", True)
            Exit Sub
        End If

        sValoreID = Request.QueryString("ID")
        sValoreUI = Request.QueryString("UI")

        Try
            If par.OracleConn.State = Data.ConnectionState.Open Then
                Exit Sub
            Else
                par.OracleConn.Open()
                par.SettaCommand(par)
            End If
            Response.Write("<p><font face='Arial'>Codice U.I.: <b>" & sValoreUI & " - Dati Contrattuali</b></font></p>")
            Response.Write("<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='100%' id='AutoNumber1'>")
            Response.Write("<tr>")
            Response.Write("<td width='12%'><b><font face='Arial' size='1'>Cognome</font></b></td>")
            Response.Write("<td width='12%'><b><font face='Arial' size='1'>Nome</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Cod. Fiscale</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Ragione Soc.</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Partita IVA</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Grado Parentela</font></b></td>")
            Response.Write("<td width='12%'><b><font face='Arial' size='1'>Tipo Occupante</font></b></td>")
            Response.Write("<td width='12%'><b><font face='Arial' size='1'>Tipo Titolo</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Data Decorrenza</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Data Sloggio</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Tipo Contr.</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Fascia Redd.</font></b></td>")
            Response.Write("<td width='6%'><b><font face='Arial' size='1'>Note</font></b></td>")
            Response.Write("</tr>")


            par.cmd.CommandText = "select tipologia_titolo.descrizione as ""DTitolo"",tipologia_occupante.descrizione as ""DOccupante"",tipologia_parentela.descrizione as ""DParenti"",anagrafica.cognome,anagrafica.nome,anagrafica.cod_fiscale,anagrafica.partita_iva,anagrafica.ragione_sociale,soggetti_contrattuali.id_contratto as ""Contratto""  from siscom_mi.anagrafica,siscom_mi.unita_contrattuale,siscom_mi.soggetti_contrattuali,siscom_mi.tipologia_parentela,siscom_mi.tipologia_occupante,siscom_mi.tipologia_titolo WHERE soggetti_contrattuali.cod_tipologia_titolo=tipologia_titolo.cod (+) and soggetti_contrattuali.cod_tipologia_occupante=tipologia_occupante.cod (+) and soggetti_contrattuali.cod_tipologia_parentela=tipologia_parentela.cod (+) and soggetti_contrattuali.id_anagrafica=anagrafica.id and unita_contrattuale.id_contratto=soggetti_contrattuali.id_contratto (+) and unita_contrattuale.ID_unita=" & sValoreID
            Dim myReader1 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()
            Do While myReader1.Read()
                Response.Write("<tr>")
                Response.Write("<td width='12%'><font face='Arial' size='1'>" & par.IfNull(myReader1("cognome"), "") & "</font></td>")
                Response.Write("<td width='12%'><font face='Arial' size='1'>" & par.IfNull(myReader1("nome"), "") & "</font></td>")
                Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader1("cod_fiscale"), "") & "</font></td>")
                Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader1("Ragione_sociale"), "") & "</font></td>")
                Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader1("Partita_iva"), "") & "</font></td>")
                Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader1("DParenti"), "") & "</font></td>")
                Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader1("DOccupante"), "") & "</font></td>")
                Response.Write("<td width='12%'><font face='Arial' size='1'>" & par.IfNull(myReader1("DTitolo"), "") & "</font></td>")


                par.cmd.CommandText = "select rapporti_utenza.data_riconsegna,rapporti_utenza.NOTE,FASCIA_REDDITO.DESCRIZIONE AS ""FASCIA"",rapporti_utenza.COD_TIPOLOGIA_CONTR_LOC,rapporti_utenza.data_decorrenza from siscom_mi.FASCIA_REDDITO,siscom_mi.rapporti_utenza where RAPPORTI_UTENZA.COD_FASCIA_REDDITO=FASCIA_REDDITO.COD (+) AND RAPPORTI_UTENZA.id=" & par.IfNull(myReader1("contratto"), "-1")
                Dim myReader2 As Oracle.DataAccess.Client.OracleDataReader = par.cmd.ExecuteReader()
                If myReader2.Read() Then
                    Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.FormattaData(par.IfNull(myReader2("data_decorrenza"), "")) & "</font></td>")
                    Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.FormattaData(par.IfNull(myReader2("data_riconsegna"), "")) & "</font></td>")
                    Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader2("COD_TIPOLOGIA_CONTR_LOC"), "") & "</font></td>")
                    Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader2("FASCIA"), "") & "</font></td>")

                    Response.Write("<td width='6%'><font face='Arial' size='1'>" & par.IfNull(myReader2("NOTE"), "") & "</font></td>")

                Else
                    Response.Write("<td width='6%'><font face='Arial' size='1'>---</font></td>")
                    Response.Write("<td width='6%'><font face='Arial' size='1'>---</font></td>")
                    Response.Write("<td width='6%'><font face='Arial' size='1'>---</font></td>")
                    Response.Write("<td width='6%'><font face='Arial' size='1'>---</font></td>")
                End If

                myReader2.Close()

                Response.Write("</tr>")
            Loop

            myReader1.Close()
            Response.Write("</table>")

            par.cmd.Dispose()
            par.OracleConn.Close()
            Oracle.DataAccess.Client.OracleConnection.ClearAllPools()


        Catch ex As Exception
            Response.Write("ERRORE " & ex.Message)
            If par.OracleConn.State = Data.ConnectionState.Open Then

                par.OracleConn.Close()
                Oracle.DataAccess.Client.OracleConnection.ClearAllPools()
            End If
        End Try


    End Sub
End Class

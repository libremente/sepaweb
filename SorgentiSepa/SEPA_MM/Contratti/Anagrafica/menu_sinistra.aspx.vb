﻿
Partial Class ANAUT_menu_sinistra
    Inherits PageSetIdMode

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("OPERATORE") = "" Then
            Response.Redirect("~/AccessoNegato.htm", True)
            Exit Sub
        End If
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub T1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles T1.SelectedNodeChanged
        If Session.Item("LAVORAZIONE") = "1" Then
            Response.Write("<script>alert('Prima di procedere chiudere la maschera utilizzando la funzione USCITA')</script>")
            Exit Sub
        End If
        Select Case T1.SelectedValue
            Case "Inserimento"
                If Session.Item("FL_ANAGRAFICA") = "1" Then
                    Response.Write("<script>parent.main.location.replace('Inserimento.aspx');</script>")
                Else
                    Response.Write("<script>alert('Operatore non abilitato!')</script>")
                End If
            Case "Ricerca"
                Response.Write("<script>parent.main.location.replace('Ricerca.aspx');</script>")

        End Select
        T1.Nodes(0).Selected = True
    End Sub


End Class

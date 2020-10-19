﻿' TAB RIEPILOGO GENERALE DELLA SCHEDA SAL

Partial Class Tab_SAL_RiepilogoProg
    Inherits UserControlSetIdMode
    Dim PAR As New CM.Global


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("OPERATORE") = "" Then
            Response.Redirect("~/AccessoNegato.htm", True)
            Exit Sub
        End If
        If Not IsPostBack Then


            If CType(Me.Page.FindControl("SOLO_LETTURA"), TextBox).Text = "1" Then
                FrmSolaLettura()
            End If
        End If
    End Sub




    Private Sub FrmSolaLettura()
        Try

            Dim CTRL As Control = Nothing
            For Each CTRL In Me.Controls
                If TypeOf CTRL Is TextBox Then
                    DirectCast(CTRL, TextBox).ReadOnly = True
                ElseIf TypeOf CTRL Is DropDownList Then
                    DirectCast(CTRL, DropDownList).Enabled = False
                End If
            Next
        Catch ex As Exception
            Session.Add("ERRORE", "Provenienza:" & Page.Title & " - " & ex.Message)
            Response.Write("<script>top.location.href='../Errore.aspx';</script>")
            'Me.LblErrore.Visible = True
            'LblErrore.Text = ex.Message
        End Try
    End Sub



End Class
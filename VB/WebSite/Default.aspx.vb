Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxCallbackPanel

Partial Public Class ASPxperience_PopupControl_HowToShowPopupControl_HowToShowPopupControl
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Protected Sub OnListBoxSelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim selectedItem As ListEditItem = DirectCast(sender, ASPxListBox).SelectedItem
        pcPopup.Left = 400
        pcPopup.Top = 600
        pcPopup.Text = String.Format("Selected item chaged:<br /><br /><strong>text</strong>='{0}'<br /><strong>value</strong>={1}<br />", selectedItem.Text, selectedItem.Value)
        pcPopup.ShowOnPageLoad = True
    End Sub

    Protected Sub OnRadioButtonListSelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim selectedItem As ListEditItem = DirectCast(sender, ASPxRadioButtonList).SelectedItem
        pcPopup.Text = String.Format("Selected item chaged:<br /><br /><strong>text</strong>='{0}'<br /><strong>value</strong>={1}<br />", selectedItem.Text, selectedItem.Value)
        pcPopup.ClientSideEvents.Init = "function(s, e) { s.ShowAtElementByID('radioButtonListPopupAnchor'); }"
    End Sub

    Protected Sub OnCallback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        e.Result = String.Format("{0};{1};{2}", spnLeft.Number, spnTop.Number, txtContentText.Text)
    End Sub
End Class

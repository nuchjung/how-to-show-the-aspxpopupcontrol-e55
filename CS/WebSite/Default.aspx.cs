using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxCallbackPanel;

public partial class ASPxperience_PopupControl_HowToShowPopupControl_HowToShowPopupControl : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        
    }

    protected void OnListBoxSelectedIndexChanged(object sender, EventArgs e) {
        ListEditItem selectedItem = ((ASPxListBox)sender).SelectedItem;
        pcPopup.Left = 400;
        pcPopup.Top = 600;
        pcPopup.Text = string.Format("Selected item chaged:<br /><br /><strong>text</strong>='{0}'<br /><strong>value</strong>={1}<br />", selectedItem.Text, selectedItem.Value);
        pcPopup.ShowOnPageLoad = true;
    }

    protected void OnRadioButtonListSelectedIndexChanged(object sender, EventArgs e) {
        ListEditItem selectedItem = ((ASPxRadioButtonList)sender).SelectedItem;
        pcPopup.Text = string.Format("Selected item chaged:<br /><br /><strong>text</strong>='{0}'<br /><strong>value</strong>={1}<br />", selectedItem.Text, selectedItem.Value);
        pcPopup.ClientSideEvents.Init = @"function(s, e) { s.ShowAtElementByID('radioButtonListPopupAnchor'); }";
    }

    protected void OnCallback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        e.Result = string.Format("{0};{1};{2}", spnLeft.Number, spnTop.Number, txtContentText.Text);
    }
}

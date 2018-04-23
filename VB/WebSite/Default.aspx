<%-- BeginRegion Page setup --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="ASPxperience_PopupControl_HowToShowPopupControl_HowToShowPopupControl" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dxcb" %>
<%@ Register Assembly="DevExpress.Web.v7.3" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%-- EndRegion --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>How to Show the ASPxPopupControl</title>
	<%-- BeginRegion CSS --%>
	<style type="text/css">
		body {
			font-family: Tahoma;
			font-size: 9pt;
			color: #111;
		}
		.list {
			list-style: none;
		}
		.list li {
			margin-top: 15px;
		}
		.list li .separator {
			margin-top: 15px;
			height: 1px;
			border-bottom: 1px dashed #ccc;
		}
		#popupAnchor {
			width: 60px;
			height: 60px;
			border: 1px dotted #ccc;
			text-align: center;
		}
		.hint {
			color: #aaa;
		}
		strong.sub {
			color: #6a6a6a;
		}
	</style>
	<%-- EndRegion --%>
	<script type="text/javascript">
		// Client-side popup-API
function OnShowButtonClick(s, e) {
	popup.SetHeaderText("popup.Show()");
	popup.Show();
}
function OnShowAtPosButtonClick(s, e) {
	var popupZone = document.getElementById("popupZone");
	var left = 350;
	var top = 350;
	popup.SetHeaderText("popup.ShowAtPos(" + left + ", " + top + ")");
	popup.ShowAtPos(left, top);
}
function ShowAtElementByID(s, e) {
	popup.SetHeaderText("popup.ShowAtElementByID(\"popupAnchor\")");
	popup.ShowAtElementByID("popupAnchor");
}

// Popup via a client-side event
function OnComboBoxSelectedIndexChanged(s, e) {
	var item = s.GetSelectedItem();
	popup.SetContentHTML(
		"Selected item changed:<br /><br />" +
		"&nbsp;&nbsp;<strong>text=</strong>'" + item.text + "'<br />" +
		"&nbsp;&nbsp;<strong>value</strong>=" + item.value + "<br /><br />");
	popup.ShowAtElementByID("comboPopupAnchor");
}

// Popup notification via a callback
function CallbackComplete(s, e) {
	// result = left;top;content text
	var indexOfFirstSeparator = e.result.indexOf(';');
	var indexOfSecondSeparator = e.result.indexOf(';', indexOfFirstSeparator + 1)

	var left = parseInt(e.result.substring(0, indexOfFirstSeparator));
	var top = parseInt(e.result.substring(indexOfFirstSeparator + 1, indexOfSecondSeparator));
	var contentText = e.result.substr(indexOfSecondSeparator + 1);

	popup.SetHeaderText("Popup notification via callback");
	popup.SetContentHTML(contentText);
	popup.ShowAtPos(left, top);
}
	</script>
</head>
<body>
	<form id="form1" runat="server">


		<%-- Popup Control --%>
		<dxpc:ASPxPopupControl ID="pcPopup" runat="server" ClientInstanceName="popup" EncodeHtml="false">
		</dxpc:ASPxPopupControl>

		<ul class="list">
			<%-- BeginRegion Client-side popup-API --%>
			<li>
				<strong>Client-side popup-API:</strong><br /><br />
				<table>
					<tr>
						<td>
							<dxe:ASPxButton ID="btnShow" runat="server" Text="ASPxClientPopup.Show()" AutoPostBack="False">
								<ClientSideEvents Click="OnShowButtonClick" />
							</dxe:ASPxButton>
						</td>
						<td>
							- shows the ASPxPopupControl at a <strong>last know position</strong> (the default position is (0; 0))
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<dxe:ASPxButton ID="btnShowAtPos" runat="server" Text="ASPxClientPopup.ShowAtPos(int x, int y)" AutoPostBack="False">
								<ClientSideEvents Click="OnShowAtPosButtonClick" />
							</dxe:ASPxButton>
						</td>
						<td>
							- shows the ASPxPopupControl at a point with <strong>absolute coordinates</strong> (350; 350)
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<dxe:ASPxButton ID="btnShowAtElementByID" runat="server" Text="ASPxClientPopup.ShowAtElementByID(string htmlElementID)" AutoPostBack="False">
								<ClientSideEvents Click="ShowAtElementByID" />
							</dxe:ASPxButton>
						</td>
						<td>
							- shows the ASPxPopupControl <strong>on the PopupAnchor element with ID="popupAnchor"</strong>
						</td>
					</tr>
				</table>
			</li>
			<li>
				<table>
					<tr>
						<td id="popupAnchor">
							Popup Anchor
						</td>
					</tr>
				</table>
				<div class="separator"></div>
			</li>
			<%-- EndRegion --%>
			<%-- BeginRegion Popup via a client-side event --%>
			<li>
				<strong>Popup via a client-side event:</strong><br /><br />
				<table>
					<tr>
						<td>
							<dxe:ASPxComboBox ID="cbCombo" runat="server" Width="170px" ClientInstanceName="combo">
								<ClientSideEvents SelectedIndexChanged="OnComboBoxSelectedIndexChanged" />
								<Items>
									<dxe:ListEditItem Text="Item #1" Value="0" />
									<dxe:ListEditItem Text="Item #2" Value="1" />
									<dxe:ListEditItem Text="Item #3" Value="2" />
								</Items>
							</dxe:ASPxComboBox>
						</td>
						<td id="comboPopupAnchor">
							<span class="hint">(select an item)</span>
						</td>
					</tr>
				</table>
				<div class="separator"></div>
			</li>
			<%-- EndRegion --%>
			<%-- BeginRegion Popup via a server-side event --%>
			<li>
				<strong>Popup via a server-side event:</strong><br /><br />
				<strong class="sub">Popup with an absolute position setting on the server side:</strong><br /><br />
				<table>
					<tr>
						<td>
							<dxe:ASPxListBox ID="lbList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="OnListBoxSelectedIndexChanged" Height="70px">
								<Items>
									<dxe:ListEditItem Text="Item #1" Value="0" />
									<dxe:ListEditItem Text="Item #2" Value="1" />
									<dxe:ListEditItem Text="Item #3" Value="2" />
								</Items>
							</dxe:ASPxListBox>
						</td>
						<td>
							<span class="hint">(select an item)</span>
						</td>
					</tr>
				</table>
			</li>
			<li>
				<strong class="sub">Popup on an element with DI="radioButtonListPopupAnchor":</strong><br /><br />
				<table>
					<tr>
						<td>
							<dxe:ASPxRadioButtonList ID="rblRadioButtonList" runat="server" OnSelectedIndexChanged="OnRadioButtonListSelectedIndexChanged" AutoPostBack="True">
								<Items>
									<dxe:ListEditItem Text="Radio Item #1" Value="0" />
									<dxe:ListEditItem Text="Radio Item #2" Value="1" />
								</Items>
							</dxe:ASPxRadioButtonList>
						</td>
						<td id="radioButtonListPopupAnchor">
							<span class="hint">(select an item)</span>
						</td>
					</tr>
				</table>
				<div class="separator"></div>
			</li>
			<%-- EndRegion --%>
			<%-- BeginRegion Popup notification via a callback --%>
			<li>
				<strong>Popup notification via a callback:</strong><br /><br />
				<table>
					<tr>
						<td>
							<dxcb:ASPxCallback ID="clbCallback" runat="server" ClientInstanceName="callback" OnCallback="OnCallback">
								<ClientSideEvents CallbackComplete="CallbackComplete" />
							</dxcb:ASPxCallback>

							<table>
								<tr>
									<td valign="top" style="padding-top: 6px;">
										Popup's left position:
									</td>
									<td>
										<table>
											<tr>
												<td>
													<dxe:ASPxSpinEdit ID="spnLeft" runat="server" Width="60px" Height="21px" Number="600" MinValue="0" MaxValue="2000" AllowNull="False">
													</dxe:ASPxSpinEdit>
												</td>
												<td>
													px
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top" style="padding-top: 6px;">
										Popup's top position:
									</td>
									<td>
										<table>
											<tr>
												<td>
													<dxe:ASPxSpinEdit ID="spnTop" runat="server" Width="60px" Height="21px" Number="500" MinValue="0" MaxValue="2000" AllowNull="False">
													</dxe:ASPxSpinEdit>
												</td>
												<td>
													px
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top" style="padding-top: 6px;">
										Content Text:
									</td>
									<td>
										<dxe:ASPxMemo ID="txtContentText" runat="server" Columns="40" Rows="4" Text="Default Content Text">
										</dxe:ASPxMemo>
									</td>
								</tr>
							</table>
							<br />
							<table style="width: 100%;">
								<tr>
									<td align="center">
										<dxe:ASPxButton ID="btnSendCallback" runat="server" Text="Send Callback" Width="200px" AutoPostBack="False">
											<ClientSideEvents Click="function(s, e) { callback.SendCallback(); }" />
										</dxe:ASPxButton>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</li>
			<%-- EndRegion --%>
		</ul>
	</form>
</body>
</html>

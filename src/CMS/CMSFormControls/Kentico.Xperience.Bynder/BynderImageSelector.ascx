<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BynderImageSelector.ascx.cs" Inherits="CMSFormControls_BynderImageSelector" %>

<script src="https://d8ejoa1fys2rk.cloudfront.net/5.0.5/modules/compactview/bynder-compactview-2-latest.js"></script>

<div id="imagePreview" runat="server" style="max-width: 300px;"></div>

<span id="cvTrigger" runat="server" class="btn-group btn btn-default">Select</span>
<span id="clearTrigger" runat="server" class="btn-group btn btn-default">Clear</span>

<div id="bynderCompactView" runat="server"></div>

<input type="hidden" id="bynderAsset" runat="server" />

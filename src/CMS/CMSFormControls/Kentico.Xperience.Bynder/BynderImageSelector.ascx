<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BynderImageSelector.ascx.cs" Inherits="CMSFormControls_BynderImageSelector" %>

<script src="https://d8ejoa1fys2rk.cloudfront.net/5.0.5/modules/compactview/bynder-compactview-2-latest.js"></script>

<div id="imagePreview" runat="server" style="max-width: 300px;"></div>


<span id="cvTrigger" runat="server" class="btn-group btn btn-default">Select</span>
<span id="clearTrigger" runat="server" class="btn-group btn btn-default">Clear</span>

<div id="bynderCompactview" runat="server"></div>

<input type="hidden" id="imageUrl" runat="server" />

<script type="text/javascript">

    {
        var imageUrlInputId = "<%= this.imageUrl.ClientID %>";
        var imageUrlInput = document.getElementById(imageUrlInputId);

        if (imageUrlInput.value.length > 0) {
            var imagePreviewId = "<%= this.imagePreview.ClientID %>";
            var imagePreview = document.getElementById(imagePreviewId);

            imagePreview.innerHTML = "<img src=" + imageUrlInput.value + " style=\"max-width: 300px; margin-bottom: 16px;\" />";
        }
    }

    function onSuccess(assets, additionalInfo) {
        console.log(assets);

        var imageUrlInputId = "<%= this.imageUrl.ClientID %>";
        var imageUrlInput = document.getElementById(imageUrlInputId);

        var imagePreviewId = "<%= this.imagePreview.ClientID %>";
        var imagePreview = document.getElementById(imagePreviewId);

        if (assets.length < 1) {
            imageUrlInput.value = "";
            imagePreview.innerHtml = "";
        } else {
            var selectedAsset = assets[0];

            var selectedAssetUrl = selectedAsset.files.webImage.url;

            imageUrlInput.value = selectedAssetUrl;
            imagePreview.innerHTML = "<img src=" + selectedAssetUrl + " style=\"max-width: 300px; margin-bottom: 16px;\" />";
        }

        document.getElementById("<%= this.bynderCompactview.ClientID %>").innerHTML = "";
    }

    // Based on https://developer-docs.bynder.com/ui-components
    document
        .getElementById("<%= this.cvTrigger.ClientID %>")
        .addEventListener("click", function () {
            BynderCompactView.open({
                language: "en_US",
                // Renamed from "multi".
                mode: "SingleSelect",
                assetTypes: ["IMAGE"],
                // With `container` set, CV is mounted inside given DOM element
                // instead of opening as a modal dialog.
                container: document.getElementById("<%= this.bynderCompactview.ClientID %>"),
                //portal: { url: "", editable: "" },
                defaultDomain: "kentico.getbynder.com",
                // Selected assets are passed to given `onSuccess` callback which
                // replaces `BynderAddMedia` event.
                // `additionalInfo` argument is only relevant when `mode` is set to
                // `SingleSelectFile`.
                onSuccess: onSuccess
            });
        });

    document
        .getElementById("<%= this.clearTrigger.ClientID %>")
        .addEventListener("click", function () {
            var imageUrlInputId = "<%= this.imageUrl.ClientID %>";
            var imageUrlInput = document.getElementById(imageUrlInputId);

            var imagePreviewId = "<%= this.imagePreview.ClientID %>";
            var imagePreview = document.getElementById(imagePreviewId);

            imageUrlInput.value = "";
            imagePreview.innerHTML = "";
        });

</script>
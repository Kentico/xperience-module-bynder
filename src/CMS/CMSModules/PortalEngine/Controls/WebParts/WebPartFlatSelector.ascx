﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="CMSModules_PortalEngine_Controls_WebParts_WebPartFlatSelector"
     Codebehind="WebPartFlatSelector.ascx.cs" %>
<%@ Register Src="~/CMSAdminControls/UI/UniSelector/UniFlatSelector.ascx" TagName="UniFlatSelector"
    TagPrefix="cms" %>

<script type="text/javascript">

    // Javacript after async postback
    function pageLoad() {
        // Resizes area
        if ($cmsj.isFunction(window.resizearea)) {
            resizearea();
        }

        // Uniflat search
        var timer = null;
        SetupSearch();
    }
</script>

<cms:CMSUpdatePanel runat="server" ID="pnlUpdate" UpdateMode="Conditional">
    <ContentTemplate>
        <cms:UniFlatSelector ID="flatElem" runat="server">
            <HeaderTemplate>
                <div class="SelectorFlatItems">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="SelectorEnvelope">
                    <div class="SelectorFlatImage">
                        <%#PortalHelper.GetIconHtml(EvalGuid("WebPartThumbnailGUID"), ValidationHelper.GetString(Eval("WebPartIconClass"), PortalHelper.DefaultWebPartIconClass))%>
                    </div>
                    <span class="SelectorFlatText">
                        <%#HTMLHelper.HTMLEncode(ResHelper.LocalizeString(Convert.ToString(Eval("WebpartDisplayName"))))%></span>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                <div style="clear: both">
                </div>
                </div>
            </FooterTemplate>
        </cms:UniFlatSelector>
        <div class="selector-flat-description">
            <asp:Literal runat="server" ID="litCategory" EnableViewState="false"></asp:Literal>
        </div>
    </ContentTemplate>
</cms:CMSUpdatePanel>

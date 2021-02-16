using System;

using CMS.Base.Web.UI;
using CMS.FormEngine.Web.UI;


/// <summary>
/// Form component for selecting a Bynder image.
/// Supports single select mode only.
/// </summary>
public partial class CMSFormControls_BynderImageSelector : FormEngineUserControl
{
    private const string MODULE_ID = "Kentico.Xperience.Bynder/BynderImageSelector";


    /// <summary>
    /// Gets or sets the serialized JSON object value of the selected Bynder asset.
    /// </summary>
    public override object Value
    {
        get
        {
            return bynderAsset.Value;
        }
        set
        {
            bynderAsset.Value = value as string;
        }
    }


    /// <summary>
    /// Gets default domain value.
    /// </summary>
    public string DefaultDomain => GetValue("DefaultDomain", string.Empty);


    /// <summary>
    /// Indicates if full modal display mode is used.
    /// </summary>
    public bool UseModalDisplayMode => GetValue("UseModalDisplayMode", false);


    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        ScriptHelper.RegisterModule(this, MODULE_ID, new
        {
            imageUrlId = bynderAsset.ClientID,
            imagePreviewId = imagePreview.ClientID,
            bynderCompactviewId = bynderCompactView.ClientID,
            cvTriggerId = cvTrigger.ClientID,
            clearTriggerId = clearTrigger.ClientID,
            defaultDomain = DefaultDomain,
            useModalDisplayMode = UseModalDisplayMode,
            assetValue = Value
        });
    }
}

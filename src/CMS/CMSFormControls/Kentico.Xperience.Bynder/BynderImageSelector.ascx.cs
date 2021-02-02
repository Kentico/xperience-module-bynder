using System;

using CMS.FormEngine.Web.UI;


/// <summary>
/// Form component for selecting a Bynder image.
/// Supports single select mode only.
/// </summary>
public partial class CMSFormControls_BynderImageSelector : FormEngineUserControl
{
    /// <summary>
    /// Gets or sets the URL of the selected image.
    /// </summary>
    public override object Value
    {
        get
        {
            return imageUrl.Value;
        }
        set
        {
            imageUrl.Value = value as string;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
    }
}

# The Kentico Xperience Bynder module
[![Stack Overflow](https://img.shields.io/badge/Stack%20Overflow-ASK%20NOW-FE7A16.svg?logo=stackoverflow&logoColor=white)](https://stackoverflow.com/tags/kentico)


NuGet package for Xperience administration: [![NuGet](https://img.shields.io/nuget/v/Kentico.Xperience.Recombee.Admin.KX13.svg)](https://www.nuget.org/packages/Kentico.Xperience.Recombee.Admin.KX13/0.0.1-preview)

[Kentico Xperience](https://xperience.io/) form control for selecting images from the [Bynder](https://www.bynder.com/) digital asset management platform (DAM).

This repository contains source code for the module that integrates Kentico Xperience with Bynder digital asset management platform.

## Description
This project contains a Kentico Xperience module that adds the *Bynder image selector* [form control](https://docs.xperience.io/custom-development/extending-the-administration-interface/developing-form-controls) for Xperience administration forms. By assigning the form control to a page type field, users can select and display images stored in the Bynder service when editing pages in the Xperience Pages application.
 
## Requirements and prerequisites
* *Kentico Xperience 13* installed.
  - Both ASP.NET Core and ASP.NET MVC 5 development models are supported.
* URL and credentials to your Bynder portal.
* Basic knowledge of developing ASP .NET MVC 5 applications with Kentico Xperience.

## Installation
1. Open the solution with your administration project (*~/WebApp.sln*).
1. Navigate to the *NuGet Package Manager Console*.
1. Run *Install-Package Kentico.Xperience.Bynder.KX13 -Version 0.1.0*
1. Build the *CMSApp* project.
1. Run the Xperience administration to finish the module installation.

Kentico Bynder module with the Bynder image selector form control is successfully installed.

## Using the form control 
### Xperience administration
To utilize the Bynder integration when editing pages in the Xperience administration, you need to assign the *Bynder image selector* form control to a page type field:

1. Create a new text field for the page type with the following properties:
  * Size: *500*    
  * Form control: *Bynder image selector*
![General](Images/general.PNG)

2. Configure the editing control settings (optional):
  * Default domain - A URL of your Bynder portal. If not specified here, you will be prompted to enter the URL when using the form control (e.g. in the Pages application).
  * Use full size modal display mode - Select to set the display mode of the Bynder dialog to 'Full size modal' (this is recommended). If not selected, the smaller 'In a container' dialog will be used.
![Edit control settings](Images/edit_control_settings.PNG)

3. Copy the code of the page type from the Code tab in the Page types application.

### Live site
You need to paste the generated code of the Page type to your live site project.
1. Supply the Bynder asset URL to the ViewModel:
```c#
public class BynderPreviewViewModel
{
    public string BynderAssetUrl {get; set;}

    public BynderPreviewViewModel(GeneratedPageTypeClass page)
    {
        BynderAssetUrl = !string.IsNullOrEmpty(page.Fields.BynderAsset) ? JObject.Parse(page.Fields.BynderAsset)["assetUrl"].ToString() : null
    }
}
```
2. Edit the view to show the selected image from the Bynder DAM:
```html
@model BynderPreviewViewModel
<div class="BynderAsset">
    <img src="@Model.BynderAssetUrl" alt="Bynder asset image preview" />
</div>
```

## Get involved

Check out the [contributing](CONTRIBUTING.md) page to see how to file issues, start discussions, and begin contributing.

## [Questions & Support](https://github.com/Kentico/Home/blob/master/README.md)

See the [Kentico home repository](https://github.com/Kentico/Home/blob/master/README.md) for more information about the product(s) and general advice on submitting your questions.

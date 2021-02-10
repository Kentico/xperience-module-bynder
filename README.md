# The Kentico Xperience Bynder module
[![Stack Overflow](https://img.shields.io/badge/Stack%20Overflow-ASK%20NOW-FE7A16.svg?logo=stackoverflow&logoColor=white)](https://stackoverflow.com/tags/kentico)

[Bynder](https://www.bynder.com/) for [Kentico Xperience](https://xperience.io/)

This repository contains source code for Kentico Xperience integration with Bynder.

## Description
The project contains module to integrate Kentico Xperience with Bynder using Bynder Image Selector form control. The form control lets you select image from Bynder DAM.

## Requirements and prerequisites
1. *Kentico Xperience 13* installed.
1. Bynder portal with account.
1. Basic knowledge of ASP .NET MVC 5 development with Kentico Xperience.

## Installation
1. Open the solution with your administration project (*~/WebApp.sln*).
1. Navigate to the *NuGet Package Manager Console*.
1. Run *Install-Package Kentico.Xperience.Bynder.KX13 -Version 0.1.0
1. Build the project.
1. Run the Administration to finish module installation.

Kentico Bynder module with Bynder image selector form control is successfully installed.

## Setting up the environment
### Administration
* add new text field, size 500 and with Bynder image selector as form control to page type

![General](Images/general.PNG)
* edit Bynder image selector control settings (optional)
  * Default domain: insert your Bynder portal domain
  * Use full size modal display mode: check to set Bynder display mode to full size modal.

![Edit control settings](Images/edit_control_settings.PNG)
* generate code for page types

### Live site
* copy newly generated page type code to live site
* supply Bynder asset URL to ViewModel
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
* edit view to show selected image from Bynder DAM
```html
@model BynderPreviewViewModel
<div class="BynderAsset">
    <img src="@Model.BynderAssetUrl" alt="Bynder asset image preview" />
</div>
```

## Get involved

Check out the [contributing](CONTRIBUTING.md) page to see the best places to file issues, start discussions, and begin contributing.

## [Questions & Support](https://github.com/Kentico/Home/blob/master/README.md)

See the [Kentico home repository](https://github.com/Kentico/Home/blob/master/README.md) for more information about the product(s), general advice on submitting your questions or directly contacting us.

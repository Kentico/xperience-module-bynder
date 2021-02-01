using System.Linq;

using CMS.DocumentEngine.Types.DancingGoatCore;
using CMS.Helpers;
using CMS.Search;

using Kentico.Content.Web.Mvc;

namespace DancingGoat.Models
{
    public class SearchResultAboutUsItemModel : SearchResultPageItemModel
    {
        public SearchResultAboutUsItemModel(SearchResultItem resultItem, AboutUs aboutUs, AboutUsRepository aboutUsRepository, IPageUrlRetriever pageUrlRetriever)
            : base(resultItem, aboutUs, pageUrlRetriever)
        {
            var sideStories = aboutUsRepository.GetSideStories(aboutUs.NodeAliasPath);
            Content = string.Join(" ", sideStories.Select(story => HTMLHelper.StripTags(story.AboutUsSectionText, false)));
        }
    }
}
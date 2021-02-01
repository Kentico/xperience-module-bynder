using System.Linq;

using CMS.DocumentEngine.Types.DancingGoatCore;
using CMS.Helpers;
using CMS.Search;

using Kentico.Content.Web.Mvc;

namespace DancingGoat.Models
{
    public class SearchResultHomeItemModel : SearchResultPageItemModel
    {
        public SearchResultHomeItemModel(SearchResultItem resultItem, Home home, HomeRepository homeRepository, IPageUrlRetriever pageUrlRetriever)
            : base(resultItem, home, pageUrlRetriever)
        {
            var homeSections = homeRepository.GetHomeSections(home.NodeAliasPath);
            Content = string.Join(" ", homeSections.Select(section => HTMLHelper.StripTags(section.HomeSectionText, false)));
        }
    }
}
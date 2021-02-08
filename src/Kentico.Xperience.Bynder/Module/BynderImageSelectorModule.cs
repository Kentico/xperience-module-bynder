using CMS;

[assembly: AssemblyDiscoverable]

[assembly: RegisterModule(typeof(Kentico.Xperience.Bynder.BynderImageSelectorModule))]

namespace Kentico.Xperience.Bynder
{
    /// <summary>
    /// Represents the Bynder image selector module for the Xperience admin interface.
    /// </summary>
    public class BynderImageSelectorModule : CMS.DataEngine.Module
    {
        public const string NAME = "Kentico.Xperience.Bynder";


        /// <summary>
        /// Initializes a new instance of the <see cref="Module"/> class.
        /// </summary>
        public BynderImageSelectorModule() : base(NAME)
        {
        }


        protected override void OnInit()
        {
            base.OnInit();
        }
    }
}

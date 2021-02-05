using CMS;

[assembly: AssemblyDiscoverable]

[assembly: RegisterModule(typeof(Kentico.Xperience.Bynder.Module))]

namespace Kentico.Xperience.Bynder
{
    /// <summary>
    /// Represents the Bynder image selector module for the Xperience admin interface.
    /// </summary>
    public class Module : CMS.DataEngine.Module
    {
        public const string NAME = "Kentico.Xperience.Bynder";


        /// <summary>
        /// Initializes a new instance of the <see cref="Module"/> class.
        /// </summary>
        public Module() : base(NAME)
        {
        }


        protected override void OnInit()
        {
            base.OnInit();
        }
    }
}

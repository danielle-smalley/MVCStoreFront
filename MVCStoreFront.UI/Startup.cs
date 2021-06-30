using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVCStoreFront.UI.Startup))]
namespace MVCStoreFront.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QLBH_055.Startup))]
namespace QLBH_055
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

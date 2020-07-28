using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Optimization;
using QLBH_055.Models;
using System.Web.Routing;

namespace QLBH_055
{

    public class MvcApplication : System.Web.HttpApplication
    {
        static KHACHHANG obj = new KHACHHANG();
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            AntiForgeryConfig.SuppressXFrameOptionsHeader = true;
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.NameIdentifier;
            //JobScheduler.Start(obj, 2020, 07, 19);
        }

    }
}

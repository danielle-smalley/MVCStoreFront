﻿using MVCStoreFront.UI.Models;
using System.Data.Entity;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace MVCStoreFront.UI
{
    // Note: For instructions on enabling IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=301868
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error()
        {
            //v1:
            //Response.Redirect("~/Errors/Index"); //TODO - fix routing here if diff page
            //v2:
            //Response.Redirect("~/Errors/Unresolved");
            //TODO - uncomment this when ready to launch
        }
    }
}

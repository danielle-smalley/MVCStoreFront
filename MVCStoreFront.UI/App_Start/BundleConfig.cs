﻿using System.Web.Optimization;

namespace MVCStoreFront.UI
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));
            bundles.Add(new ScriptBundle("~/bundles/template").Include("~/Scripts/popper.min.js", "~/Scripts/bootstrap.min.js", "~/Scripts/jquery.magnific-popup.js", "~/Scripts/swiper.min.js", "~/Scripts/mixitup.min.js", "~/Scripts/owl.carousel.min.js", /*"~/Scripts/jquery.nice-select.min.js"*/ "~/Scripts/slick.min.js", "~/Scripts/jquery.counterup.min.js", "~/Scripts/waypoints.min.js", "~/Scripts/contact.js", "~/Scripts/jquery.ajaxchimp.min.js", "~/Scripts/jquery.form.js", "~/Scripts/jquery.validate.min.js", "~/Scripts/mail-script.js", "~/Scripts/DataTables/jquery.dataTables.min.js", "~/Scripts/custom.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/css/bootstrap.min.css", "~/Content/DataTables/css/jquery.dataTables.min.css", "~/Content/css/animate.css", "~/Content/css/owl.carousel.min.css", "~/Content/css/all.css", "~/Content/css/flaticon.css", "~/Content/css/themify-icons.css", "~/Content/css/magnific-popup.css", "~/Content/css/slick.css", "~/Content/css/style.css"));
        }
    }
}

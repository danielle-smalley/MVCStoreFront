using System.Web.Mvc;

namespace MVCStoreFront.UI.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {

            return View();
        }


        public ActionResult Contact()
        {
            //TODO - need to add contact view
            //TODO - need to create ContactViewModel
            //TODO - hook up email
            //TODO - create emailconfirmation.cshtml 
            //TODO - add appsecretkeys.config. Make sure all config files are updated--connections.config, webconfig, etc.
            //TODO - MAKE SURE Github sensitive data gitignore is working--currently is not
            return View();
        }
    }//end class
}//end namespace

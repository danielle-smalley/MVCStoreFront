using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCStoreFront.UI.Exceptions; // added for access to custom exceptions built

namespace MVCStoreFront.UI.Controllers
{
    public class ErrorsController : Controller
    {
        // GET: Errors
        public ActionResult Index()
        {
            return View();
        }//end index

        public ActionResult NotFound()
        {
            return View();
        }

        public ActionResult DBTest()
        {
            //Simulate testing for db connectivity before processing 
            //If it fails, will throw custom error page for logging purposes. Then, it will catch and redirect to a nice custom error page for the user. If it succeeds, perform specific logic
            try
            {
                bool dbCheck = false; //toggle this value for setting test to fail or succeed
                if (dbCheck)
                {
                    return View(); //db works 
                }
                else
                {
                    //db failed, throw custom exception for that event
                    throw new DBOfflineException("Db failed to connect");
                }
            }
            catch (Exception)
            {

                return RedirectToAction("DBOffline"); //handle error nicely and send uesr to a page explaining what happened
            }
        }

        public ActionResult Unresolved()
        {   
            return View();
        }

    }//end class
}//end namespace
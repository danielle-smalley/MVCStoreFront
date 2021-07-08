using System.Web.Mvc;
using MVCStoreFront.UI.Models; //added this using statement so we can access Models
using System; //had to add for our try/catch for Exception
using System.Configuration; //added this so we can update mailmessage to ConfigurationManager instead of our pers info
using System.Net; //added this for client credentials for email
using System.Net.Mail; //added this so we can set up email (mailmessage)

namespace MVCStoreFront.UI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult About()
        {

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            //TODO - hook up email- not working
            //TODO -  Make sure all config files are updated--connections.config, webconfig, etc.
            //TODO - MAKE SURE Github sensitive data gitignore is working--currently is not
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm);
            }

            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br/> {cvm.Message}";

            MailMessage mm = new MailMessage(ConfigurationManager.AppSettings["EmailUser"].ToString(), ConfigurationManager.AppSettings["EmailTo"].ToString(), cvm.Subject, message);

            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            mm.ReplyToList.Add(cvm.Email);

            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["EmailClient"].ToString());
            client.Port = 8889;

            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["EmailUser"].ToString(), ConfigurationManager.AppSettings["EmailPass"].ToString());

            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"Ope. Something went wrong and we couldn't process your request. Please try again later. Error Message: </br> {ex.StackTrace}";
                return View(cvm);
            }

            return View("EmailConfirmation", cvm);
        }//end contact cvm
    }//end class
}//end namespace

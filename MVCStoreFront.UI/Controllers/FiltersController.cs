using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCStoreFront.DATA.EF;
using System.Data.Entity;

namespace MVCStoreFront.UI.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();
        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Serverside() //generate View from here by right clicking and adding. View name Clientside, template of List, Model class Book.(MVC3.DATA.EF), Data context class BookStorePlusEntities, leave boxes unchecked except for use layout
        {
            //var products = db.Products.Include(p => p.ProductName).Include(p => p.ProductCategory).Include(p => p.StockStatus).Include(p => p.Description).Include(p => p.Price).Include(p => p.ItemsPerUnit).Include(p => p.UnitsInStock).Include(p => p.UnitsOnOrder).Include(p => p.UnitsSold);//remember lambda translates to "evaluates to". Ex: include b where b evaluates to BookRoyalty)
            var products = db.Products;


            return View(products.ToList()); //always to list when returning mult objects
        }

        //Below is an action that returns a grid view of Books
        //Add View: Template (List) - Model (Book (Data.EF layer) - Data Context (BookStorePlusEntities)

    }
}
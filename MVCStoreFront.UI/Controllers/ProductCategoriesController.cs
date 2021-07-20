using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MVCStoreFront.DATA.EF;

namespace MVCStoreFront.UI.Controllers
{
    public class ProductCategoriesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: ProductCategories
        public ActionResult Index()
        {
            return View(db.ProductCategories.ToList());
        }
        #region AJAX
        //Building the below to allow for asynchronous functionality.

            //Delete - delete a productcategory record, return only JSON on id & confirm msg
            [AcceptVerbs(HttpVerbs.Post)]
            public JsonResult AjaxDelete(int id)
        {
            ProductCategory productCategory = db.ProductCategories.Find(id);
            db.ProductCategories.Remove(productCategory);
            db.SaveChanges();

            string confirmMessage = string.Format("Deleted Product Category '{0}' from the database", productCategory.CategoryName);
            return Json(new { id = id, message = confirmMessage });
        }

        [HttpGet]
        public PartialViewResult AjaxDetails(int id)
        {
            ProductCategory productCategory = db.ProductCategories.Find(id);
            return PartialView(productCategory);

            //Create a partial view(PublisherDetails.cshtml):
            //Template: Details, Model: publisher (data.ef), Data context: BookStorePlusEntities,
            //Partial view is checked
            //make tweaks to content
        }

        [HttpPost]
        [ValidateAntiForgeryToken] //checks and makes sure the token that was sent from the request (get) is the same
        public JsonResult AjaxCreate(ProductCategory productCategory)
        {
            db.ProductCategories.Add(productCategory);
            db.SaveChanges(); //any time we add or remove, always do .SaveChanges();
            return Json(productCategory);

            //This action creates a new publisher record and returns publisher's data as JSON 
            //Create a partial view (PublisherCreate.cshtml)
            //--template: create for publisher, --data context: BookStorePlusEntities
            //check create as partial view
        }

        [HttpGet]
        public PartialViewResult ProductCategoryEdit(int id)
        {
            ProductCategory productCategory = db.ProductCategories.Find(id);
            return PartialView(productCategory);

            //Create a partial view --> Template: edit, Model: Publisher, data context: BookStoreEntitiesPlus, create as partial view
            //Make adjustments to content
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(ProductCategory productCategory)
        {
            db.Entry(productCategory).State = EntityState.Modified;
            db.SaveChanges();
            return Json(productCategory);
        }

        #endregion



        // GET: ProductCategories/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    ProductCategory productCategory = db.ProductCategories.Find(id);
        //    if (productCategory == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(productCategory);
        //}

        //// GET: ProductCategories/Create
        //[Authorize(Roles = "Admin")]
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: ProductCategories/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult Create([Bind(Include = "CategoryID,CategoryName")] ProductCategory productCategory)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.ProductCategories.Add(productCategory);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(productCategory);
        //}

        //// GET: ProductCategories/Edit/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    ProductCategory productCategory = db.ProductCategories.Find(id);
        //    if (productCategory == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(productCategory);
        //}

        //// POST: ProductCategories/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit([Bind(Include = "CategoryID,CategoryName")] ProductCategory productCategory)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(productCategory).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(productCategory);
        //}

        //// GET: ProductCategories/Delete/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    ProductCategory productCategory = db.ProductCategories.Find(id);
        //    if (productCategory == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(productCategory);
        //}

        //// POST: ProductCategories/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    ProductCategory productCategory = db.ProductCategories.Find(id);
        //    db.ProductCategories.Remove(productCategory);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

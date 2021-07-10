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
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.ProductCategory).Include(p => p.StockStatus);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "CategoryName");
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "Status");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,CategoryID,Description,Price,ItemsPerUnit,UnitsOnOrder,UnitsSold,UnitsInStock,StockStatusID,Image")] Product product, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string imageName = "noImage.png";

                if (image != null)
                {
                    imageName = image.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf(".")); 
                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext; 

                        image.SaveAs(Server.MapPath("~/Content/img/product/" + imageName));

                    }
                    else
                    {
                        imageName = "noImage.png";
                    }
                }

                product.Image = imageName;

                #endregion
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "Status", product.StockStatusID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "Status", product.StockStatusID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,CategoryID,Description,Price,ItemsPerUnit,UnitsOnOrder,UnitsSold,UnitsInStock,StockStatusID,Image")] Product product, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                if (image != null)
                {
                    string imageName = image.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpg", ".jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        image.SaveAs(Server.MapPath("~/Content/img/product/" + imageName));

                        if (product.Image != null && product.Image != "noImage.png")
                        {
                            //delete old/prev file that was uploaded
                            //**THIS DELETE IS PERMANENT**
                            System.IO.File.Delete(Server.MapPath("~/Content/img/product/" + product.Image));
                        }

                        product.Image = imageName;

                    }
                    //else
                    //{
                    //    //do nothing, book img will stay as it was before
                    //}
                }
                #endregion

                //This is the code that saves the updated book record to the DB (scaffolded)
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "Status", product.StockStatusID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            //For a soft delete of a book record, we will change the bookstatus to be discontinued 
            Product product = db.Products.Find(id);

                if (product.Image != null && product.Image != "noImage.png")
                {
                    //delete old/prev file that was uploaded
                    //**THIS DELETE IS PERMANENT**
                    System.IO.File.Delete(Server.MapPath("~/Content/img/product/" + product.Image));
                }

                product.StockStatusID = 4; // status 4 is discontinued 
                product.Image = "noImage.png";
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();

            //Product product = db.Products.Find(id);
            //db.Products.Remove(product);
            //db.SaveChanges();
            return RedirectToAction("Index");
        }

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

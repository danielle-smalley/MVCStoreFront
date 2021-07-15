using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MVCStoreFront.DATA.EF;
using MVCStoreFront.UI.Utilities;
using System.Drawing;
using MVCStoreFront.UI.Models;

namespace MVCStoreFront.UI.Controllers
{
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        //public ActionResult Index()
        //{
        //    var products = db.Products.Include(p => p.ProductCategory).Include(p => p.StockStatus);
        //    return View(products.ToList());
        //}

            public ActionResult Index()
        {
            ViewBag.ProductCategories = db.ProductCategories.Select(x => x.CategoryName).ToList();

            List<Product> products = db.Products.ToList();

            return View(products);
        }

        public ActionResult ProductsGrid() //generate View from here by right clicking and adding. View name Clientside, template of List, Model class Product.(MVC3.DATA.EF), Data context class StoreFrontEntities, leave boxes unchecked except for use layout
        {
            //For custom filtering on Genres
            return View();

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

        #region Add to Cart functionality (called from the details view)
        public ActionResult AddToCart(int qty, int productID)
        {
            //Create an empty shell of a collection for gaining access LOCALLY (in this action) to the Session cart variable
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //Check if the session-cart exists...if so, use it to populate the local shoppingCart

            if (Session["cart"] != null) //global cart
            {
                //Session-cart exists - put its items in the LOCAL shoppingCart
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"]; //in order to gain access to the global variable (cart) we have to unbox it/cast it back to what we need it to be, that's why on the shoppingCart = has the (Dictionary<int, CartItemViewModel>) added. Before adding this, there was an are you missing a cast error
            }
            else
            {
                //if session cart doesn't exist at this point, we need to instantiate it, or New It Up
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            //At this point - we now have a local variable that's ready to add things to it.

            //Find the product they reference by its ID
            Product product = db.Products.Where(p => p.ProductID == productID).FirstOrDefault(); //have to add FirstOrDefault. If we set an object and are very specific with the type of object that it is, use .ToList
            //In the above case, we need to assemble product as the first item coming back so we use FirstOrDefault();
            if (product == null)
            {
                //it's a bad ID, kick them back to some page to try again
                return RedirectToAction("Index");
            }
            else
            {
                //if product is VALID, add the line-item to the cart
                CartItemViewModel item = new CartItemViewModel(qty, product);

                //put item in the local cart BUT if htey have already added that specific product to the cart, then we will only update the qty. This is why we have the dictionary. 

                if (shoppingCart.ContainsKey(product.ProductID)) //containskey is a method we have as part of dictionary
                {
                    shoppingCart[product.ProductID].Qty += qty; //this is adding the quantity the user requested to the qty already in the cart
                }
                else
                {
                    shoppingCart.Add(product.ProductID, item); //if not already in the cart, add to cart 
                }
                //now update the SESSION version of the shoppingCart, so we can maintain that information beteween all of the requests/responses
                Session["cart"] = shoppingCart; //casting from a smaller container to a bigger container, no explicit cast is needed

            }

            //send the user to view their cart items - This action that we are sending the user to is housed in the ShoppingCartController
            return RedirectToAction("Index", "ShoppingCart");//this is routing user to shopping cart controller--added shoppingcartcontroller
        }
        #endregion

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

                    if (goodExts.Contains(ext.ToLower()) && image.ContentLength <= 4194304)
                    {
                        imageName = Guid.NewGuid() + ext;
                        #region Resize Image
                        string savePath = Server.MapPath("~/Content/img/product/");

                        Image convertedImage = Image.FromStream(image.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, imageName, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
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
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,CategoryID,Description,Price,ItemsPerUnit,UnitsOnOrder,UnitsSold,UnitsInStock,StockStatusID,Image")] Product product, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {

                #region File Upload
                string imageName = "noImage.png";

                if (image != null)
                {
                    imageName = image.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpg", ".jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()) && image.ContentLength < 4194304)
                    {
                        imageName = Guid.NewGuid() + ext;

                        string savePath = Server.MapPath("~/Content/img/product/");

                        Image convertedImage = Image.FromStream(image.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, imageName, convertedImage, maxImageSize, maxThumbSize);

                        if (product.Image != null && product.Image != "noImage.png")
                        {
                            //delete old/prev file that was uploaded
                            //**THIS DELETE IS PERMANENT**
                            string path = Server.MapPath("~/Content/img/product/");
                        }

                        product.Image = imageName;

                    }
                    //else
                    //{
                    //    //do nothing, img will stay as it was before
                    //}
                }
                #endregion

                //This is the code that saves the updated product record to the DB (scaffolded)
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
            //For a soft delete of a product record, we will change the stockstatus to be discontinued 
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

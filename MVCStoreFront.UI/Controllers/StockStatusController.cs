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
    public class StockStatusController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: StockStatus
        public ActionResult Index()
        {
            return View(db.StockStatuses.ToList());
        }

        // GET: StockStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockStatus stockStatus = db.StockStatuses.Find(id);
            if (stockStatus == null)
            {
                return HttpNotFound();
            }
            return View(stockStatus);
        }

        // GET: StockStatus/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: StockStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "StockStatusID,Status")] StockStatus stockStatus)
        {
            if (ModelState.IsValid)
            {
                db.StockStatuses.Add(stockStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(stockStatus);
        }

        // GET: StockStatus/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockStatus stockStatus = db.StockStatuses.Find(id);
            if (stockStatus == null)
            {
                return HttpNotFound();
            }
            return View(stockStatus);
        }

        // POST: StockStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "StockStatusID,Status")] StockStatus stockStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(stockStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(stockStatus);
        }

        // GET: StockStatus/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StockStatus stockStatus = db.StockStatuses.Find(id);
            if (stockStatus == null)
            {
                return HttpNotFound();
            }
            return View(stockStatus);
        }

        // POST: StockStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            StockStatus stockStatus = db.StockStatuses.Find(id);
            db.StockStatuses.Remove(stockStatus);
            db.SaveChanges();
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

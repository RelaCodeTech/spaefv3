using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SpaEFV3.Models;

namespace SpaEFV3.Controllers
{
    public class LocationTaxController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /LocationTax/
        public ActionResult Index()
        {
            var location_tax = db.Location_Tax.Include(l => l.Location).Include(l => l.Tax_Master);
            return View(location_tax.ToList());
        }

        // GET: /LocationTax/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location_Tax location_tax = db.Location_Tax.Find(id);
            if (location_tax == null)
            {
                return HttpNotFound();
            }
            return View(location_tax);
        }

        // GET: /LocationTax/Create
        public ActionResult Create()
        {
            ViewBag.Location_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code");
            ViewBag.Tax_ID = new SelectList(db.Tax_Master, "Tax_ID", "Tax_Short_Name");
            return View();
        }

        // POST: /LocationTax/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Location_Tax_ID,Location_ID,Tax_ID,Tax_Value")] Location_Tax location_tax)
        {
            if (ModelState.IsValid)
            {
                db.Location_Tax.Add(location_tax);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Location_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code", location_tax.Location_ID);
            ViewBag.Tax_ID = new SelectList(db.Tax_Master, "Tax_ID", "Tax_Short_Name", location_tax.Tax_ID);
            return View(location_tax);
        }

        // GET: /LocationTax/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location_Tax location_tax = db.Location_Tax.Find(id);
            if (location_tax == null)
            {
                return HttpNotFound();
            }
            ViewBag.Location_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code", location_tax.Location_ID);
            ViewBag.Tax_ID = new SelectList(db.Tax_Master, "Tax_ID", "Tax_Short_Name", location_tax.Tax_ID);
            return View(location_tax);
        }

        // POST: /LocationTax/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Location_Tax_ID,Location_ID,Tax_ID,Tax_Value")] Location_Tax location_tax)
        {
            if (ModelState.IsValid)
            {
                db.Entry(location_tax).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Location_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code", location_tax.Location_ID);
            ViewBag.Tax_ID = new SelectList(db.Tax_Master, "Tax_ID", "Tax_Short_Name", location_tax.Tax_ID);
            return View(location_tax);
        }

        // GET: /LocationTax/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location_Tax location_tax = db.Location_Tax.Find(id);
            if (location_tax == null)
            {
                return HttpNotFound();
            }
            return View(location_tax);
        }

        // POST: /LocationTax/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Location_Tax location_tax = db.Location_Tax.Find(id);
            db.Location_Tax.Remove(location_tax);
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

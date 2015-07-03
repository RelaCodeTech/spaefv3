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
    public class TreatmentInventoryUsageController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /TreatmentInventoryUsage/
        public ActionResult Index()
        {
            var treatment_inventory_usage = db.Treatment_Inventory_Usage.Include(t => t.Product).Include(t => t.Treatment);
            return View(treatment_inventory_usage.ToList());
        }

        // GET: /TreatmentInventoryUsage/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Treatment_Inventory_Usage treatment_inventory_usage = db.Treatment_Inventory_Usage.Find(id);
            if (treatment_inventory_usage == null)
            {
                return HttpNotFound();
            }
            return View(treatment_inventory_usage);
        }

        // GET: /TreatmentInventoryUsage/Create
        public ActionResult Create()
        {
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name");
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name");
            return View();
        }

        // POST: /TreatmentInventoryUsage/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Treatment_ID,Product_ID,Qty_Used")] Treatment_Inventory_Usage treatment_inventory_usage)
        {
            if (ModelState.IsValid)
            {
                db.Treatment_Inventory_Usage.Add(treatment_inventory_usage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name", treatment_inventory_usage.Product_ID);
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name", treatment_inventory_usage.Treatment_ID);
            return View(treatment_inventory_usage);
        }

        // GET: /TreatmentInventoryUsage/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Treatment_Inventory_Usage treatment_inventory_usage = db.Treatment_Inventory_Usage.Find(id);
            if (treatment_inventory_usage == null)
            {
                return HttpNotFound();
            }
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name", treatment_inventory_usage.Product_ID);
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name", treatment_inventory_usage.Treatment_ID);
            return View(treatment_inventory_usage);
        }

        // POST: /TreatmentInventoryUsage/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Treatment_ID,Product_ID,Qty_Used")] Treatment_Inventory_Usage treatment_inventory_usage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(treatment_inventory_usage).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Product_ID = new SelectList(db.Products, "Product_ID", "Product_Name", treatment_inventory_usage.Product_ID);
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name", treatment_inventory_usage.Treatment_ID);
            return View(treatment_inventory_usage);
        }

        // GET: /TreatmentInventoryUsage/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Treatment_Inventory_Usage treatment_inventory_usage = db.Treatment_Inventory_Usage.Find(id);
            if (treatment_inventory_usage == null)
            {
                return HttpNotFound();
            }
            return View(treatment_inventory_usage);
        }

        // POST: /TreatmentInventoryUsage/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Treatment_Inventory_Usage treatment_inventory_usage = db.Treatment_Inventory_Usage.Find(id);
            db.Treatment_Inventory_Usage.Remove(treatment_inventory_usage);
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

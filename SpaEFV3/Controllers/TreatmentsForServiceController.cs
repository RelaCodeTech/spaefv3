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
    public class TreatmentsForServiceController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /TreatmentsForService/
        public ActionResult Index()
        {
            var xref_service_treatment = db.Xref_Service_Treatment.Include(x => x.Service).Include(x => x.Treatment);
            return View(xref_service_treatment.ToList());
        }

        // GET: /TreatmentsForService/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xref_Service_Treatment xref_service_treatment = db.Xref_Service_Treatment.Find(id);
            if (xref_service_treatment == null)
            {
                return HttpNotFound();
            }
            return View(xref_service_treatment);
        }

        // GET: /TreatmentsForService/Create
        public ActionResult Create()
        {
            ViewBag.Service_ID = new SelectList(db.Services, "Service_ID", "Service_Name");
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name");
            return View();
        }

        // POST: /TreatmentsForService/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Service_Treatment_Xref_ID,Service_ID,Treatment_ID")] Xref_Service_Treatment xref_service_treatment)
        {
            if (ModelState.IsValid)
            {
                db.Xref_Service_Treatment.Add(xref_service_treatment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Service_ID = new SelectList(db.Services, "Service_ID", "Service_Name", xref_service_treatment.Service_ID);
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name", xref_service_treatment.Treatment_ID);
            return View(xref_service_treatment);
        }

        // GET: /TreatmentsForService/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xref_Service_Treatment xref_service_treatment = db.Xref_Service_Treatment.Find(id);
            if (xref_service_treatment == null)
            {
                return HttpNotFound();
            }
            ViewBag.Service_ID = new SelectList(db.Services, "Service_ID", "Service_Name", xref_service_treatment.Service_ID);
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name", xref_service_treatment.Treatment_ID);
            return View(xref_service_treatment);
        }

        // POST: /TreatmentsForService/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Service_Treatment_Xref_ID,Service_ID,Treatment_ID")] Xref_Service_Treatment xref_service_treatment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(xref_service_treatment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Service_ID = new SelectList(db.Services, "Service_ID", "Service_Name", xref_service_treatment.Service_ID);
            ViewBag.Treatment_ID = new SelectList(db.Treatments, "Treatment_ID", "Treatment_Name", xref_service_treatment.Treatment_ID);
            return View(xref_service_treatment);
        }

        // GET: /TreatmentsForService/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xref_Service_Treatment xref_service_treatment = db.Xref_Service_Treatment.Find(id);
            if (xref_service_treatment == null)
            {
                return HttpNotFound();
            }
            return View(xref_service_treatment);
        }

        // POST: /TreatmentsForService/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Xref_Service_Treatment xref_service_treatment = db.Xref_Service_Treatment.Find(id);
            db.Xref_Service_Treatment.Remove(xref_service_treatment);
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

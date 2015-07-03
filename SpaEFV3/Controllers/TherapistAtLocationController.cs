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
    public class TherapistAtLocationController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /TherapistAtLocation/
        public ActionResult Index()
        {
            var xref_location_therapist = db.Xref_Location_Therapist.Include(x => x.Location).Include(x => x.Therapist);
            return View(xref_location_therapist.ToList());
        }

        // GET: /TherapistAtLocation/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xref_Location_Therapist xref_location_therapist = db.Xref_Location_Therapist.Find(id);
            if (xref_location_therapist == null)
            {
                return HttpNotFound();
            }
            return View(xref_location_therapist);
        }

        // GET: /TherapistAtLocation/Create
        public ActionResult Create()
        {
            ViewBag.Loc_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code");
            ViewBag.Therapist_ID = new SelectList(db.Therapists, "Therapist_ID", "Therapist_FName");
            return View();
        }

        // POST: /TherapistAtLocation/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Loc_Ther_Xref_ID,Loc_ID,Therapist_ID")] Xref_Location_Therapist xref_location_therapist)
        {
            if (ModelState.IsValid)
            {
                db.Xref_Location_Therapist.Add(xref_location_therapist);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Loc_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code", xref_location_therapist.Loc_ID);
            ViewBag.Therapist_ID = new SelectList(db.Therapists, "Therapist_ID", "Therapist_FName", xref_location_therapist.Therapist_ID);
            return View(xref_location_therapist);
        }

        // GET: /TherapistAtLocation/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xref_Location_Therapist xref_location_therapist = db.Xref_Location_Therapist.Find(id);
            if (xref_location_therapist == null)
            {
                return HttpNotFound();
            }
            ViewBag.Loc_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code", xref_location_therapist.Loc_ID);
            ViewBag.Therapist_ID = new SelectList(db.Therapists, "Therapist_ID", "Therapist_FName", xref_location_therapist.Therapist_ID);
            return View(xref_location_therapist);
        }

        // POST: /TherapistAtLocation/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Loc_Ther_Xref_ID,Loc_ID,Therapist_ID")] Xref_Location_Therapist xref_location_therapist)
        {
            if (ModelState.IsValid)
            {
                db.Entry(xref_location_therapist).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Loc_ID = new SelectList(db.Locations, "Loc_ID", "Loc_Code", xref_location_therapist.Loc_ID);
            ViewBag.Therapist_ID = new SelectList(db.Therapists, "Therapist_ID", "Therapist_FName", xref_location_therapist.Therapist_ID);
            return View(xref_location_therapist);
        }

        // GET: /TherapistAtLocation/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xref_Location_Therapist xref_location_therapist = db.Xref_Location_Therapist.Find(id);
            if (xref_location_therapist == null)
            {
                return HttpNotFound();
            }
            return View(xref_location_therapist);
        }

        // POST: /TherapistAtLocation/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Xref_Location_Therapist xref_location_therapist = db.Xref_Location_Therapist.Find(id);
            db.Xref_Location_Therapist.Remove(xref_location_therapist);
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

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
    public class TherapistController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /Therapist/
        public ActionResult Index()
        {
            return View(db.Therapists.ToList());
        }

        // GET: /Therapist/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Therapist therapist = db.Therapists.Find(id);
            if (therapist == null)
            {
                return HttpNotFound();
            }
            return View(therapist);
        }

        // GET: /Therapist/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Therapist/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Therapist_ID,Therapist_FName,Therapist_LName,Therapist_Gender,Therapist_ContactNo,Therapist_Is_Active,Therapist_Created_Dt,Therapist_Updated_Dt")] Therapist therapist)
        {
            if (ModelState.IsValid)
            {
                db.Therapists.Add(therapist);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(therapist);
        }

        // GET: /Therapist/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Therapist therapist = db.Therapists.Find(id);
            if (therapist == null)
            {
                return HttpNotFound();
            }
            return View(therapist);
        }

        // POST: /Therapist/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Therapist_ID,Therapist_FName,Therapist_LName,Therapist_Gender,Therapist_ContactNo,Therapist_Is_Active,Therapist_Created_Dt,Therapist_Updated_Dt")] Therapist therapist)
        {
            if (ModelState.IsValid)
            {
                db.Entry(therapist).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(therapist);
        }

        // GET: /Therapist/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Therapist therapist = db.Therapists.Find(id);
            if (therapist == null)
            {
                return HttpNotFound();
            }
            return View(therapist);
        }

        // POST: /Therapist/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Therapist therapist = db.Therapists.Find(id);
            db.Therapists.Remove(therapist);
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

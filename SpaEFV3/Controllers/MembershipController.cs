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
    public class MembershipController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /Membership/
        public ActionResult Index()
        {
            var membership_master = db.Membership_Master.Include(m => m.Business_Details).Include(m => m.Business);
            return View(membership_master.ToList());
        }

        // GET: /Membership/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Membership_Master membership_master = db.Membership_Master.Find(id);
            if (membership_master == null)
            {
                return HttpNotFound();
            }
            return View(membership_master);
        }

        // GET: /Membership/Create
        public ActionResult Create()
        {
            ViewBag.Business_ID = new SelectList(db.Business_Details, "Business_ID", "Business_Address");
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name");
            return View();
        }

        // POST: /Membership/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Membership_ID,Business_ID,Membership_Type,Membership_Amount,Membership_Validity,Membership_Desc")] Membership_Master membership_master)
        {
            if (ModelState.IsValid)
            {
                db.Membership_Master.Add(membership_master);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Business_ID = new SelectList(db.Business_Details, "Business_ID", "Business_Address", membership_master.Business_ID);
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", membership_master.Business_ID);
            return View(membership_master);
        }

        // GET: /Membership/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Membership_Master membership_master = db.Membership_Master.Find(id);
            if (membership_master == null)
            {
                return HttpNotFound();
            }
            ViewBag.Business_ID = new SelectList(db.Business_Details, "Business_ID", "Business_Address", membership_master.Business_ID);
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", membership_master.Business_ID);
            return View(membership_master);
        }

        // POST: /Membership/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Membership_ID,Business_ID,Membership_Type,Membership_Amount,Membership_Validity,Membership_Desc")] Membership_Master membership_master)
        {
            if (ModelState.IsValid)
            {
                db.Entry(membership_master).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Business_ID = new SelectList(db.Business_Details, "Business_ID", "Business_Address", membership_master.Business_ID);
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", membership_master.Business_ID);
            return View(membership_master);
        }

        // GET: /Membership/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Membership_Master membership_master = db.Membership_Master.Find(id);
            if (membership_master == null)
            {
                return HttpNotFound();
            }
            return View(membership_master);
        }

        // POST: /Membership/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Membership_Master membership_master = db.Membership_Master.Find(id);
            db.Membership_Master.Remove(membership_master);
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

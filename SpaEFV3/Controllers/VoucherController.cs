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
    public class VoucherController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /Voucher/
        public ActionResult Index()
        {
            var voucher_master = db.Voucher_Master.Include(v => v.Business);
            return View(voucher_master.ToList());
        }

        // GET: /Voucher/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Voucher_Master voucher_master = db.Voucher_Master.Find(id);
            if (voucher_master == null)
            {
                return HttpNotFound();
            }
            return View(voucher_master);
        }

        // GET: /Voucher/Create
        public ActionResult Create()
        {
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name");
            return View();
        }

        // POST: /Voucher/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include="Voucher_ID,Voucher_Amount,Voucher_Created_Dt,Voucher_Expiry_Dt,Voucher_Created_By,Business_ID,Voucher_Code,Voucher_Description,Voucher_Start_Dt")] Voucher_Master voucher_master)
        public ActionResult Create([Bind(Include = "Business_ID,Voucher_Code,Voucher_Amount,Voucher_Description,Voucher_Start_Dt,Voucher_Expiry_Dt")] Voucher_Master voucher_master)
        {
            if (ModelState.IsValid)
            {
                //sets create date time as now
                voucher_master.Voucher_Created_Dt = System.DateTime.Now;

                voucher_master.Voucher_Created_By = Session["LoggedInUser"].ToString();

                db.Voucher_Master.Add(voucher_master);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", voucher_master.Business_ID);
            return View(voucher_master);
        }

        // GET: /Voucher/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Voucher_Master voucher_master = db.Voucher_Master.Find(id);
            if (voucher_master == null)
            {
                return HttpNotFound();
            }
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", voucher_master.Business_ID);
            return View(voucher_master);
        }

        // POST: /Voucher/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Voucher_ID,Voucher_Amount,Voucher_Created_Dt,Voucher_Expiry_Dt,Voucher_Created_By,Business_ID,Voucher_Code,Voucher_Description,Voucher_Start_Dt")] Voucher_Master voucher_master)
        {
            if (ModelState.IsValid)
            {
                db.Entry(voucher_master).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", voucher_master.Business_ID);
            return View(voucher_master);
        }

        // GET: /Voucher/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Voucher_Master voucher_master = db.Voucher_Master.Find(id);
            if (voucher_master == null)
            {
                return HttpNotFound();
            }
            return View(voucher_master);
        }

        // POST: /Voucher/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Voucher_Master voucher_master = db.Voucher_Master.Find(id);
            db.Voucher_Master.Remove(voucher_master);
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

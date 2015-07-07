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
    public class LocationController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /Location/
        public ActionResult Index()
        {
            if (Session["LoggedInUser"] == null || String.IsNullOrEmpty(Session["LoggedInUser"].ToString()))
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                string LoggedInUser = Session["LoggedInUser"].ToString();

                //original - gets all locations
                //var locations = db.Locations.Include(l => l.Business).Include(l => l.LookUp_LocationRegion);

                //added filter to get locations which are associated with logged in user
                var locations = db.Locations.
                                    //Include(l => l.Business).
                                    //Include(l => l.LookUp_LocationRegion).
                                    Where(m => m.User_Location_Access.Any(p => p.User_ID.Equals(LoggedInUser)));

                return View(locations.ToList());
            }

        }

        // GET: /Location/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // GET: /Location/Create
        public ActionResult Create()
        {
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name");
            ViewBag.Loc_Region = new SelectList(db.LookUp_LocationRegion, "Region_Name", "Region_Name");
            return View();
        }

        // POST: /Location/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Loc_ID,Business_ID,Loc_Code,Loc_Region,Loc_Name,Loc_Hotel_Name,Loc_Spa_Name,Loc_Address,Loc_City,Loc_State,Loc_Country,Loc_ContactNo,Loc_Comment,Loc_Is_Active,Loc_Created_Dt,Loc_Updated_Dt")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Locations.Add(location);

                try
                {
                    db.SaveChanges();
                }
                catch (Exception ee)
                {
                    throw ee;
                }

                return RedirectToAction("Index");
            }

            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", location.Business_ID);
            ViewBag.Loc_Region = new SelectList(db.LookUp_LocationRegion, "Region_Name", "Region_Name", location.Loc_Region);
            return View(location);
        }

        // GET: /Location/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", location.Business_ID);
            ViewBag.Loc_Region = new SelectList(db.LookUp_LocationRegion, "Region_Name", "Region_Name", location.Loc_Region);
            return View(location);
        }

        // POST: /Location/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Loc_ID,Business_ID,Loc_Code,Loc_Region,Loc_Name,Loc_Hotel_Name,Loc_Spa_Name,Loc_Address,Loc_City,Loc_State,Loc_Country,Loc_ContactNo,Loc_Comment,Loc_Is_Active,Loc_Created_Dt,Loc_Updated_Dt")] Location location)
        {
            if (ModelState.IsValid)
            {
                db.Entry(location).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Business_ID = new SelectList(db.Businesses, "Business_ID", "Business_Name", location.Business_ID);
            ViewBag.Loc_Region = new SelectList(db.LookUp_LocationRegion, "Region_Name", "Comment", location.Loc_Region);
            return View(location);
        }

        // GET: /Location/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Location location = db.Locations.Find(id);
            if (location == null)
            {
                return HttpNotFound();
            }
            return View(location);
        }

        // POST: /Location/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Location location = db.Locations.Find(id);
            db.Locations.Remove(location);
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

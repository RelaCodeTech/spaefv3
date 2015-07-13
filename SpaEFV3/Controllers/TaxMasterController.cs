using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SpaEFV3.Models;
using System.Web.Script.Serialization;
using AutoMapper;
using SpaEFV3.ViewModels.TaxMaster;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace SpaEFV3.Controllers
{
    public class TaxMasterController : Controller
    {
        private DevSpaEntities db = new DevSpaEntities();

        // GET: /TaxMaster/
        public ActionResult Index()
        {
            var tax_master = db.Tax_Master.Include(t => t.LookUp_Country);

            //normal data
            //return View(tax_master.ToList());

            //using Automapper
            AutoMapper.Mapper.CreateMap<Tax_Master, TaxMasterListViewModel>();

            IList<TaxMasterListViewModel> TaxMasterViewModelList =
            AutoMapper.Mapper.Map<IQueryable<Tax_Master>, IList<TaxMasterListViewModel>>(db.Tax_Master.Include(t => t.LookUp_Country));

            //converts object to string but fails due to reference loop error
            //var json = new JavaScriptSerializer().Serialize(TaxMasterViewModelList);

            TaxMasterIndexVM TaxMasterData = new TaxMasterIndexVM();
            TaxMasterData.TaxMasterList = TaxMasterViewModelList;
            TaxMasterData.NewTax = new TaxMasterListViewModel();
            //TaxMasterData.NewTax.CountryList = db.LookUp_Country.To

            //return TaxMasterIndexVM
            return View(TaxMasterData);

            //ListViewModel data
            //return View(TaxMasterViewModelList);

            //to work with AngularJs
            //return View(json);

            //serialize object
            //var TMData = SerializeObject(TaxMasterViewModelList);
            //return View(TMData);
        }

        /// <summary>
        /// serialize object to json
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public IHtmlString SerializeObject(object value)
        {
            using (var stringWriter = new StringWriter())
            using (var jsonWriter = new JsonTextWriter(stringWriter))
            {
                var serializer = new JsonSerializer
                {
                    // Let's use camelCasing as is common practice in JavaScript
                    //ContractResolver = new CamelCasePropertyNamesContractResolver()
                };

                // We don't want quotes around object names
                jsonWriter.QuoteName = false;
                serializer.Serialize(jsonWriter, value);

                return new HtmlString(stringWriter.ToString());
            }
        }

        // GET: /TaxMaster/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tax_Master tax_master = db.Tax_Master.Find(id);
            if (tax_master == null)
            {
                return HttpNotFound();
            }
            return View(tax_master);
        }

        // GET: /TaxMaster/Create
        public ActionResult Create()
        {
            ViewBag.Country_ID = new SelectList(db.LookUp_Country, "Country_ID", "Country_Name");
            return View();
        }

        // POST: /TaxMaster/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Tax_ID,Country_ID,Tax_Short_Name,Tax_Description")] Tax_Master tax_master)
        {
            if (ModelState.IsValid)
            {
                db.Tax_Master.Add(tax_master);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Country_ID = new SelectList(db.LookUp_Country, "Country_ID", "Country_Name", tax_master.Country_ID);
            return View(tax_master);
        }

        // GET: /TaxMaster/Create
        public ActionResult CreateNew()
        {
            ViewBag.Country_ID = new SelectList(db.LookUp_Country, "Country_ID", "Country_Name");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNew([Bind(Include = "Tax_ID,Country_ID,Tax_Short_Name,Tax_Description")] TaxMasterListViewModel NewTaxData)
        {
            //using Automapper
            AutoMapper.Mapper.CreateMap<TaxMasterListViewModel, Tax_Master>();

            Tax_Master NewTax =
            AutoMapper.Mapper.Map<TaxMasterListViewModel, Tax_Master>(NewTaxData);


            if (ModelState.IsValid)
            {
                db.Tax_Master.Add(NewTax);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");

        }


        // GET: /TaxMaster/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tax_Master tax_master = db.Tax_Master.Find(id);
            if (tax_master == null)
            {
                return HttpNotFound();
            }
            ViewBag.Country_ID = new SelectList(db.LookUp_Country, "Country_ID", "Country_Name", tax_master.Country_ID);
            return View(tax_master);
        }

        // POST: /TaxMaster/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Tax_ID,Country_ID,Tax_Short_Name,Tax_Description")] Tax_Master tax_master)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tax_master).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Country_ID = new SelectList(db.LookUp_Country, "Country_ID", "Country_Name", tax_master.Country_ID);
            return View(tax_master);
        }

        // GET: /TaxMaster/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tax_Master tax_master = db.Tax_Master.Find(id);
            if (tax_master == null)
            {
                return HttpNotFound();
            }
            return View(tax_master);
        }

        // POST: /TaxMaster/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tax_Master tax_master = db.Tax_Master.Find(id);
            db.Tax_Master.Remove(tax_master);
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SpaEFV3.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// General user view
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// User Logs in
        /// </summary>
        /// <returns></returns>
        public ActionResult Welcome()
        {
            return View();
        }
	}
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class ServiceController : Controller
    {
        // GET: Service
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SurgicalServices()
        {
            return View();
        }

        public ActionResult PreventativeServices()
        {
            return View();
        }
        public ActionResult AdditionalServices()
        {
            return View();
        }
        public ActionResult PatientMonitoring()
        {
            return View();
        }
        public ActionResult PetWellness()
        {
            return View();
        }

        public ActionResult NutritionalCounselings()
        {
            return View();
        }
        public ActionResult Grooming()
        {
            return View();
        }
        public ActionResult ScreeningTest()
        {
            return View();
        }
        public ActionResult PetSupplies()
        {
            return View();
        }
    }
}
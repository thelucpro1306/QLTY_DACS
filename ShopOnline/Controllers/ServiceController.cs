using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class ServiceController : Controller
    {
        OnlineShopDBContext db = new OnlineShopDBContext();
        // GET: Service
        public ActionResult Index()
        {
            var model = db.Services.ToList();
            return View(model);
        }

        public ActionResult Service_3()
        {
            return View();
        }

        public ActionResult Service_1()
        {
            return View();
        }
        public ActionResult Service_2()
        {
            return View();
        }
        public ActionResult Service_4()
        {
            return View();
        }
        public ActionResult Service_5()
        {
            return View();
        }

        public ActionResult Service_6()
        {
            return View();
        }
        public ActionResult Service_7()
        {
            return View();
        }
        public ActionResult Service_8()
        {
            return View();
        }
        //public ActionResult PetSupplies()
        //{
        //    return View();
        //}
    }
}
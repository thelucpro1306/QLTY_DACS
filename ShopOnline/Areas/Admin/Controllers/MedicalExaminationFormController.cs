using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Areas.Admin.Controllers
{
    public class MedicalExaminationFormController : Controller
    {
        OnlineShopDBContext db = new OnlineShopDBContext();
        // GET: Admin/MedicalExaminationForm
        public ActionResult Index()
        {           



            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult SearchAppointment(string searchString)
        {
            var dao = new AppoimentDao();
            var list = dao.SearchAppointment(searchString);
            ViewBag.SearchString = searchString;
            return View(list);
            
        }

    }
}
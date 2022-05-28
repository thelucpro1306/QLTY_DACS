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
            MedicalExaminationForm form = new MedicalExaminationForm();
            form.list = db.Clients.ToList();
            return View(form);
        }


    }
}
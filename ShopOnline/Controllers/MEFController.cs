using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class MEFController : Controller
    {
        OnlineShopDBContext db = new OnlineShopDBContext();
        // GET: MEF
        public ActionResult Index(long? id)
        {
            if(id == null)
            {
                return HttpNotFound();
            }    
            //var session = (Common.UserLogin)Session["USER_SESSION"];
            //if (session == null)
            //{
            //    return RedirectToAction("login", "user");
            //}
            //var client = new ClientDao().getClientByUserId(session.ID);
            var DMEF = db.DeltailsMedicalForms.Where(p => p.MedicalExaminationForm.id == id /*&& p.MedicalExaminationForm.ClientId == client.id*/).FirstOrDefault();
            TempData["MEF"] = DMEF.MedicalExaminationForm;
            var toaThuoc = db.CTToaThuocs.Where(p => p.DonThuoc.id_Form == DMEF.id_Form).ToList();
            ViewBag.ToaThuoc = toaThuoc;
            var model = db.CacDichVuDaSuDungs.Where(p => p.Id_MEF == DMEF.MedicalExaminationForm.id).ToList();
            var service = model.Distinct().ToList();
            ViewBag.Service = service;
            ViewBag.Tongtien = TempData["ToIndex"];
            return View(DMEF);
        }




        

    }
}
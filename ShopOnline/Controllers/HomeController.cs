using Model.DAO;
using Model.EF;
using ShopOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class HomeController : Controller
    {
        OnlineShopDBContext context = new OnlineShopDBContext();
        // GET: Home
        public ActionResult Index()
        {

            Appointment apointment = new Appointment();
            apointment.list = context.Services.ToList();    
            
            return View(apointment);
        }

        [HttpPost]
        public ActionResult Index(Appointment model)
        {
            var session = (ShopOnline.Common.UserLogin)Session[ShopOnline.Common.ConstantsCommon.USER_SESSION];
            if(session == null)
            {
                return RedirectToAction("Login", "user");
            }
            var client = new UserDao().getClientById(session.ID);
            if (ModelState.IsValid)
            {
                Appointment appointmentModel = new Appointment();
                appointmentModel.Name = model.Name;
                appointmentModel.Email = model.Email;
                appointmentModel.Phone = model.Phone;
                
                appointmentModel.Note = model.Note;
                appointmentModel.status = -1;
                appointmentModel.BookingDate = model.BookingDate;
                appointmentModel.DateCreate = DateTime.Now;
                appointmentModel.ServicesId = model.ServicesId;
                appointmentModel.ClientID = client.id;
                model.list = context.Services.ToList();
                var dt = model.BookingDate;
                var dtnow = DateTime.Now;
                var res = DateTime.Compare((DateTime)dt,dtnow);
                if (res<0 || res == 0)
                {
                    ModelState.AddModelError("", "please, check your clinic date ( the date must be higher than the present day) ");
                    return View(model);
                }                
                AppoimentDao dao = new AppoimentDao();
                var rs = dao.Insert(appointmentModel);
                if(rs > 0)
                {
                        ViewBag.Success = "Success!";
                    return RedirectToAction("Index","Thanks");                
                }
                else
                {
                    ModelState.AddModelError("","Error");
                }
            }            
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListByGroupID(1);
            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult Footer()
        {
            return PartialView();
        }

    }
}
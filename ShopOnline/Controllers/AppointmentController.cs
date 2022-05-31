using Model.DAO;
using Model.EF;
using ShopOnline.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Controllers
{
    public class AppointmentController : Controller
    {
        OnlineShopDBContext context = new OnlineShopDBContext();
        // GET: Appointment
        public ActionResult Index(long? id)
        {
            var session = (ShopOnline.Common.UserLogin)Session[ShopOnline.Common.ConstantsCommon.USER_SESSION];
            if (session == null)
            {
                return RedirectToAction("login", "user");
            }
            Apointment apointment = new Apointment();
            apointment.list = context.Servicesses.ToList();
            if(id.HasValue)
            {
                var dao = new ServicesDao().GetServicessById(id);
                Session[ConstantsCommon.SERVICES_SESSION] = null;
                ViewBag.id = dao;
                var ServicesId = new UserServices();
                ServicesId.ID = dao.id;
                Session.Add(ConstantsCommon.SERVICES_SESSION, ServicesId);
            }
            return View(apointment);
            
        }

        [HttpPost]
        public ActionResult Index(Apointment model)
        {
            var session = (ShopOnline.Common.UserLogin)Session[ShopOnline.Common.ConstantsCommon.USER_SESSION];
            var ServicesId = (ShopOnline.Common.UserServices)Session[ConstantsCommon.SERVICES_SESSION];
            if (session == null)
            {
                return RedirectToAction("login", "user");
            }
            var client = new UserDao().getClientById(session.ID);
            if (ModelState.IsValid)
            {
                Apointment appointmentModel = new Apointment();
                appointmentModel.Name = model.Name;
                appointmentModel.Email = model.Email;
                appointmentModel.Phone = model.Phone;
                appointmentModel.Note = model.Note;
                appointmentModel.status = -1;
                appointmentModel.BookingDate = model.BookingDate;
                appointmentModel.BookingTime = model.BookingTime;
                appointmentModel.DateCreate = DateTime.Now;
                if (ServicesId != null)
                {
                    appointmentModel.ServicesId = ServicesId.ID;
                }
                else
                {
                    appointmentModel.ServicesId = model.ServicesId;
                }
                appointmentModel.ClientID = client.id;
                model.list = context.Servicesses.ToList();
                var dt = model.BookingDate;
                var dtnow = DateTime.Now;
                var res = DateTime.Compare((DateTime)dt, dtnow);
                if (res < 0 || res == 0)
                {
                    ModelState.AddModelError("", "please, check your clinic date" +
                        " ( the date must be higher than the present day) ");
                    return View("Index", model);
                }
                AppoimentDao dao = new AppoimentDao();
                var rs = dao.Insert(appointmentModel);
                if (rs > 0)
                {

                    ViewBag.Success = "Success!";
                    Session[ConstantsCommon.SERVICES_SESSION] = null;
                    return RedirectToAction("Index", "Thanks");
                }
                else
                {
                    ModelState.AddModelError("", "Error");
                }
            }
            return View(model);

        }

        public ActionResult Details(long id)
        {
            var apointment = context.Apointments.Where(m=>m.Id == id).FirstOrDefault();
            return View(apointment);
        }

        public ActionResult SurgicalServices()
        {
            Apointment apointment = new Apointment();
            apointment.list = context.Servicesses.ToList();
            return View(apointment);

        }

        [HttpPost]
        public ActionResult SurgicalServices(Apointment model)
        {
            var session = (ShopOnline.Common.UserLogin)Session[ShopOnline.Common.ConstantsCommon.USER_SESSION];
            var client = new UserDao().getClientById(session.ID);
            if (ModelState.IsValid)
            {
                Apointment appointmentModel = new Apointment();
                appointmentModel.Name = model.Name;
                appointmentModel.Email = model.Email;
                appointmentModel.Phone = model.Phone;
                appointmentModel.Note = model.Note;
                appointmentModel.status = -1;
                appointmentModel.BookingDate = model.BookingDate;
                appointmentModel.BookingTime = model.BookingTime;
                appointmentModel.DateCreate = DateTime.Now;
                appointmentModel.ServicesId = 6;
                appointmentModel.ClientID = client.id;
                model.list = context.Servicesses.ToList();
                var dt = model.BookingDate;
                var dtnow = DateTime.Now;
                var res = DateTime.Compare((DateTime)dt, dtnow);
                if (res < 0 || res == 0)
                {
                    ModelState.AddModelError("", "please, check your clinic date ( the date must be higher than the present day) ");
                    return View(model);
                }
                AppoimentDao dao = new AppoimentDao();
                var rs = dao.Insert(appointmentModel);
                if (rs > 0)
                {
                    ViewBag.Success = "Success!";
                    return Redirect("/Thanks/Index");
                }
                else
                {
                    ModelState.AddModelError("", "Error");
                }
            }
            return View(model);

        }


    }
}
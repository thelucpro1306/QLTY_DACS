using Model.DAO;
using Model.EF;
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
        public ActionResult Index()
        {
            Apointment apointment = new Apointment();
            apointment.list = context.Servicesses.ToList();
            return View(apointment);
            
        }

        [HttpPost]
        public ActionResult Index(Apointment model)
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
                appointmentModel.ServicesId = model.ServicesId;
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
                    return Redirect("#page-section");
                }
                else
                {
                    ModelState.AddModelError("", "Error");
                }
            }
            return View("Index");

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
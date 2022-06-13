using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace ShopOnline.Areas.Admin.Controllers
{
    public class AppointmentConfirmController : Controller
    {
        OnlineShopDBContext db = new OnlineShopDBContext();
        // GET: Admin/AppointmentConfirm
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new AppoimentDao();
            var list = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(list);
        }

        public ActionResult Create()
        {
            Appointment apointment = new Appointment();
            apointment.list = db.Services.ToList();
            return View(apointment);
        }
        [HttpPost]
        public ActionResult Create(Appointment model)
        {
            
            model.list = db.Services.ToList();
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
                    return Redirect("/Admin/AppointmentConfirm");
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
            var details = db.Appointments.Where(n => n.Id.Equals(id)).FirstOrDefault();
            return View(details);
        }
        public ActionResult Delete(int id)
        {
            var Delete = db.Appointments.Where(n => n.Id.Equals(id)).FirstOrDefault();

            return View(Delete);
        }
        [HttpPost]
        public ActionResult Delete(Appointment model)
        {
            var Delete = db.Appointments.Where(n => n.Id.Equals(model.Id)).FirstOrDefault();
            db.Appointments.Remove(Delete);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Edit(int id)
        {

            var Edit = db.Appointments.Where(n => n.Id.Equals(id)).FirstOrDefault();
            Edit.list = db.Services.ToList();
            return View(Edit);
        }
        [HttpPost]
        public ActionResult Edit(Appointment model)
        {
            model.list = db.Services.ToList();
            var appointmentModel = db.Appointments.SingleOrDefault(s => s.Id == model.Id);
            if (ModelState.IsValid)
            {
                appointmentModel.Name = model.Name;
                appointmentModel.Email = model.Email;
                appointmentModel.Phone = model.Phone;
                appointmentModel.Note = model.Note;
                appointmentModel.status = -1;
                appointmentModel.BookingDate = model.BookingDate;
                appointmentModel.DateCreate = DateTime.Now;
                appointmentModel.ServicesId = model.ServicesId;

                var dt = model.BookingDate;
                var dtnow = DateTime.Now;
                var res = DateTime.Compare((DateTime)dt, dtnow);
                if (res < 0 || res == 0)
                {
                    ModelState.AddModelError("", "please, check your clinic date ( the date must be higher than the present day) ");
                    return View(model);
                }
                AppoimentDao dao = new AppoimentDao();
                var rs = dao.Update(appointmentModel);
                if (rs > 0)
                {
                    ViewBag.Success = "Success!";
                    return Redirect("/Admin/AppointmentConfirm");
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
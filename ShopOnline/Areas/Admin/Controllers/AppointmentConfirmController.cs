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
            Apointment apointment = new Apointment();
            apointment.list = db.Servicesses.ToList();
            return View(apointment);
        }
        [HttpPost]
        public ActionResult Create(Apointment model)
        {
            
            model.list = db.Servicesses.ToList();
            if (ModelState.IsValid)
            {
                Apointment appointmentModel = new Apointment();
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
            var details = db.Apointments.Where(n => n.Id.Equals(id)).FirstOrDefault();
            return View(details);
        }
        public ActionResult Delete(int id)
        {
            var Delete = db.Apointments.Where(n => n.Id.Equals(id)).FirstOrDefault();

            return View(Delete);
        }
        [HttpPost]
        public ActionResult Delete(Apointment model)
        {
            var Delete = db.Apointments.Where(n => n.Id.Equals(model.Id)).FirstOrDefault();
            db.Apointments.Remove(Delete);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Edit(int id)
        {

            var Edit = db.Apointments.Where(n => n.Id.Equals(id)).FirstOrDefault();
            Edit.list = db.Servicesses.ToList();
            return View(Edit);
        }
        [HttpPost]
        public ActionResult Edit(Apointment model)
        {
            model.list = db.Servicesses.ToList();
            var appointmentModel = db.Apointments.SingleOrDefault(s => s.Id == model.Id);
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
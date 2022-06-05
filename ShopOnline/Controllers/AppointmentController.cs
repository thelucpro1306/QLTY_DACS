﻿using Model.DAO;
using Model.EF;
using ShopOnline.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
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
                string content = System.IO.File.ReadAllText(Server.MapPath("~/content/template/neworder.html"));
                var servicess = new ServicesDao().GetServicessById(ServicesId.ID);

                content = content.Replace("{{CustomerName}}", model.Name);
                content = content.Replace("{{Phone}}", model.Phone);
                content = content.Replace("{{Email}}", model.Email);
                content = content.Replace("{{BookingDate}}", model.BookingDate.ToString());
                content = content.Replace("{{BookingTime}}", model.BookingTime.ToString());
                content = content.Replace("{{Servicess}}", servicess.Name);
                content = content.Replace("{{Note}}", model.Note);
                var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();
                
                new MailHelper().SendMail(model.Email, "Pet Clinic", content);
                new MailHelper().SendMail(toEmail, "Pet Clinic", content);

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
            var session = (ShopOnline.Common.UserLogin)Session[ShopOnline.Common.ConstantsCommon.USER_SESSION];           
            if (session == null)
            {
                return RedirectToAction("login", "user");
            }
            var deltailsMedicalForms = context.DeltailsMedicalForms.Where(m=>m.MedicalExaminationForm.id_Appointment == id).FirstOrDefault();
            var appointment = context.Apointments.Where(m=>m.Id == id).FirstOrDefault();
            if(deltailsMedicalForms == null)
            {
                return View("DetailsComing", appointment);
            }
            return View(deltailsMedicalForms);
        }

        
        

    }
}
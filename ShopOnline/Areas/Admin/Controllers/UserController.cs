using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        // GET: Admin/User
        OnlineShopDBContext db = new OnlineShopDBContext();
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            UserDao dao = new UserDao();
            var list = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(list);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var md5Pas = Encryptor.MD5Hash(user.Password);
                user.Password = md5Pas;
                long id = dao.Insert(user);
                if (id > 0)
                {
                    return RedirectToAction("Index", "User");
                }
            }
            else
            {
                ModelState.AddModelError("", "Them thanh cong");
            }
            return View("Index");
        }

    }
}
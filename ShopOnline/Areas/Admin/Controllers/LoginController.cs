using Model.DAO;
using ShopOnline.Areas.Admin.Data;
using ShopOnline.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session[ConstantsCommon.USER_SESSION] = null;
            return Redirect("/admin/login");

        }

        public ActionResult Login(LoginModel loginModel)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var rs = dao.Login(loginModel.Username, Encryptor.MD5Hash(loginModel.Password), true);
                if (rs == 1)
                {
                    var user = dao.getByID(loginModel.Username);
                    var userSession = new UserLogin();
                    userSession.UserName = loginModel.Username;
                    userSession.ID = user.ID;
                    userSession.GroupID = user.GroupID;
                    Session.Add(ConstantsCommon.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (rs == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (rs == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa.");
                }
                else if (rs == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else if (rs == -3)
                {
                    ModelState.AddModelError("", "Tài khoản không có quyền truy cập.");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng");
                }
            }
            return View("Index");
        }
    }
}
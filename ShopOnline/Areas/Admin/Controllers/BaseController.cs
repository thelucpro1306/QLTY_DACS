using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopOnline.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        // GET: Admin/Base
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = Session[Common.ConstantsCommon.USER_SESSION];
            if(session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    System.Web.Routing.RouteValueDictionary(new { 
                        controller = "Login", action = "Index" ,Areas = "admin" 
                    }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}
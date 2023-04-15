using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace ECommerce.Auth
{
    public class CheckAdminAccess : ActionFilterAttribute, IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext filterContext)
        {
            if (filterContext.HttpContext.Session.GetString("UserID") == null && filterContext.HttpContext.Session.GetString("RoleType") != "Admin")
            {
                filterContext.Result = new RedirectResult("~/Admin");
            }

            var rd = filterContext.RouteData;
            //string currentArea = rd.Values["Area"].ToString();
            string currentAction = rd.Values["action"].ToString();
            string currentController = rd.Values["controller"].ToString();
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            filterContext.HttpContext.Response.Headers["Cache-Control"] = "no-cache, no-store, must-revalidate";
            filterContext.HttpContext.Response.Headers["Expires"] = "-1";
            filterContext.HttpContext.Response.Headers["Pragma"] = "no-cache";
            base.OnResultExecuting(filterContext);
        }
    }
}

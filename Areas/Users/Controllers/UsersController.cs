using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;

namespace ECommerce.Areas.Users.Controllers
{
    public class UsersController : Controller
    {
        // GET: UsersController
        public ActionResult Index()
        {
            return RedirectToAction("~/Admin/Home");
        }

        [HttpPost]
        public IActionResult Login(Areas.Users.Models.Users modelUser)
        {
            String error = null;

            if(modelUser.Name == null )
            {
                error  += "User Name is Required";
            }
            if(modelUser.Password == null )
            {
                error  += "<br/>Password is Required";
            }

            if(error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("Index");
            }
            else{
                UserDAL userDAL = new UserDAL();
                DataTable dt = userDAL.PR_User_SelectByIDPass(modelUser.Name,modelUser.Password);
                if(dt.Rows.Count > 0)
                {
                    foreach(DataRow dr in dt.Rows)
                    {
                        HttpContext.Session.SetInt32("UserID",Convert.ToInt32(dr["UserID"]));
                        HttpContext.Session.SetString("UserName",dr["UserName"].ToString());
                        HttpContext.Session.SetString("Password",dr["Password"].ToString());
                        HttpContext.Session.SetString("RoleType",dr["RoleType"].ToString());
                        break;
                    }
                }
                else
                {
                    TempData["Error"] = "User Name and Password is Incorect";
                    return RedirectToAction("Index");
                }
                if(HttpContext.Session.GetString("UserName") != null && HttpContext.Session.GetString("Password") != null)
                {
                    return RedirectToAction("Index","Home");
                }
            }
            return RedirectToAction("Index");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index","Admin");
        }
    }
}

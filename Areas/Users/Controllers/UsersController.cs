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
            return RedirectToAction("Home","Admin");
        }

        [HttpPost]
        public IActionResult Login(Areas.Users.Models.Users modelUser)
        {
            String error = null;

            if(modelUser.Email == null )
            {
                error  += "User Email is Required";
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
                DataTable dt = userDAL.PR_User_SelectByIDPass(modelUser.Email,modelUser.Password);
                if(dt.Rows.Count > 0)
                {
                    foreach(DataRow dr in dt.Rows)
                    {
                        HttpContext.Session.SetInt32("UserId",Convert.ToInt32(dr["UserId"]));
                        HttpContext.Session.SetString("Email",dr["Email"].ToString());
                        HttpContext.Session.SetString("Name",dr["Name"].ToString());
                        HttpContext.Session.SetString("Password",dr["Password"].ToString());
                        HttpContext.Session.SetString("RoleType",dr["RoleType"].ToString());
                        HttpContext.Session.SetString("ImageUrl",dr["ImageUrl"].ToString());
                        break;
                    }
                }
                else
                {
                    TempData["Error"] = "User Name and Password is Incorect";
                    return RedirectToAction("Index");
                }
                if(HttpContext.Session.GetString("Email") != null && HttpContext.Session.GetString("Password") != null)
                {
                    return RedirectToAction("Home","Admin");
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

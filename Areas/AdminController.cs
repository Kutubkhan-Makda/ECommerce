using Microsoft.AspNetCore.Mvc;
using ECommerce.Auth;

namespace ECommerce.Areas
{
    public class AdminController : Controller
    {
        [CheckAdminAccess]
        public IActionResult Home()
        {
            return View("../Home/Index");
        }

        public IActionResult Index()
        {
            return View("../Home/Login");
        }

        public IActionResult Register()
        {
            return View("../Home/Register");
        }
    }
}

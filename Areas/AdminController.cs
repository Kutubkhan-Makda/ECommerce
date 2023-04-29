using Microsoft.AspNetCore.Mvc;
using ECommerce.Auth;

namespace ECommerce.Areas
{
    public class AdminController : Controller
    {
        [CheckAdminAccess]
        public IActionResult Home()
        {
            return View("../Admin/Dashboard");
        }

        public IActionResult Index()
        {
            return View("../Admin/Login");
        }

        public IActionResult Register()
        {
            return View("../Admin/Register");
        }
        
        [CheckAdminAccess]
        public IActionResult Calendar()
        {
            return View("../Admin/Calendar");
        }
    }
}

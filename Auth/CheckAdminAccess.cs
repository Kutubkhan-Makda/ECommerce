using Microsoft.AspNetCore.Mvc;

namespace ECommerce.Auth
{
    public class CheckAdminAccess : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

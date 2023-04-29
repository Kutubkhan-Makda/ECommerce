using System.Diagnostics;
using ECommerce.Models;
using Microsoft.AspNetCore.Mvc;
using ECommerce.Auth;

namespace ECommerce.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Login()
        {
            return View("../Users/LoginRegister");
        }

        [CheckUsersAccess]
        public IActionResult Index()
        {
            return View("../Users/Home");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
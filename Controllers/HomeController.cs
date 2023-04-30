using System.Diagnostics;
using ECommerce.Models;
using Microsoft.AspNetCore.Mvc;
using ECommerce.Auth;
using ECommerce.DAL;
using System.Data;

namespace ECommerce.Controllers
{
    public class HomeController : Controller
    {
        CartDAL cartDAL = new CartDAL();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Login()
        {
            return View("../Users/LoginRegister");
        }

        //[CheckUsersAccess]
        public IActionResult Index()
        {
            DataTable dtCart = cartDAL.PR_Cart_SelectbyUser(@CV.UserId());
            return View("../Users/Home",dtCart);
        }

        public IActionResult About()
        {
            return View("../Users/About");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
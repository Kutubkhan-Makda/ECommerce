using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using EMedicine.Models;

namespace EMedicine.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class UsersController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public UsersController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        [Route("registration")]
        public Response Register(Users users)
        {
            DAL dALCon = new DAL();

            Response response = dALCon.register(users);
            return response;
        }

        [HttpPost]
        [Route("login")]
        public Response Login(Users users)
        {
            DAL dALCon = new DAL();

            Response response = dALCon.Login(users);
            return response;
        }

        public Response Login(Users users)
        {
            DataTable dt = dalLOC.PR_LOC_Country_SelectAll();
            return View("LOC_CountryList", dt);
        } 
    }
}
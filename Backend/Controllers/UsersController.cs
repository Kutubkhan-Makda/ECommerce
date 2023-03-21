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

        [HttpPost]
        [Route("viewUser")]
        public Response viewUser(Users users)
        {
            DAL dALCon = new DAL();
            Response response = dALCon.viewUser(users);
            return response;
        }

        [HttpPost]
        [Route("updateProfile")]
        public Response updateProfile(Users users)
        {
            DAL dALCon = new DAL();
            Response response = dALCon.updateProfile(users);
            return response;
        }
    }
}
using Microsoft.AspNetCore.Http;

namespace ECommerce.Auth
{
    public static class CV
    {
        public static IHttpContextAccessor _HttpContextAccessor;

        static CV()
        {
            _HttpContextAccessor = new HttpContextAccessor();
        }

        public static string? Name()
        {
            string? Name = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("Name") != null)
            {
                Name = _HttpContextAccessor.HttpContext.Session.GetString("Name").ToString();
            }
            return Name;
        }

        public static string? ImageUrl()
        {
            string? ImageUrl = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("ImageUrl") != null)
            {
                ImageUrl = _HttpContextAccessor.HttpContext.Session.GetString("ImageUrl").ToString();
            }
            return ImageUrl;
        }

        public static int? UserID()
        {
            int? UserID = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("UserID") != null)
            {
                UserID = Convert.ToInt32(_HttpContextAccessor.HttpContext.Session.GetInt32("UserID"));
            }
            return UserID;
        }
    }
}
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

        public static string? UserName()
        {
            string? UserName = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("UserName") != null)
            {
                UserName = _HttpContextAccessor.HttpContext.Session.GetString("UserName").ToString();
            }
            return UserName;
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

        public static int? UserId()
        {
            int? UserId = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("UserId") != null)
            {
                UserId = Convert.ToInt32(_HttpContextAccessor.HttpContext.Session.GetInt32("UserId"));
            }
            return UserId;
        }

        public static string? Address()
        {
            string? Address = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("Address") != null)
            {
                Address = _HttpContextAccessor.HttpContext.Session.GetString("Address").ToString();
            }
            return Address;
        }
    }
}
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

        public static string? Password()
        {
            string? Password = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("Password") != null)
            {
                Password = _HttpContextAccessor.HttpContext.Session.GetString("Password").ToString();
            }
            return Password;
        }

        public static int? CountryID()
        {
            int? CountryID = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("CountryID") != null)
            {
                CountryID = Convert.ToInt32(_HttpContextAccessor.HttpContext.Session.GetInt32("CountryID"));
            }
            return CountryID;
        }

        public static string? Email()
        {
            string? Email = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("Email") != null)
            {
                Email = _HttpContextAccessor.HttpContext.Session.GetString("Email").ToString();
            }
            return Email;
        }

        public static string? RoleType()
        {
            string? RoleType = null;

            if(_HttpContextAccessor.HttpContext.Session.GetString("RoleType") != null)
            {
                RoleType = _HttpContextAccessor.HttpContext.Session.GetString("RoleType").ToString();
            }
            return RoleType;
        }
    }
}
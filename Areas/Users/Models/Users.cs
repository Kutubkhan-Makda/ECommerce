namespace ECommerce.Areas.Users.Models
{
    public class Users
    {
        public int? UserId { get; set; }
        public int RoleId { get; set; }
        public String RoleType { get; set; }
        public String UserName { get; set; }
        public String Email { get; set; }
        public String Password { get; set; }
        public int CountryID { get; set; }
        public String CountryName { get; set; }
        public String Address { get; set; }
        public IFormFile File { get; set; }
        public String ImageUrl { get; set; }
        public DateTime CreatedON { get; set; }
    }

    public class CountryDropdown
    {
        public int? CountryID { get; set; }
        public int CountryName { get; set; }
    }
}

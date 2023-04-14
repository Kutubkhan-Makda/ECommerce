namespace ECommerce.Areas.Users.Models
{
    public class Users
    {
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public string RoleType { get; set; }
        public String Name { get; set; }
        public String Email { get; set; }
        public String Password { get; set; }
        public String Address { get; set; }
        public DateTime CreatedON { get; set; }
    }
}

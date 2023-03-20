namespace EMedicine.Models
{
    public class Users
    {
        public int UserId {get;set;}
        public string Name {get;set;}
        public string Email {get;set;}
        public string Password {get;set;}
        public string Address {get;set;}
        public string Type {get;set;}
        public int Status {get;set;}
        public DateTime CreatedON {get;set;}
    }
}
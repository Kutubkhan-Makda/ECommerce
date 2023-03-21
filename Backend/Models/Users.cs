namespace EMedicine.Models
{
    public class Users
    {
        public int UserId {get;set;}
        public String Name {get;set;}
        public String Email {get;set;}
        public String Password {get;set;}
        public String Address {get;set;}
        public String Type {get;set;}
        public int Status {get;set;}
        public DateTime CreatedON {get;set;}
    }
}
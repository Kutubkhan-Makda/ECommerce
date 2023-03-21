namespace EMedicine.Models
{
    public class Products
    {
        public int ProductId {get;set;}
        public String Name {get;set;}
        public String Manufacturer {get;set;}
        public String Description {get;set;}
        public Decimal Price {get;set;}
        public Decimal Discount {get;set;}
        public int Quantity {get;set;}
        public DateTime ExpDate {get;set;}
        public int Status {get;set;}
        public String ImageUrl {get;set;}
    }
}
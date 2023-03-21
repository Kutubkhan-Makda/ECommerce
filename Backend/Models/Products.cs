namespace EMedicine.Models
{
    public class Products
    {
        public int ProductId {get;set;}
        public string Name {get;set;}
        public string Manufacturer {get;set;}
        public string Description {get;set;}
        public decimal Price {get;set;}
        public decimal Discount {get;set;}
        public int Quantity {get;set;}
        public DateTime ExpDate {get;set;}
        public int Status {get;set;}
        public string ImageUrl {get;set;}
    }
}
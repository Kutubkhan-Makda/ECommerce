namespace EMedicine.Models
{
    public class OrderItems
    {
        public int OrderItemId {get;set;}
        public int OrderId {get;set;}
        public int ProductId {get;set;}
        public int Quantity {get;set;}
        public Decimal Price {get;set;}
        public Decimal Discount {get;set;}
        public Decimal TotalPrice {get;set;}
    }
}
namespace ECommerce.Areas.Cart.Models
{
    public class Cart
    {
        public int? CartId { get; set; }
        public int UserId { get; set; }
        public String UserName { get; set; }
        public int ProductId { get; set; }
        public Decimal Price { get; set; }
        public String Name { get; set; }
        public String ImageUrl { get; set; }
        public int Quantity { get; set; }
        public Decimal TotalPrice { get; set; }
    }
}

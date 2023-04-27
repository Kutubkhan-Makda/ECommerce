namespace ECommerce.Areas.Cart.Models
{
    public class Cart
    {
        public int? CartId { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public Decimal TotalPrice { get; set; }
    }
}

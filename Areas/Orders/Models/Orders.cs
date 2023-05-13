namespace ECommerce.Areas.Orders.Models
{
    public class Orders
    {
        public int? OrderId { get; set; }
        public int UserId { get; set; }
        public String OrderNo { get; set; }
        public Decimal TotalPrice { get; set; }
        public String ShippingAddress { get; set; }
        public DateTime OrderDate { get; set; }
        public String OrderStatus { get; set; }
    }
}

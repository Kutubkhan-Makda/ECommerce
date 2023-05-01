namespace ECommerce.Areas.Sales.Models
{
    public class Sales
    {
        public int? SalesId { get; set; }
        public int ProductId { get; set; }
        public int Discount { get; set; }
    }
}
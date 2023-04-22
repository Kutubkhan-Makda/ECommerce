using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace ECommerce.Areas.Products.Models
{
    public class Products
    {
        public int? ProductId { get; set; }
        public int CategoryId { get; set; }
        public String Name { get; set; }
        public int ManufacturerId { get; set; }
        public String Description { get; set; }
        public Decimal Price { get; set; }
        public Decimal Discount { get; set; }
        public int Quantity { get; set; }
        public DateTime ExpDate { get; set; }
        public IFormFile File { get; set; }
        public String ImageUrl { get; set; }
    }
}

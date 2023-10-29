using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class OrderDetail
    {
        [Key]
        public int id { get; set; }
        [ForeignKey("Order")]
        public int OrderId { get; set; } = 0;
        public Order? Order { get; set; } = null;

        [ForeignKey("Product")]
        public int ProductId { get; set; } = 0;
        public Product? Product { get; set; } = null;

        [Required]
        [StringLength(100)]
        public string? Color {  get; set; }
        public int Quantity { get; set; }
    }
}

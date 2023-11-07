using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class OrderDetail
    {
        [Key]
        public int OrderDetailId { get; set; }

        [ForeignKey("Order")]
        public int OrderId { get; set; }
        public Order? Order { get; set; }

        [ForeignKey("Product")]
        public int ProductId { get; set; }
        public Product? Product { get; set; }

        [Required]
        [StringLength(100)]
        public string? Color {  get; set; }
        public int Quantity { get; set; }
        public bool isReview { get; set; } = false;

        public OrderDetail(int orderId,int productId,string color, int quantity, bool isreview)
        {
            OrderId = orderId;
            ProductId = productId;
            Color = color;
            Quantity = quantity;
            isReview = isreview;
        }
        public OrderDetail() { }
    }
}

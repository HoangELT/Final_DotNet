using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class ProductColor
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Product")]
        public int ProductId { get; set; }
        public Product? product { get; set; }

        [ForeignKey("Color")]
        public int ColorId { get; set; }
        public Color? color { get; set; }
        public ProductColor(int productId, int colorId)
        {
            ProductId = productId;
            ColorId = colorId;
        }
        public ProductColor() { }
    }
}

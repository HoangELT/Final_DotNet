using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Final_DotNet.Models
{
    public class Product
    {
        public int Id { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Name { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Description { get; set; }
        [NotNull]
        [MaxLength(1000)]
        public double Price { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Color { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Brand { get; set; }
        public Category Category { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }
    }
}

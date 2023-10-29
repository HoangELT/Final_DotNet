using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using System.Text.Json.Serialization;

namespace Final_DotNet.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; } = string.Empty;

        [Required]
        [MaxLength(50000)]
        public string Description { get; set; } = string.Empty;
        [Required]
        [MaxLength(5000)]
        public string? SmallDescription { get; set; } = string.Empty;
        [Required]
        public double DisPrice { get; set; } = 0;

        [Required]
        public double CurPrice { get; set; } = 0;
        [Required]
        [MaxLength(500)]
        public string ImageUrl { get; set; } = string.Empty;

        [JsonIgnore]
        public ICollection<ProductColor> Colors { get; set; } = new HashSet<ProductColor>();

        [ForeignKey("Brand")]
        public int BrandId { get; set; }
        [JsonIgnore]
        public Brand? Brand { get; set; }

        // khóa ngoại từ catagory
        [ForeignKey("Catagory")]
        public int CategoryId { get; set; }
        [JsonIgnore]
        public Category? Category { get; set; }

        [JsonIgnore]
        public ICollection<OrderDetail> Orders { get; set; } = new HashSet<OrderDetail>();

        [JsonIgnore]
        public ICollection<Review> UserReviews { get; set; } = new HashSet<Review>();

        public Product(string name, string description, string smallDescription, double curprice, double disprice, string imgUrl, int brandId, int categoryId)
        {
            Name = name;
            Description = description;
            SmallDescription = smallDescription;
            CurPrice = curprice;
            DisPrice = disprice;
            ImageUrl = imgUrl;
            CategoryId = categoryId;
            BrandId = brandId;
        }
        public Product() { }
    }
}

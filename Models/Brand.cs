using System.ComponentModel.DataAnnotations;

namespace Final_DotNet.Models
{
    public class Brand
    {
        [Key]
        public int BrandId { get; set; }
        [Required]
        [MaxLength(255)]
        public string? Name { get; set; }

        public ICollection<Product> Products { get; set; } = new HashSet<Product>();

        public Brand(string name)
        {
            this.Name = name;
        }
        public Brand()
        {
        }
    }
}

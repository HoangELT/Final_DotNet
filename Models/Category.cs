using System.ComponentModel.DataAnnotations;

namespace Final_DotNet.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required]
        [MaxLength(100)]
        public string? Name { get; set; } = string.Empty;
        [Required]
        [MaxLength(500)]
        public string? Description { get; set; } = string.Empty;

        public ICollection<Product> Products { get; set; } = new HashSet<Product>();

        public Category(string name, string description)
        {
            this.Name = name;
            this.Description = description;
        }
        public Category() { }
    }
}

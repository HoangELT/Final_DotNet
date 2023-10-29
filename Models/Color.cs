using System.ComponentModel.DataAnnotations;

namespace Final_DotNet.Models
{
    public class Color
    {
        [Key]
        public int ColorId { get; set; }

        [Required]
        [MaxLength(100)]
        public string? Name { get; set; }

        public ICollection<ProductColor> Products { get; set; } = new HashSet<ProductColor>();

        public Color(string name)
        {
            this.Name = name;
        }
        public Color()
        {
        }
    }
}

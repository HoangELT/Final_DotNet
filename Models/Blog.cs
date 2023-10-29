using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class Blog
    {
        [Key]
        public int BlogId { get; set; } = 0;
        [Required]
        [MaxLength(50)]
        public string Title { get; set; } = string.Empty;
        [Required]
        [MaxLength(500)]
        public string SmallContent { get; set; } = string.Empty;
        [Required]
        [MaxLength(50000)]
        public string Content { get; set; } = string.Empty;
        [Required]
        [MaxLength(50000)]
        public string Image { get; set; } = string.Empty;
        [Required]
        [MaxLength(500)]
        public string Description { get; set; } = string.Empty;
        public DateTime CreateAt { get; set; } = DateTime.Now;

        [ForeignKey("User")]
        public int UserId {  get; set; }
        public User? User { get; set; }

    }
}

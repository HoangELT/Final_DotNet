using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class Review
    {
        [Key]
        public int ReviewId { get; set; }
        [ForeignKey("User")]
        public int UserId { get; set; }

        [ForeignKey("Product")]
        public int ProductId { get; set; }

        public int Rating { get; set; } = 5;

        [MaxLength(5000)]
        public string? Comment { get; set; } = string.Empty;
        public DateTime Create_at { get; set; } = DateTime.Now;
        public User? User { get; set;}
        public Product? Product { get; set; }

        public Review(int userID, int productId, int rating, string comment) {
            this.Comment = comment;
            this.UserId = userID;
            this.ProductId = productId;
            this.Rating = rating;
        }
        public Review() { }
    }
}

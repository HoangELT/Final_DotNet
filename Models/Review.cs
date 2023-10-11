namespace Final_DotNet.Models
{
    public class Review
    {
        public int Id { get; set; }
        public int Rating { get; set; }
        public string? Comment { get; set; }
        public DateTime Create_at { get; set; }
        public User? user { get; set;}
        public Product? product { get; set; }
    }
}

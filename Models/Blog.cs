namespace Final_DotNet.Models
{
    public class Blog
    {
        public int Id { get; set; }
        public string Tile { get; set; }
        public string SmallContent { get; set; }
        public string Content { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public DateTime CreateAt { get; set; } = DateTime.Now;

        public User User { get; set; }

    }
}

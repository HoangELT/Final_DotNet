namespace Electric_Store.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public double Price { get; set; }
        public string? Color { get; set; }
        public string? Brand { get; set; }
        public Category? category { get; set; }
    }
}

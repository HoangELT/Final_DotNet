namespace Final_DotNet.Models.Page
{
    public class ProductListView
    {
        public IEnumerable<Product> Products { get; set; } = Enumerable.Empty<Product>();
        public PaginInfo PaginInfo { get; set; } = new PaginInfo();
    }
}

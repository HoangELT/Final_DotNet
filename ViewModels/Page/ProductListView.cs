using Final_DotNet.Models;

namespace Final_DotNet.ViewModels.Page
{
    public class ProductListView
    {
        public IEnumerable<Product> Products { get; set; } = Enumerable.Empty<Product>();
        public PaginInfo PaginInfo { get; set; } = new PaginInfo();
    }
}

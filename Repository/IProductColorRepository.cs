using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IProductColorRepository
    {
        public List<Color> GetProductColor(int productId);
        public List<Product> GetProductbyColorId(int colorId);
        public List<ProductColor> GetAllProductColor();
        public void updateProductColor(int productId, string colors);
        public void addProductColor(int productId, int colorId);
        public List<Product> FilterColorProduct(int colorId);
    }
}

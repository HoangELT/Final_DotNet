using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IProductRepository
    {
        public List<Product> GetAllProduct();
        public Product GetProductById(int id);
        public Product GetProductByName(string name);
        public void deleteProduct(int prouductId);
        public void addProduct(string name, string description, string smallDescription, double curprice, double disprice, string imgUrl, int brandId, int categoryId, string colors);
        public void updateProduct(Product prouduct);
        public int toTalProduct();

    }
}

using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.EntityFrameworkCore;

namespace Final_DotNet.Service
{
    public class ProductService : IProductRepository
    {
        private List<Product> listpro = new List<Product>();
        private readonly StoreDbContext _dbContext;
        private readonly IProductColorRepository productColorRepository;
        
        public ProductService(StoreDbContext db, IProductColorRepository productColorRepository)
        {
            _dbContext = db;
            this.productColorRepository = productColorRepository;
        }
        public List<Product> GetAllProduct()
        {
            listpro = _dbContext.Products.Include(p => p.Brand)
                                        .Include(p => p.Colors)
                                        .Include(p => p.Category)
                                        .ToList();
            return listpro;
        }

        public Product GetProductById(int id)
        {
            var pro = _dbContext.Products.Include(p => p.Brand)
                                        .Include(p => p.Colors)
                                        .Include(p => p.Category)
                                        .FirstOrDefault(p => p.ProductId == id);
            return pro;
        }

        public bool deleteProduct(int prouductId)
        {
            var pro = _dbContext.Products.Find(prouductId);
            var proColor = _dbContext.ProductColors.Where(p => p.ProductId == prouductId).ToList();
            if (pro != null && proColor != null)
            {
                _dbContext.Products.Remove(pro);
                _dbContext.ProductColors.RemoveRange(proColor);
                _dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool updateProduct(Product product)
        {
            var pro = GetProductById(product.ProductId);
            if(pro!= null)
            {
                pro.Name = product.Name;
                pro.Description = product.Description;
                pro.BrandId = product.BrandId;
                pro.CategoryId = product.CategoryId;
                pro.DisPrice = product.DisPrice;
                pro.CurPrice = product.CurPrice;
                pro.ImageUrl = product.ImageUrl;
                pro.SmallDescription = product.SmallDescription;
                _dbContext.Products.Update(pro);
                _dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool addProduct(string name, string description, string smallDescription, double curprice, double disprice, string imgUrl, int brandId, int categoryId, string colors)
        {
            string[] ColorIds = colors.Split(",");
            var pro = _dbContext.Products.FirstOrDefault(p => p.Name == name);
            if(pro == null)
            {
                _dbContext.Products.Add(new Product(name, description, smallDescription, curprice, disprice, imgUrl, brandId, categoryId));
                _dbContext.SaveChanges();

                int productId = _dbContext.Products.OrderByDescending(p => p.ProductId).First().ProductId;
                foreach (var k in ColorIds)
                {
                    productColorRepository.addProductColor(productId, Int32.Parse(k));
                }
                return true;
            }
            return false;
        }

        public int toTalProduct()
        {
            return _dbContext.Products.Count();
        }
    }
}

using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.EntityFrameworkCore;

namespace Final_DotNet.Service
{
    public class ProductColorService : IProductColorRepository
    {
        private readonly StoreDbContext dbContext;
        public ProductColorService(StoreDbContext db)
        {
            dbContext = db;
        }

        public void addProductColor(int productId, int colorId)
        {
            dbContext.ProductColors.Add(new ProductColor(productId, colorId));
            dbContext.SaveChanges();
        }

        public List<ProductColor> GetAllProductColor()
        {
            var list = dbContext.ProductColors.Include(p=>p.product).Include(p => p.color).ToList();
            return list;
        }

        public List<Product> GetProductbyColorId(int colorId)
        {
            var list = dbContext.ProductColors.Where(p=> p.ColorId==colorId).Select(p=>p.product).ToList();
            return list;
        }

        //lay list color tu productcolor theo product id
        public List<Color> GetProductColor(int productId)
        {
            List<Color> listcolor = dbContext.ProductColors.Where(p => p.ProductId == productId).Select(p => p.color).ToList();
            return listcolor;
        }

        public void updateProductColor(int productId, string colors)
        {
            string[] selectedColorIds = colors.Split(",");
            int[] colorIds = selectedColorIds.Select(int.Parse).ToArray();

            var productColorsToRemove = dbContext.ProductColors.Where(pc => pc.ProductId == productId);
            dbContext.ProductColors.RemoveRange(productColorsToRemove);
            foreach (var colorId in colorIds)
            {
                dbContext.ProductColors.Add(new ProductColor(productId, colorId));
            }
            dbContext.SaveChanges();
        }


    }
}

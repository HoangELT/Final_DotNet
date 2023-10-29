using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.EntityFrameworkCore;

namespace Final_DotNet.Service
{
    public class BrandService : IBrandRepository
    {
        private List<Brand> listBrand = new List<Brand>();
        private readonly StoreDbContext dbContext;
        public BrandService(StoreDbContext dbContext) { 
            this.dbContext = dbContext;
        }
        public List<Brand> GetListBrand()
        {
            listBrand = dbContext.Brands.ToList();
            return listBrand;
        }

        public Brand GetBrandById(int id)
        {
            var brand = dbContext.Brands.Find(id);
            return brand;
        }

        public void updateBrand(Brand brand)
        {
            var updatebrand = GetBrandById(brand.BrandId);
            updatebrand.Name = brand.Name;
            dbContext.Brands.Update(updatebrand);
            dbContext.SaveChanges();
        }

        public void addBrand(string name)
        {
            var brand = dbContext.Brands.FirstOrDefault(p => p.Name == name);
            if(brand == null)
            {
                dbContext.Brands.Add(new Brand(name));
                dbContext.SaveChanges();
            }
        }

        public void deleteBrand(int id)
        {

            var brand = dbContext.Brands.Find(id);
            if (brand != null)
            {
                dbContext.Brands.Remove(brand);
                dbContext.SaveChanges();
            }
        }
    }
}

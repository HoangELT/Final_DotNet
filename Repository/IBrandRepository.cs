using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IBrandRepository
    {
        public List<Brand> GetListBrand();
        public Brand GetBrandById(int id);
        public void updateBrand(Brand brand);
        public void addBrand(string name);
        public void deleteBrand(int id);
    }
}

using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IBrandRepository
    {
        public List<Brand> GetListBrand();
        public Brand GetBrandById(int id);
        public bool updateBrand(Brand brand);
        public bool addBrand(string name);
        public bool deleteBrand(int id);
    }
}

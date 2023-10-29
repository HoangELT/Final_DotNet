using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface ICategoryRepository
    {
        public List<Category> getAllCategories();

        public List<Product> getAllproductCategory(string name);
        public void addCategory(string name, string description);
        public void deleteCategory(int categoryId);
        public void updateCategory(Category category);
    }
}

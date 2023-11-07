using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface ICategoryRepository
    {
        public List<Category> getAllCategories();

        public List<Product> getAllproductCategory(string name);
        public Category getCategorybyId(int categoryId);
        public bool addCategory(string name, string description);
        public bool deleteCategory(int categoryId);
        public bool updateCategory(Category category);
    }
}

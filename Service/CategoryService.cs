using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace Final_DotNet.Service
{
    public class CategoryService : ICategoryRepository
    {
        private readonly StoreDbContext _dbContext;
        private List<Category> _categories = new List<Category>();
        public CategoryService(StoreDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public void addCategory(string name, string description)
        {
            _dbContext.Categories.Add(new Category(name, description));
            _dbContext.SaveChanges();      
        }

        public void deleteCategory(int categoryId)
        {
            var cate = _dbContext.Categories.Find(categoryId);
            if(cate != null)
            {
                _dbContext.Categories.Remove(cate);
                _dbContext.SaveChanges();
            }
        }
        public void updateCategory(Category category)
        {
            foreach(var cate in _dbContext.Categories.ToList())
            {
                if(cate.CategoryId==category.CategoryId)
                {
                    cate.Description = category.Description;
                    cate.Name = category.Name;
                    _dbContext.Categories.Update(cate);
                    _dbContext.SaveChanges();
                }
            }
        }

        public List<Category> getAllCategories()
        {
            _categories = _dbContext.Categories.ToList();
            return _categories;
        }

        public List<Product> getAllproductCategory(string name)
        {
            List<Product> listpro = _dbContext.Products.Include(p => p.Category).Where(x => x.Category.Name.Equals(name)).ToList();
            return listpro;
        }
    }
}

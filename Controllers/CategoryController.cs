using Final_DotNet.Models;
using Final_DotNet.Repository;
using Final_DotNet.Service;
using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryRepository categoryRepository;
        public CategoryController(ICategoryRepository categoryRepository)
        {
            this.categoryRepository = categoryRepository;
        }
        public ActionResult Index(string name)
        {
            return View(categoryRepository.getAllproductCategory(name));
        }
    }
}

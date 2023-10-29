using Final_DotNet.Infrastructure;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewComponents;

namespace Final_DotNet.Components
{
    public class Navbar:ViewComponent
    {
        private readonly ICategoryRepository categoryRepository;
        public Navbar(ICategoryRepository categoryRepo)
        {
            categoryRepository = categoryRepo;
        }
        public IViewComponentResult Invoke()
        {
            Cart cart = HttpContext.Session.GetJson<Cart>("cart");
            if(cart != null) {
                ViewBag.TotalitemCart = cart.TotalProduct();
            }
            else
            {
                ViewBag.TotalitemCart = 0;
            }
            return View(categoryRepository.getAllCategories());
        }
    }
}

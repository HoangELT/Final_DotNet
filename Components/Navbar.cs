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
        private readonly IUserRoleRepository userroleRepo;
        public Navbar(ICategoryRepository categoryRepo, IUserRoleRepository userroleRepo)
        {
            categoryRepository = categoryRepo;
            this.userroleRepo = userroleRepo;
        }
        public IViewComponentResult Invoke()
        {
            Cart cart = HttpContext.Session.GetJson<Cart>("cart");
            User user = HttpContext.Session.GetJson<User>("UserLogin");
            if (user != null)
            {
                if(userroleRepo.AuthUserAdmin(user))
                {
                    ViewBag.isLogin = true;
                    ViewBag.isAdmin = true;
                }
                else
                {
                    ViewBag.isLogin = true;
                    ViewBag.isAdmin = false;
                }
            }
            else
            {
                ViewBag.isAdmin = false;
                ViewBag.isLogin = false;
            }

            if (cart != null) {
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
